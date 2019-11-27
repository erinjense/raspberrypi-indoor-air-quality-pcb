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
    # Exit Status Codes
    ############################
    NO_USB = 512
    USB_OK = 0

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
    dbFolder        = None
    #############################

    #############################
    # Time Tracking
    #############################
    startTime = None
    totalRunTime = None
    LOGGING_INTERVAL = 2
    #############################

    def __init__(self):
        # Begin logging by default
        self.startTime     = time.time()
        self.totalRunTime  = self.startTime
        self.logger_status = True

        self.sensorConfigDict = SensorInfo.SENSOR_DICT
 
        # # Init: FileHandler
        self.csv = FileHandler()

        # # Attempt to Mount USB
        self.usb_status = True
        self.updateUSB()

        # # Init: AnalogPortController
        self.analogPorts = AnalogPortController(self.sensorConfigDict) 
        # # Init: Sensors
        self._initSensors()

        # # Init: GUI
        self.gui = GUI(self.sensorConfigDict)
        self.gui.updateUsbStatus(self.usb_status)
        self.gui.updateLoggerStatus(self.logger_status)

    #################################################################
    # Internal Functions
    #################################################################
    def _initSensors(self):
        for key, values in self.sensorConfigDict.items():
            sensor_dict = {key : values}
            try: sensor = Sensor(sensor_dict, self.analogPorts)
            except IOError: continue
            self.sensorsDict[key] = sensor

    #################################################################
    # External API
    #################################################################
    def log(self):
        self.updateUSB()
        loggerStatus = self.gui.getLoggerStatus()
        if loggerStatus == False: return
        if self.getElapsedLogTime() < self.LOGGING_INTERVAL: return
        # Log data routine for every MQ Sensor
        for name,sensor in self.sensorsDict.items():
            try:
                dataList = []
                # Date/Time is System clock
                # System clock is updated from a GPS if available.
                date = str(datetime.datetime.now().date())
                time = str(datetime.datetime.now().time())
                loc  = 0
                bme680   = self.sensorsDict.get("BME680")
                temp = None
                humidity = None
                try:
                    temp     = bme680.getTemperature()
                    humidity = bme680.getHumidity()
                except AttributeError: pass
                # Get sensor data
                data = sensor.getData()

                # Create list in order of database storage
                dataList.extend([date,time,loc,temp,humidity])
                if type(data) is list: dataList.extend(data)
                else: dataList.append(data)

                # Write to CSV
                csvFolder = self.dbFolder + name + "/"
                csvFile   = csvFolder + name + "_" + date + "_.csv"
                try:
                    self.csv.writeDataToCSV(dataList,csvFile)
                except CsvPathErr:
                    try :
                        self.csv.newCsv(csvFile, name)
                    except IOError:
                        self.csv.createStorageFolder(csvFolder)
            except SensorReadError:
                print("Could not read sensor: "+name)
                continue
            except SensorSetupError:
                print("Could not setup sensor: "+name)
                continue

    def getElapsedLogTime(self):
        return int(self.startTime - time.time())

    def updateGui(self):
        self.gui.updateTime()
        self.gui.update()
        self.gui.update_idletasks()

    def updateUSB(self):
        current = self.usb_status
        # Check if USB was disconnected
        out = os.system("ls /dev/zephyrus-iaq-usb > /dev/null 2>&1")
        if out == self.NO_USB:
            self.usb_status = None
            try: self.gui.updateUsbStatus(self.usb_status)
            except AttributeError: pass
        elif out == self.USB_OK and self.usb_status == None:
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
            self.dbFolder = SensorInfo.DEFAULT_FOLDER

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
