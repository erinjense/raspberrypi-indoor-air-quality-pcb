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

from enum import Enum
from IAQ_Exceptions import *
from IAQ_MQgas      import IAQ_MQgas
from IAQ_BME680     import IAQ_BME680
from IAQ_SDS011     import IAQ_SDS011
from IAQ_SCD30      import IAQ_SCD30
from IAQ_MQgas      import IAQ_MQgas
from IAQ_GPS        import IAQ_GPS

class SensorIdEnum(Enum):
    MQ2    = 0
    MQ4    = 1
    MQ5    = 2
    MQ6    = 3
    MQ7    = 4
    MQ135  = 5
    BME680 = 6
    SDS011 = 7
    SCD30  = 8
    XA1110 = 9

class Sensor:
    name        = None
    port        = None
    sid         = None
    status      = None
    _Sensor     = None
    portController = None

    def __init__(self, setupDictionary=None, portController=None):
        self.name = str(setupDictionary.keys()[0])
        values    = setupDictionary.values()[0]
        self.port = values.get("Port")
        self.sid  = SensorIdEnum[self.name]
        self.status = values.get("Status")
        try:
            if "MQ" in self.name:
                self.portController = portController
                self._Sensor = IAQ_MQgas(self.sid, self.port, 
                                                        self.portController)
            if "BME680" in self.name:
                self._Sensor = IAQ_BME680(self.sid)
            if "SDS011" in self.name:
                self._Sensor = IAQ_SDS011(self.sid, self.port)
            if "SCD30" in self.name:
                self._Sensor = IAQ_SCD30(self.sid)
            if "XA1110" in self.name:
                self._Sensor = IAQ_GPS(self.sid)
        except SensorSetupError:
            raise SensorSetupError('Could not setup sensor ' + self.name)

    def getData(self):
        data = None
        if self.status == "Off": return data
        try:
            data = self._Sensor.getData()
        except SensorSetupError:
            raise SensorSetupError('Sensor Setup Error: '  + self.name)
        if data == None:
            raise SensorReadError('Error Reading Sensor: ' + self.name)
        return data

    def getTemperature(self):
        if self.status == "Off": return None
        if "BME680" in self.name:
            return self._Sensor.getTemp()

    def getHumidity(self):
        if self.status == "Off": return None
        if "BME680" in self.name:
            return self._Sensor.getHumidity()

    def getPressure(self):
        if self.status == "Off": return None
        if "BME680" in self.name:
            return self._Sensor.getPressure()

    def getLocation(self):
        if self.status == "Off": return None
        if "XA1110" in self.name:
            return self._Sensor.getLocation()
            
    def getDate(self):
        if self.status == "Off": return None
        if "XA1110" in self.name:
            pass

    def getTime(self):
        if self.status == "Off": return None
        if "XA1110" in self.name:
            pass
