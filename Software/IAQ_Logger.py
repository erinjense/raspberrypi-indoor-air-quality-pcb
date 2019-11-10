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
    # Default Setup Settings
    # setup_header should correspond to headers in logger_setup.csv
    #################################################################
    setup_header = ["Logger Type","Logger ID",
                    "Software Version","Setup Path","Sensors"]

    #################################################################
    # Default settings are currently based off of the following file
    # TODO: Hard code default settings, but create a custom_setup.csv
    #################################################################
    DEFAULT_PATH="./Config/Default/logger_setup.csv"

    #################################################################
    # Analog Port Enum based ID
    #################################################################
    A0 = SensorIdEnum.MQ2.name
    A1 = SensorIdEnum.MQ3.name
    A2 = SensorIdEnum.MQ4.name
    A3 = SensorIdEnum.MQ5.name
    A4 = SensorIdEnum.MQ6.name
    A5 = SensorIdEnum.MQ7.name
    #################################################################

    def __init__(self):
        # Init: GUI
        self.gui = GUI()
        # Initialize logger based on setup_path specifications
        self._printBanner("Setting Up Logger...")
        # Init: FileHandler
        self.csv = FileHandler()
        # Init: AnalogPortController
        portList = [self.A0,self.A1,self.A2,self.A3,self.A4,self.A5]
        self.analogPorts = AnalogPortController(portList) 
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
                date = str(datetime.datetime.now().date())
                time = str(datetime.datetime.now().time())
                loc  = 0
                temp = 0
                humidity = 0
                data = sensor.getData()

                dataList.append(date)
                dataList.append(time)
                dataList.append(loc)
                dataList.append(temp)
                dataList.append(humidity)
                dataList.append(data)
                if dataList != None: print dataList
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
