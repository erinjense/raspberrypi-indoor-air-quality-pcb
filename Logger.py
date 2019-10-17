#!/usr/bin/python


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

# MQ Gas Sensor Routine (A0 - A5):
#    DAC: Ensure Sensor on A0 has correct voltage supply
#    Multiplexer: Set channel A0 to ADC input
#    ADC: Read data
#    Temp,Humidity,etc: Read data from peripheral sensors
#    Store all data in CSV
#    Repeat for A1 - A5

# BME680 Sensor Routine (3.3V I2C):
#    Wait for "Primary" Sensor to get data. (Primary are MQ sensors, SCD30, particulate, etc.)
#    Poll I2C for temp., humidity, VOC, etc.
#    Store BME680 data in primary sensor CSV file

# SCD30 Sensor Routine (3.3V I2C):

# GPS Routine (3.3V I2C)

# Nova PM SDS011 Routine (3.3V USART):
