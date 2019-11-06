#!/usr/bin/python
from IAQ_AnalogPortController import *
from GUI.IAQ_GUI import GUI
from Sensors.IAQ_Sensor import SensorIdEnum
from Sensors.IAQ_MqGas import MqGas
from IAQ_FileHandler import FileHandler
from IAQ_Exceptions import *
import time
import logging
import sys

# while True:
#     data['Date-Time'] = str(datetime.datetime.now())
#     data['Temp']      = temp.get_temp()
#     data['Pressure']  = temp.get_pressure()
#     data['Humidity']  = temp.get_humidity()
#     data['Location']  = "ECE Conference"
#     csv.writeData(data)
#     print data

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
    A2 = SensorIdEnum.MQ6.name
    A3 = SensorIdEnum.MQ7.name
    A4 = SensorIdEnum.MQ135.name
    A5 = SensorIdEnum.MQ9.name
    #################################################################

    def __init__(self,setup_path=None):
        # Init: GUI
        self.gui = GUI()
        # Verify that file exists from path given
        try:
            self._verifySetupFile(setup_path)
        except FileNotFoundError:
            self._powerOff()
        # Initialize logger based on setup_path specifications
        self._printBanner("Setting Up Logger...")
        # Init: FileHandler
        self.csv = FileHandler()
        try:
            status = self._initFromFile(self.setup_path)
        except SetupFileError:
            self._printBanner("Setup FAILURE")
            self._powerOff()
        # Init: AnalogPortController
        # TODO: Get portList based on setup file
        portList = [self.A0,self.A1,self.A2,self.A3,self.A4,self.A5]
        self.analogPorts = AnalogPortController(portList) 
        # Sensor Init: Create all MQ Sensors and store in list
        for port in portList:
            self.mq_sensors.append(MqGas(port,self.analogPorts))
        self._printBanner("Setup SUCCESS")
 
    #################################################################
    # External API
    #################################################################
    def log(self):
        i = 0
        try:
            data = self.mq_sensors[0].getData()
        except SensorReadError:
            self.printSystem("Could not read sensor: "+self.mq_sensors[i].sid)
            return
        print data

    def updateGui(self):
        self.gui.update_idletasks()
        self.gui.update()

    def printSystem(self,msg):
        try:
            self.gui.startpage_output(msg)
            return True
        except AttributeError:
            print("Fatal Error: GUI failed to load.")
            return False

    def On(self):
        if self.shutdown == True:
            return False
        return True

    #################################################################
    # Internal Functions
    #################################################################
    def _powerOff(self):
        raise LoggerSetupError('Logger Setup Failed. Powering off.')
        self.shutdown = True
        return

    def _verifySetupFile(self,setup_path=None):
        if (setup_path == None):
            setup_path = self.DEFAULT_PATH
        self.setup_path = setup_path
        try:
            open(self.setup_path, 'r')
        except FileNotFoundError:
            self._printBanner("Error: Setup File Not Found.")
            return False
        return True

    def _initFromFile(self,filepath=None):
        try:
            setup_config = self.csv.csvToDict(filepath)
            self.logger_id   = str(setup_config.get('Id',None)[0])
        except TypeError:
            self._printBanner("Unknown Setup File Headers")
            raise SetupFileError("Can't find Logger Id in Setup File")
        self.logger_type = str(setup_config.get('Logger Type',None)[0])
        self.softwareVersion = str(setup_config.get('Software Version',None)[0])
        sensor_path  = setup_config.get('Sensors',None)
        sensors = self.csv.csvToDict(sensor_path)
        for s in sensors:
            self.sensor_names.append(s.get("Name",None))
            self.setup_info = [self.logger_type,self.logger_id,
                    self.softwareVersion,self.setup_path,self.sensor_names]
        return self._printSetupStatus()

    def _printSetupStatus(self):
        try:
            for info,text in zip(self.setup_info,self.setup_header):
                if info == None:
                    self.printSystem(text + " is Empty")
                    continue
                info = text + ": " + str(info)
                self.printSystem(info)
        except TypeError:
            if self.setup_info == None:
                self.printSystem("Error: Invalid Setup Info.")
            elif self.setup_header == None:
                self.printSystem("Error: Invalid Setup Header.")
            return False
        return True

    def _printBanner(self,midText=None):
        hashes = "##################################################\n"
        spaces = (len(hashes) + len(midText))/2
        midText = midText.rjust(spaces) + "\n"
        banner = hashes + midText + hashes
        self.printSystem(banner)
################################################################################
# Main Loop
################################################################################
logger = Logger()
start = time.time()
while logger.On():
    logger.updateGui()
    end = time.time()
    if ((end - start) >= 1):
        logger.log()
        start = time.time()
