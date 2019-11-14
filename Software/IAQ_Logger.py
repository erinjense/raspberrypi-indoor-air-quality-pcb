#!/usr/bin/python
from IAQ_AnalogPortController import *
from GUI.IAQ_GUI import GUI
from Sensors.IAQ_Sensor import SensorIdEnum
from Sensors.IAQ_MqGas import MqGas
from Sensors.IAQ_Sensor import Sensor
from IAQ_FileHandler import FileHandler
from IAQ_Exceptions import *
import time
import logging
import sys
import datetime

class Logger:
    ############################
    # GUI Control
    ############################
    gui = None
    ############################
    # CSV FileHandler
    ############################
    csv = None
    ############################
    # Analog Port Control
    ############################
    analogPorts = None
    ############################

    ############################
    # Sensor Control
    ############################
    sensorConfigDict = {}
    sensorsDict = {}
    ############################

    #############################
    # Logger Setup Specifications
    #############################
    setup_path  = None   # This is assigned to DEFAULT_PATH if user does not specify
    logger_id   = None
    logger_type = None
    softwareVersion = None  
    sensor_names = []       
    setup_info = []
    #############################

    def __init__(self):
        # Init: FileHandler
        self.csv = FileHandler()
        try:
            status = self._initFromDb(self.setup_path)
        except SetupFileError:
            self._printBanner("Setup FAILURE")
            raise LoggerSetupError('LoggerSetupError: Could not get sensor configuration.')
        # Init: AnalogPortController
        self.analogPorts = AnalogPortController(self.sensorConfigDict) 
        # Init: Sensors
        self._initSensors()
        # Init: GUI
        self.gui = GUI(self.sensorConfigDict)
        self._printBanner("Setup SUCCESS")
 
    #################################################################
    # External API
    #################################################################
    def log(self):
        # Log data routine for every MQ Sensor
        for name,sensor in self.sensorsDict.items():
            try:
                if sensor.status == "OFF": continue
                dataList = []
                # Date/Time is System clock
                # System clock is updated from a GPS if available.
                date = str(datetime.datetime.now().date())
                time = str(datetime.datetime.now().time())
                loc  = 0
                # TODO: Add BME680 for humidity and temp.
                temp = 0
                humidity = 0
                # Get sensor data
                data = sensor.getData()
                # Create list in order of database storage
                for item in (date,time,loc,temp,humidity,data):
                    dataList.append(item)
                # Write to database
                data = self.csv.writeSensorData(dataList,sensor.sid)
                self.gui.displayData(sensor.port, data)
            except SensorReadError:
                self.printSystem("Could not read sensor: "+name)
                continue
            except SensorSetupError:
                self.printSystem("Could not setup sensor: "+name)
                continue

    def updateGui(self):
        user_updated_sensors = self.gui.checkUserUpdates()
        if (True == user_updated_sensors):
            self.sensorConfigDict = self.gui.get_portStatus()    
            print self.sensorConfigDict
            self._initSensors()

        self.gui.update()
        self.gui.update_idletasks()

    def printSystem(self,msg,sensorId=None):
        try:
            self.gui.startpage_output(msg)
            return True
        except AttributeError:
            print("Fatal Error: GUI failed to load.")
            return False

    #################################################################
    # Internal Functions
    #################################################################
    def _initFromDb(self,filepath=None):
        self.csv.createDefaultDatabase()
        self.sensorConfigDict = self.csv.getSensorConfig()

    def _initSensors(self):
        for name,config in self.sensorConfigDict.items():
            config = dict(config)
            try:
                sensor = Sensor(config, self.analogPorts)
            except SensorIsOff:
                continue
            self.sensorsDict[name] = sensor

    def _printBanner(self,midText=None):
        hashes = "##################################################\n"
        spaces = (len(hashes) + len(midText))/2
        midText = midText.rjust(spaces) + "\n"
        banner = hashes + midText + hashes
        self.printSystem(banner)
################################################################################
# Main Loop
################################################################################
logger = None
start = time.time()
while True:
    # TODO: There needs to be a safe mode where the logger boots up into
    # default settings mode if some configuration causes a LoggerSetupError
    if logger == None:
        try:
            logger = Logger()
        except LoggerSetupError:
            logger = None
            continue

    logger.updateGui()
    end = time.time()
    if ((end - start) >= 1):
        logger.log()
        start = time.time()
