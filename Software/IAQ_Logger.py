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
    # Main Loop polls to check if Logger shutdown
    shutdown = False
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
    # Sensor Control
    ############################
    # List of dictionaries
    sensorConfigList = []
    sensorsList = []
    mq_sensors = []
    sensorNeedsInit = True
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

    #################################################################
    # Analog Port Enum based ID
    #################################################################
    A0 = {'A0':SensorIdEnum.MQ2.name}
    A1 = {'A1':SensorIdEnum.MQ3.name} 
    A2 = {'A2':SensorIdEnum.MQ4.name}
    A3 = {'A3':SensorIdEnum.MQ5.name}
    A4 = {'A4':None}
    A5 = {'A5':None}
    portDict = dict(A0.items() + A1.items() + A2.items() +
                    A3.items() + A4.items() + A5.items())
    #################################################################

    def __init__(self):
        # Init: GUI
        self.gui = GUI(portStatus=self.portDict)
        # Initialize logger based on setup_path specifications
        self._printBanner("Setting Up Logger...")
        # Init: FileHandler
        self.csv = FileHandler()
        # Init: AnalogPortController
        self.analogPorts = AnalogPortController(self.portDict) 
        try:
            status = self._initFromDb(self.setup_path)
        except SetupFileError:
            self._printBanner("Setup FAILURE")
            raise LoggerSetupError('LoggerSetupError: Could not initialize database and sensors')
        self._printBanner("Setup SUCCESS")
 
    #################################################################
    # External API
    #################################################################
    def log(self):
        # Log data routine for every MQ Sensor
        for sensor in self.sensorsList:
            try:
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
                self.csv.writeSensorData(dataList,sensor.sid)
            except SensorReadError:
                self.printSystem("Could not read sensor: "+sensor.sid.name)
                continue
            except SensorSetupError:
                self.printSystem("Could not setup sensor: "+sensor.sid.name)
                continue

    def updateGui(self):
        self.gui.update_idletasks()
        self.gui.update()
        self.sensorNeedsInit = self.gui.updatedSensors()
        self._initSensors()

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
        self._initSensors()

    def _initSensors(self):
        if (False == self.sensorNeedsInit):return
        self.sensorConfigList = self.csv.getSensorConfig()
        for config in self.sensorConfigList:
            try:
                sensor = Sensor(config,self.analogPorts)
            except SensorIsOff:
                continue
            self.sensorsList.append(sensor)

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
