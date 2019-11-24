#!/usr/bin/python
from IAQ_AnalogPortController import *
from GUI.IAQ_GUI import GUI
from Sensors.IAQ_Sensor import SensorIdEnum
from Sensors.IAQ_MqGas import MqGas
from Sensors.IAQ_Sensor import Sensor
from Sensors.IAQ_Sensor import SensorInfo
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
    dbFolder = None
    dbPath   = None
    logger_id   = None
    logger_type = None
    softwareVersion = None  
    sensor_names = []       
    setup_info = []
    #############################

    def __init__(self):
        # Init: FileHandler
        self.csv = FileHandler()
        # Mount USB
        self.dbFolder = SensorInfo.DEFAULT_FOLDER
        self.dbPath   = SensorInfo.DEFAULT_DB
        try: self.csv.mountUSB()
        except UsbIsMounted:   pass
        except UsbNotAttached:
            # The logger needs a database to run
            # If the USB is not attached then create a failsafe DB
            self.dbFolder = SensorInfo.FAILSAFE_FOLDER
            self.dbPath   = SensorInfo.FAILSAFE_DB
        # Create Database if it doesn't exist
        try:
            status = self._initFromDb(self.dbPath, self.dbFolder)
        except SetupFileError:
            raise LoggerSetupError('LoggerSetupError: Could not get sensor configuration.')
        except SqlitePathErr: pass
        # Init: AnalogPortController
        self.analogPorts = AnalogPortController(self.sensorConfigDict) 
        # Init: Sensors
        self._initSensors()
        # Init: GUI
        self.gui = GUI(self.sensorConfigDict)

    #################################################################
    # External API
    #################################################################
    def log(self):
        loggerStatus = self.gui.u_LoggerStatus()
        if loggerStatus == False: return
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
                temp     = None
                humidity = None
                try:
                    temp     = self.sensorsDict["BME680"].getTemperature()
                    humidity = self.sensorsDict["BME680"].getHumidity()
                except KeyError: pass
                # Get sensor data
                data = sensor.getData()
                # Create list in order of database storage
                for item in (date,time,loc,temp,humidity,data):
                    dataList.append(item)
                # Write to database
                data = self.csv.writeSensorData(dataList,sensor.sid,self.dbPath)
                self.gui.displayData(sensor.port, data)
            except SensorReadError:
                print("Could not read sensor: "+name)
                continue
            except SensorSetupError:
                print("Could not setup sensor: "+name)
                continue

    def updateGui(self):
        user_updated_sensors = self.gui.checkUserUpdates()
        if (True == user_updated_sensors):
            self.sensorConfigDict = self.gui.get_portStatus()    
            print self.sensorConfigDict
            self._initSensors()

        self.gui.update()
        self.gui.update_idletasks()

    #################################################################
    # Internal Functions
    #################################################################
    def _initFromDb(self, dbPath=None, folder=None):
        try: self.csv.createDatabase(dbPath)
        except SqlitePathErr:
            try: self.csv.createStorageFolder(folder)
            except OSError:
                raise SqlitePathErr('Cannot create folder. Folder location not available.')
            self.csv.createDatabase(dbPath)
        self.sensorConfigDict = self.csv.getSensorConfig(dbPath)

    def _initSensors(self):
        for name,config in self.sensorConfigDict.items():
            config = dict(config)
            try: sensor = Sensor(config, self.analogPorts)
            except SensorIsOff: continue
            except IOError:     continue
            self.sensorsDict[name] = sensor

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
