#!/usr/bin/python

#################################################################################
# MIT License
#
# Copyright (c) 2019 Aaron Jense, Amy Heidner, Dennis Heidner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#################################################################################

from IAQ_Exceptions import *

class IAQ_MQgas():
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
