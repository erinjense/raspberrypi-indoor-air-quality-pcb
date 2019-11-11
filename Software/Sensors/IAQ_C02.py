#!/usr/bin/python

from IAQ_Exceptions import *
from C02 import float_C02, float_T, float_rH

class C02():
    sid = None
    portController = None
    i2c_address = None

    def __init__(self,sensor_id=None,portController=None):
        if (sensor_id == None or portController == None):
            print('Invalid Input Error')
            return
        self.sid = sensor_id
        self.portController = portController
        try:
            self.analog_port = self.portController.getPortNumById(self.sid)
        except ValueError:
            raise SensorSetupError('Error retrieving MQ Gas Sensor Port Number')

    def getData(self):
        try:
			execfile("C02.py")
            data = float_C02
        except IOError:
            raise SensorReadError('Could not get MQ Sensor data from ADC.')
        return data