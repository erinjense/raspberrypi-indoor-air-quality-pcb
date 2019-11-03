#!/usr/bin/python
#from IAQ_AnalogPortController import *
from GUI.IAQ_GUI import GUI
from IAQ_FileHandler import FileHandler
import time
import logging
import sys

# TODO: Create main loop for Logger

# TODO: Create the following:
# Initial Conditions: Set all GPIO to a known safe state
# Load GUI view.
# Allow user to start logger from default setup
# Allow user to start logger from custom setup
# Allow user to edit and save custom setup config file
# Allow user to change default logger setup to custom
# Allow user to edit and save sensor config files
# Start Logger after T amount of time without user input (Default Setup)
# Start Logger after user presses "Start"
# Stop Logger after user presses "Stop"
# Load config file that lists all sensors and their hardware port number


# while True:
#     data['Date-Time'] = str(datetime.datetime.now())
#     data['Temp']      = temp.get_temp()
#     data['Pressure']  = temp.get_pressure()
#     data['Humidity']  = temp.get_humidity()
#     data['Location']  = "ECE Conference"
#     csv.writeData(data)
#     print data

class Logger:
    gui = None
    csv = None
    setup_path = None
    softwareVersion = None
    sensor_names = []
    setup_info = []
    logger_id = None
    logger_type = None
    setup_header = ["Logger Type","Logger ID",
                    "Software Version","Setup Path","Sensors"]
    DEFAULT_PATH="./Config/Default/logger_setup.csv"
    # Analog Ports
    A0 = None
    A1 = None
    A2 = None
    A3 = None
    A4 = None
    A5 = None


    def __init__(self,setup_path=None):
        if (setup_path == None):
            setup_path = self.DEFAULT_PATH
        self.gui = GUI()
        self.setup_path = setup_path
        self.csv = FileHandler()
        self._initFromFile(setup_path)

    def _initFromFile(self,filepath=None):
        self._printBanner("Setting Up Logger...")
        setup_config = self.csv.csvToDict(filepath)
        self.logger_id   = str(setup_config.get('Id',None)[0])
        self.logger_type = str(setup_config.get('Logger Type',None)[0])
        self.softwareVersion = str(setup_config.get('Software Version',None)[0])
        sensor_path  = setup_config.get('Sensors',None)
        sensors = self.csv.csvToDict(sensor_path)
        for s in sensors:
            self.sensor_names.append(s.get("Name",None))
        self.setup_info = [self.logger_type,self.logger_id,self.softwareVersion,self.setup_path,self.sensor_names]
        self._printSetupStatus()
        self._printBanner("Setup Complete.")

    def updateGui(self):
        self.gui.update_idletasks()
        self.gui.update()

    def printSystem(self,msg):
        self.gui.startpage_output(msg)

    def _printBanner(self,midText=None):
        hashes = "##################################################\n"
        spaces = (len(hashes) + len(midText))/2
        midText = midText.rjust(spaces) + "\n"
        banner = hashes + midText + hashes
        self.printSystem(banner)

    def _printSetupStatus(self):
        for info,text in zip(self.setup_info,self.setup_header):
            info = text + ": " + str(info)
            self.printSystem(info)

logger = Logger()
start = time.time()
while True:
    logger.updateGui()
    end = time.time()
    if ((end - start) >= 1):
        start = time.time()
