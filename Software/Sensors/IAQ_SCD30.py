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

from third_party.Adafruit_I2C import *
from IAQ_Exceptions import *
import struct

class IAQ_SCD30():
    sid = None
    i2c = None
    I2C_ADDRESS = 0x61

    def __init__(self, sensor_id=None):
        self.sid = sensor_id
        try:
            self.i2c = Adafruit_I2C(self.I2C_ADDRESS, debug=False)
        except IOError:
            raise SensorSetupError('Could not setup SCD30 I2C.')

    def getData(self):
        try:
	    self.i2c.write8(0x0,0)
	    self.i2c.write8(0x46,2)
	    rawdata = self.i2c.readList(0x03,18)
	    struct_co2 = struct.pack('BBBB', rawdata[0], rawdata[1],
                                             rawdata[3], rawdata[4])
	    data = struct.unpack('>f', struct_co2)
        except IOError:
            raise SensorReadError('Unable to read SCD30.')
        except TypeError:
            raise SensorReadError('Unable to read SCD30.')
        return data
