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
#################################################################################

import bme680
import time
from IAQ_Exceptions import *

class IAQ_BME680():
    sid = None
    portController = None
    analog_port = None
    _Bme680 = None
    MAX_ATTEMPTS = 5

    def __init__(self,sensor_id=None):
        self.sid = sensor_id
        try:
            sensor = bme680.BME680(bme680.I2C_ADDR_SECONDARY)
        except IOError:
            raise SensorSetupError('Could not setup BME680 I2C.')
        # Set Oversample rate
        sensor.set_humidity_oversample(bme680.OS_2X)
        sensor.set_pressure_oversample(bme680.OS_4X)
        sensor.set_temperature_oversample(bme680.OS_8X)
        # Set Filter
        sensor.set_filter(bme680.FILTER_SIZE_3)
        # VOC Sensor Configuration
        sensor.set_gas_status(bme680.ENABLE_GAS_MEAS)
        sensor.set_gas_heater_temperature(320)
        sensor.set_gas_heater_duration(150)
        sensor.select_gas_heater_profile(0)

        self._Bme680 = sensor

    def getHumidity(self):
        humidity = None
        for attempt in range(self.MAX_ATTEMPTS):
            if self._Bme680.get_sensor_data():
                humidity = self._Bme680.data.humidity
                break
        if humidity == None: raise SensorReadError('BME680.getHumidity')
        return humidity

    def getTemp(self):
        temp = None
        for attempt in range(self.MAX_ATTEMPTS):
            if self._Bme680.get_sensor_data():
                temp = self._Bme680.data.temperature
                break
        if temp == None: raise SensorReadError('BME680.getTemp')
        return temp

    def getPressure(self):
        pressure = None
        for attempt in range(self.MAX_ATTEMPTS):
            if self._Bme680.get_sensor_data():
                pressure = self._Bme680.data.pressure
                break
        if pressure == None: raise SensorReadError('BME680.getPressure')
        return pressure

    def getVOC(self):
        voc = None
        for attempt in range(self.MAX_ATTEMPTS):
            if self._Bme680.data.heat_stable:
                voc = self._Bme680.data.gas_resistance
                break
        if voc == None: raise SensorReadError('BME680.getVOC')
        return voc
    
    def getData(self):
        return self.getVOC()
