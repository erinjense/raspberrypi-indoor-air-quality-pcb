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

class SensorInfo:
    FAILSAFE_FOLDER = "failsafe/"
    DEFAULT_FOLDER  = "/media/zephyrus-iaq-usb/zephyrus-iaq/"
    ###########################################################################
    # Default Sensor Setup Info.
    ###########################################################################
    STORAGE_KEYS = ["Date(YYYY/MM/DD)", "Time(HH:MM:SS)", "Location(Deg)", 
                    "Temp(C)", "Pressure(hPa)", "Humidity(RH)"]

    MQ2_DICT = {
            "Port"   : 'A0',
            "Focus"  : 'Propane (Raw)',
            "DataKeys": ['LPG, Propane, Hydrogen (RAW)']
            }
    MQ4_DICT = {
            "Port"   : 'A1',
            "Focus"  : 'Methane (Raw)',
            "DataKeys": ['Methane, Natural Gas (RAW)']
            }
    MQ5_DICT = {
            "Port"   : 'A2',
            "Focus"  : 'Natural Gas (Raw)',
            "DataKeys": ['LPG, Natural Gas, Coal Gas (RAW)']
            }
    MQ6_DICT = {
            "Port"   : 'A3',
            "Focus"  : 'LPG (Raw)',
            "DataKeys": ['LPG, ISO-Butane, Propane (RAW)']
            }
    MQ7_DICT = {
            "Port"   : 'A4',
            "Focus"  : 'CO (Raw)',
            "DataKeys": ['Carbon Monoxide (RAW)']
            }
    MQ135_DICT = {
            "Port"   : 'A5',
            "Focus"  : 'NH3 (Raw)',
            "DataKeys": ['NH3, NOx, Benzene, Smoke (RAW)']
            }
    SCD30_DICT = {
            "Port"   : 'SoftSerial',
            "Focus"  : 'CO2 (PPM)',
            "DataKeys": ['CO2 (PPM)']
            }
    SDS011_DICT = {
            "Port"   : '/dev/ttyUSB0',
            "Focus": ['PM2.5 (PPM)','PM10 (PPM)'],
            "DataKeys": ['PM2.5 (PPM)','PM10 (PPM)']
            }
    BME680_DICT = {
            "Port"   : 'I2C',
            "Focus"  : 'VOC (Ohms)',
            "DataKeys": ['VOC (Ohms)']
            }

    SENSOR_DICT = {
            "MQ2"    : MQ2_DICT,
            "MQ4"    : MQ4_DICT,
            "MQ5"    : MQ5_DICT,
            "MQ6"    : MQ6_DICT,
            "MQ7"    : MQ7_DICT,
            "MQ135"  : MQ135_DICT,
            "BME680" : BME680_DICT,
            "SCD30"  : SCD30_DICT,
            "SDS011" : SDS011_DICT
            }

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
    ##########################################################################

class Sensor:
    name        = None
    port        = None
    sid         = None
    _Sensor     = None
    portController = None

    def __init__(self, setupDictionary=None, portController=None):
        self.name = str(setupDictionary.keys()[0])
        values    = setupDictionary.values()[0]
        self.port = values.get("Port")
        self.sid  = SensorIdEnum[self.name]
        self.portController = portController
        if "MQ" in self.name:
            self._Sensor = IAQ_MQgas(self.sid, self.port, self.portController)
        if "BME680" in self.name:
            self._Sensor = IAQ_BME680(self.sid)
        if "SDS011" in self.name:
            self._Sensor = IAQ_SDS011(self.sid, self.port)
        if "SCD30" in self.name:
            self._Sensor = IAQ_SCD30(self.sid)
        if "XA1110" in self.name:
            pass

    def getData(self):
        data = None
        try:
            data = self._Sensor.getData()
        except SensorSetupError:
            raise SensorSetupError('Sensor Setup Error: '  + self.name)
        if data == None:
            raise SensorReadError('Error Reading Sensor: ' + self.name)
        return data

    def getTemperature(self):
        if "BME680" in self.name:
            return self._Sensor.getTemp()

    def getHumidity(self):
        if "BME680" in self.name:
            return self._Sensor.getHumidity()

    def getPressure(self):
        if "BME680" in self.name:
            return self._Sensor.getPressure()

    def getLocation(self):
        if "XA1110" in self.name:
            pass

    def getDate(self):
        if "XA1110" in self.name:
            pass

    def getTime(self):
        if "XA1110" in self.name:
            pass
