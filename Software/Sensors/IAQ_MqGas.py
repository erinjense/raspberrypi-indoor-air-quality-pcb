#!/usr/bin/python

from IAQ_Exceptions import *

class MqGas():
    sid = None
    portController = None
    analog_port = None

    def __init__(self,sensor_id=None,sensor_port=None,portController=None):
        self.sid            = sensor_id
        self.portController = portController
        self.analog_port    = sensor_port
        self.turnOn()

    def getData(self):
        if self.portController is None or self.analog_port is None:
            raise SensorSetupError('Port controller or Analog Port is None')
        try:
            data = self.portController.readPort(self.analog_port)
        except IOError:
            raise SensorReadError('Could not get MQ Sensor data from ADC.')
        return data

    def turnOff(self):
        self.portController.turnOff(self.analog_port)

    def turnOn(self):
        self.portController.turnOn(self.analog_port)
