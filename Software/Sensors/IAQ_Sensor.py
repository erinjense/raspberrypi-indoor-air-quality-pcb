#!/usr/bin/python
from enum import Enum
import sqlite3
from IAQ_Exceptions import *
from IAQ_MqGas  import MqGas
from IAQ_BME680 import IAQ_bme680
from IAQ_SDS011 import IAQ_sds011
from IAQ_SCD30  import IAQ_CO2

class SensorInfo:
    FAILSAFE_FOLDER = "failsafe/"
    DEFAULT_FOLDER  = "/media/zephyrus-iaq-usb/zephyrus-iaq/"
    ##########################################################################################################
    # Default Sensor Setup Info.
    ##########################################################################################################
    STORAGE_KEYS = ["Date(YYYY/MM/DD)", "Time(HH:MM:SS)", "Location(Deg)", 
                    "Temp(C)", "Barometric Pressure", "Humidity(RH)"]

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
            self._Sensor = MqGas(self.sid, self.port, self.portController)
        if "BME680" in self.name:
            self._Sensor = IAQ_bme680(self.sid)
        if "SDS011" in self.name:
            self._Sensor = IAQ_sds011(self.sid, self.port)
        if "SCD30" in self.name:
            self._Sensor = IAQ_CO2(self.sid)

    def getData(self):
        data = None
        try:
            data = self._Sensor.getData()
        except SensorSetupError:
            raise SensorSetupError('Leaving Sensor.getData()')
        if data == None: raise SensorReadError('Error Reading Senor: '+self.name)
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
