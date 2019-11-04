#!/usr/bin/python

from IAQ_Sensor import Sensor
from IAQ_Sensor import SensorIdEnum

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
        self.analog_port = self.portController.getPortById(self.sid)
        print self.analog_port
        print self.sid

    def getData(self):
        if self.portController is None: return -1
        data = self.portController.readPort(self.sid)
        return data
