#!/usr/bin/python
from IAQ_AnalogGasSensors import *
import time
#from IAQ_AnalogGasSensors import MQSensorsList

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

"""
    Init CSV File
"""
# csv = DataHandler("./config/logger_setup.csv")
# csv.setupNewFile()
# data = csv.getDataDict()
"""
    Init Sensors
"""
# temp = Bme680()
# temp.init_sensor()

# while True:
#     data['Date-Time'] = str(datetime.datetime.now())
#     data['Temp']      = temp.get_temp()
#     data['Pressure']  = temp.get_pressure()
#     data['Humidity']  = temp.get_humidity()
#     data['Location']  = "ECE Conference"
#     csv.writeData(data)
#     print data

A0 = MQSensorsList.MQ2.name
A1 = MQSensorsList.MQ3.name
A2 = MQSensorsList.MQ6.name
A3 = MQSensorsList.MQ7.name
analogGas = AnalogGasSensors([A0,A1,A2,A3]) 
while True:
    value = 0
    value = analogGas.readA0()
    print ('A0: ',value)
    value = 0
    time.sleep(10)
    value = analogGas.readA1()
    print ('A1: ',value)
