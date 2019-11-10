#!/usr/bin/python

from IAQ_Exceptions import *

class MqGas():
    sid = None
    portController = None
    analog_port = None

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
        if self.portController is None or self.analog_port is None:
            raise SensorSetupError('Port controller or Analog Port is None')
        try:
            data = self.portController.readPort(self.analog_port)
        except IOError:
            raise SensorReadError('Could not get MQ Sensor data from ADC.')
        return data
