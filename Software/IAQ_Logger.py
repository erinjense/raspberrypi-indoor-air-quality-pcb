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
import os

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

    ############################
    # Logger Status Flags
    ############################
    usb_status    = None
    logger_status = None
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
        # Begin logging by default
        self.logger_status = True
 
        # Init: FileHandler
        self.csv = FileHandler()

        # Attempt to Mount USB
        self.usb_status = True
        self.updateUSB()

        # Init: AnalogPortController
        self.analogPorts = AnalogPortController(self.sensorConfigDict) 

        # Init: Sensors
        self._initSensors()

        # Init: GUI
        self.gui = GUI(self.sensorConfigDict)
        self.gui.updateUsbStatus(self.usb_status)
        self.gui.updateLoggerStatus(self.logger_status)

    #################################################################
    # External API
    #################################################################
    def log(self):
        self.updateUSB()
        loggerStatus = self.gui.getLoggerStatus()
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
                self.csv.writeSensorData(dataList,sensor.sid,self.dbPath)

                # Write to CSV
                csvFolder = self.dbFolder + name + "/"
                csvFile = csvFolder + name + "_" + date + "_.csv"
                try:
                    self.csv.writeDataToCSV(dataList,csvFile)
                except CsvPathErr:
                    header = self.csv.getSqliteTableKeys(name,self.dbPath)
                    try :
                        self.csv.newCsv(csvFile,header)
                    except IOError:
                        self.csv.createStorageFolder(csvFolder)

            except SensorReadError:
                print("Could not read sensor: "+name)
                continue
            except SensorSetupError:
                print("Could not setup sensor: "+name)
                continue

    def updateGui(self):
       # Check if user changed configuration for sensors
        user_updated_sensors = self.gui.checkUserUpdates()
        if (True == user_updated_sensors):
            self.sensorConfigDict = self.gui.get_portStatus()    
            self._initSensors()

        self.gui.update()
        self.gui.update_idletasks()

    def updateUSB(self):

        current = self.usb_status

        # Check if USB was disconnected
        out = os.system("dmesg /dev/zephyrus-iaq-usb | grep usb | tail -1 | grep disconnect")
        if out == 0:
            self.usb_status = None
            try: self.gui.updateUsbStatus(self.usb_status)
            except AttributeError: pass
        elif out != 0 and self.usb_status == None:
            self.usb_status = False
            try: self.gui.updateUsbStatus(self.usb_status)
            except AttributeError: pass

        # Synchronize Logger's USB status with GUI USB Status
        # Return if GUI and Logger USB status are the same
        try:
            # Check if user pressed mount/eject USB
            self.usb_status = self.gui.getUsbStatus()
            # Return if no usb_status change
            if current == self.usb_status: return
        except AttributeError: pass
 
        if self.usb_status == True:
            # Mount USB
            try:   self.csv.mountUSB()
            except UsbIsMounted:   pass
            except UsbNotAttached:
                self.usb_status = None
            # Update database path to default on USB
            self.dbFolder = SensorInfo.DEFAULT_FOLDER
            self.dbPath   = SensorInfo.DEFAULT_DB

        # Eject USB and Don't Continue Logging
        if self.usb_status == False:
            # Eject USB
            try:
                self.csv.umountUSB()
                try: self.gui.updateLoggerStatus(False)
                except AttributeError: pass
            except UsbNotMounted: pass

        # Change database to failsafe folder on SD card instead of USB
        if self.usb_status == False or self.usb_status == None:
            # Update database path to failsafe in case user
            # starts logging without mounting USB again
            self.dbFolder = SensorInfo.FAILSAFE_FOLDER
            self.dbPath   = SensorInfo.FAILSAFE_DB

        # Re-Init Database
        self._initFromDb(self.dbPath, self.dbFolder)

    #################################################################
    # Internal Functions
    #################################################################
    def _initFromDb(self, dbPath=None, folder=None):
        try: self.csv.createDatabase(dbPath)
        except SqlitePathErr:
            try: self.csv.createStorageFolder(folder)
            except OSError: pass
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
logger = Logger()
start = time.time()
while True:
    logger.updateGui()
    end = time.time()
    if ((end - start) >= 1):
        logger.log()
        start = time.time()
