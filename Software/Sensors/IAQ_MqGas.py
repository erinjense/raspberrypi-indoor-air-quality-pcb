#!/usr/bin/python

from IAQ_Sensor import Sensor
from IAQ_Sensor import SensorIdEnum
from IAQ_Exceptions import *

class MqGas(Sensor):
    sid   = None
    headers = None
    filename = None
    analog_port = None
    portController = None

    def __init__(self,sensor_id=None,portController=None):
        if (sensor_id == None or portController == None):
            print('Invalid Input Error')
            return
        self.sid = sensor_id
        self.portController = portController
        try:
            self.analog_port = self.portController.getPortNumById(self.sid)
        except ValueError:
            ('Error retrieving MQ Gas Sensor Port Number')
        print self.analog_port
        print self.sid

    def getData(self):
        if self.portController is None: return -1
        try:
            data = self.portController.readPort(self.analog_port)
        except IOError:
            raise SensorReadError('Could not get MQ Sensor data from ADC.')
        return data
