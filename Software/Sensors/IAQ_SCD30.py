#!/usr/bin/python
from third_party.Adafruit_I2C import *
import struct

class IAQ_CO2():
    sid = None
    i2c = None
    I2C_ADDRESS = 0x61

    def __init__(self, sensor_id=None):
        self.sid = sensor_id
	self.i2c = Adafruit_I2C(self.I2C_ADDRESS, debug=False)
        
    def getData(self):
        data = None
        try:
	    self.i2c.write8(0x0,0)
	    self.i2c.write8(0x46,2)
	    rawdata = self.i2c.readList(0x03,18)
	    struct_co2 = struct.pack('BBBB',rawdata[0], rawdata[1], rawdata[3], rawdata[4])
	    data = struct.unpack('>f', struct_co2)
        except IOError: pass
        return data
