#!/usr/bin/python

import bme680
import time

class IAQ_bme680():
    sid = None
    portController = None
    analog_port = None
    _Bme680 = None
    MAX_ATTEMPTS = 5

    def __init__(self,sensor_id=None):
        if (sensor_id == None):
            pass
        self.sid = sensor_id
        try:
            sensor = bme680.BME680(bme680.I2C_ADDR_SECONDARY)
        except IOError('Could not setup bme680 I2C'):
            raise SensorSetupError('Returning from bme680')
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
        return humidity

    def getTemp(self):
        temp = None
        for attempt in range(self.MAX_ATTEMPTS):
            if self._Bme680.get_sensor_data():
                temp = self._Bme680.data.temperature
                break
        return temp

    def getPressure(self):
        pressure = None
        for attempt in range(self.MAX_ATTEMPTS):
            if self._Bme680.get_sensor_data():
                pressure = self._Bme680.data.pressure
                break
        return pressure

    def getVOC(self):
        voc = None
        for attempt in range(self.MAX_ATTEMPTS):
            if self._Bme680.data.heat_stable:
                voc = self._Bme680.data.gas_resistance
                break
        return voc
    
    def getData(self):
        return self.getVOC()
