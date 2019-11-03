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

    shutdown = False

    def __init__(self,setup_path=None):
        # Initialize All Sub-Subsystems 
        # Exit with Critical Error on Failure
        if self._powerOn() == False: return self._powerOff()

        self._printBanner("Setting Up Logger...")
        # Verify that file exists from path given
        status = self._verifySetupFile(setup_path)
        if (status == False): return
        # Initialize logger based on setup_path specifications
        status = self._initFromFile(self.setup_path)
        if status == True:
            self._printBanner("Setup SUCCESS")
        else:
            self._printBanner("Setup FAILURE")

    def _powerOn(self):
        self.gui = GUI()
        self.csv = FileHandler()
        return True

    def _powerOff(self):
        print("Fatal Error: Failed to initialze sub-systems")
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
            self._printBanner("Fatal Error: Invalid Logger Setup file")
            return
        self.logger_type = str(setup_config.get('Logger Type',None)[0])
        self.softwareVersion = str(setup_config.get('Software Version',None)[0])
        sensor_path  = setup_config.get('Sensors',None)
        sensors = self.csv.csvToDict(sensor_path)
        for s in sensors:
            self.sensor_names.append(s.get("Name",None))
            self.setup_info = [self.logger_type,self.logger_id,
                    self.softwareVersion,self.setup_path,self.sensor_names]

        return self._printSetupStatus()

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

    def _printBanner(self,midText=None):
        hashes = "##################################################\n"
        spaces = (len(hashes) + len(midText))/2
        midText = midText.rjust(spaces) + "\n"
        banner = hashes + midText + hashes
        self.printSystem(banner)

    def _printSetupStatus(self):
        try:
            for info,text in zip(self.setup_info,self.setup_header):
                if info == None:
                    return False
                info = text + ": " + str(info)
                self.printSystem(info)
        except TypeError:
            if self.setup_info == None:
                self.printSystem("Error: Invalid Setup Info.")
            elif self.setup_header == None:
                self.printSystem("Error: Invalid Setup Header.")
            return False
        return True

    def On(self):
        if self.shutdown == True:
            return False
        return True

logger = Logger()
start = time.time()
while logger.On():
    logger.updateGui()
    end = time.time()
    if ((end - start) >= 1):
        start = time.time()
