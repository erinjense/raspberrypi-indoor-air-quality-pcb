#!/usr/bin/python

import bme680
import time

class IAQ_bme680():
    sid = None
    portController = None
    analog_port = None
    _Bme680 = None

    def __init__(self,sensor_id=None):
        if (sensor_id == None):
            pass
        self.sid = sensor_id
        try:
            sensor = bme680.BME680(bme680.I2C_ADDR_SECONDARY)
        except IOError('Could not setup bme680 I2C'):
            raise SensorSetupError('Returning from bme680')
        sensor.set_humidity_oversample(bme680.OS_2X)
        sensor.set_pressure_oversample(bme680.OS_4X)
        sensor.set_temperature_oversample(bme680.OS_8X)
        sensor.set_filter(bme680.FILTER_SIZE_3)
        self._Bme680 = sensor

    def getHumidity(self):
        humidity = None
        if self._Bme680.get_sensor_data():
            humidity = self._Bme680.data.humidity
        return humidity

    def getTemp(self):
        temp = None
        if self._Bme680.get_sensor_data():
            temp = self._Bme680.data.temperature
        return temp

    def getPressure(self):
        pressure = None
        if self._Bme680.get_sensor_data():
            pressure = self._Bme680.data.pressure
        return pressure
