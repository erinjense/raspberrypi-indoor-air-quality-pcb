#!/usr/bin/python

#################################################################################
# MIT License
#
# Copyright (c) 2019 Aaron Jense, Amy Heidner, Dennis Heidner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#################################################################################

from   IAQ_AnalogPortController import *
from   GUI.IAQ_GUI              import GUI
from   Sensors.IAQ_Sensor       import Sensor
from   Sensors.IAQ_Sensor       import SensorIdEnum
from   Sensors.IAQ_Sensor       import SensorInfo
from   IAQ_FileHandler          import FileHandler
from   IAQ_Exceptions           import *
from   timeit                   import default_timer as Timer
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
    sensorsDict      = {}
    sensorConfigDict = {}
    bme680_temp      = None
    bme680_humidity  = None
    bme680_pressure  = None
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
    csvFolder        = None
    #############################

    #############################
    # Time Tracking
    #############################
    startTime        = None
    totalRunTime     = None
    logTimeTracker   = None
    LOGGING_INTERVAL = 2
    #############################

    def __init__(self):

        # Begin logging by default
        self.startTime      = Timer()
        self.logTimeTracker = Timer()
        self.totalRunTime   = Timer()
        self.logger_status  = True

        self.sensorConfigDict = SensorInfo.SENSOR_DICT
 
        # Init: FileHandler
        self.csv = FileHandler()

        # Attempt to Mount USB
        self.usb_status = True
        self._updateUSB()

        # Init: AnalogPortController
        self.analogPorts = AnalogPortController(self.sensorConfigDict)

        # Init: Sensors
        self._initSensors()

        # Init: GUI
        self.gui = GUI(self.sensorConfigDict)
        self.gui.updateUsbStatus(self.usb_status)
        self.gui.updateLoggerStatus(self.logger_status)

    #################################################################
    # Internal Functions
    #################################################################
    def _initSensors(self):
        for key, values in self.sensorConfigDict.items():
            sensor_dict = {key : values}
            try:            sensor = Sensor(sensor_dict, self.analogPorts)
            except IOError: continue
            self.sensorsDict[key] = sensor

    def _timeToLog(self):
        stopTime = int(Timer() - self.logTimeTracker)
        if stopTime >= self.LOGGING_INTERVAL:
            self.logTimeTracker = Timer()
            return True
        return False

    def _updateUSB(self):

        # Check if USB was disconnected
        out = os.system("ls /dev/zephyrus-iaq-usb > /dev/null 2>&1")
        if out == self.NO_USB and self.usb_status != None:
            self.usb_status = None
            try: self.gui.updateUsbStatus(self.usb_status)
            except AttributeError: pass
        elif out == self.USB_OK and self.usb_status == None:
            self.usb_status = False
            try: self.gui.updateUsbStatus(self.usb_status)
            except AttributeError: pass

        # Synchronize Logger's USB status with GUI USB Status
        # Return if GUI and Logger USB status are the same
        current = self.usb_status
        try:
            # Check if user pressed mount/eject USB
            self.usb_status = self.gui.getUsbStatus()
            # Return if no usb_status change
            if current == self.usb_status: return
        except AttributeError:
            pass

        # Mount USB
        if self.usb_status == True:
            try:                   self.csv.mountUSB()
            except UsbIsMounted:   pass
            except UsbNotAttached: self.usb_status = None

        # Eject USB and Stop Logging
        if self.usb_status == False:
            try:
                self.csv.umountUSB()
                self.gui.updateLoggerStatus(False)
            except UsbNotMounted:  pass
            except AttributeError: pass

        # Change database to failsafe folder on SD card instead of USB
        if self.usb_status == False or self.usb_status == None:
            # Update database path to failsafe in case user
            # starts logging without mounting USB again
            self.csvFolder = SensorInfo.FAILSAFE_FOLDER
        elif self.usb_status == True:
            self.csvFolder = SensorInfo.DEFAULT_FOLDER
        else:
            print('Error: USB Status')

    def _getElapsedLogTime(self):
        return int(Timer() - self.startTime)

    #################################################################
    # External API
    #################################################################
    def log(self):
        self._updateUSB()
        if self.logger_status == False: return
        if self._timeToLog()  == False: return
        # Log data routine for every MQ Sensor
        for name,sensor in self.sensorsDict.items():
            try:
                dataList = []
                # Date/Time is System clock
                # System clock is updated from a GPS (if available).
                date     = str(datetime.datetime.now().date())
                time     = str(datetime.datetime.now().time())
                loc      = 0
                bme680   = self.sensorsDict.get("BME680")
                temp     = None
                humidity = None
                pressure = None
                try:
                    temp     = bme680.getTemperature()
                    humidity = bme680.getHumidity()
                    pressure = bme680.getPressure()
                except AttributeError: pass
                self.bme680_temp     = temp
                self.bme680_humidity = humidity
                self.bme680_pressure = pressure

                # Get sensor data
                data = sensor.getData()

                # Refresh GUI 
                # (updates date,time,temp,humidity,pressure,data,...)
                self.updateGui(data, name)

                # Create list in order of CSV columns
                # the sensor's unique 'data' is stored last.
                # data could be a list, such as with the SDS011 PM2.5 & PM10
                dataList.extend([date, time, loc, temp, humidity, pressure])
                if type(data) is list: dataList.extend(data)
                else:                  dataList.append(data)

                # Write to CSV
                csvFolder = self.csvFolder + name + "/"
                csvFile   = csvFolder + name + "_" + date + "_.csv"
                try:
                    self.csv.writeDataToCSV(dataList,csvFile)
                except CsvPathErr:
                    try :
                        self.csv.newCsv(csvFile, name)
                    except IOError:
                        self.csv.createStorageFolder(csvFolder)
            except SensorReadError:
                print("Could not read sensor: "  + name)
                continue
            except SensorSetupError:
                print("Could not setup sensor: " + name)
                continue

    def updateGui(self, data=None, sensor=None):
        self.gui.updateTime()
        self.gui.updateTemp(self.bme680_temp)
        self.gui.updateHumidity(self.bme680_humidity)
        self.gui.updatePressure(self.bme680_pressure)
        if data != None: self.gui.updateData(data, sensor)
        self.logger_status = self.gui.getLoggerStatus()
        self.gui.update()
        self.gui.update_idletasks()

################################################################################
# Main Loop
################################################################################
logger = Logger()
while True:
    logger.updateGui()
    logger.log()
