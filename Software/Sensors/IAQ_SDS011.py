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

import serial, time
from IAQ_Exceptions import *

class IAQ_SDS011():
    sid = None
    serial = None

    def __init__(self, sensor_id=None, serial_port=None):
        self.sid = sensor_id
        try:
            self.serial = serial.Serial('/dev/ttyUSB0')
        except serial.serialutil.SerialException:
            raise SensorSetupError('Could not setup serial for SDS011')

        #ser = serial.Serial(
        #    port='/dev/ttyS0',
        #    baudrate = 9600,
        #    parity = serial.PARITY_NONE,
        #    stopbits=serial.STOPBITS_ONE,
        #    bytesize=serial.EIGHTBITS,
        #    timeout=1)

    def getData(self):
        data = []
        for index in range(0,10):
            datum = self.serial.read()
            data.append(datum)

        pmtwofive = int(''.join(data[2:4]).encode('hex'), 16)/10
        pmten     = int(''.join(data[4:6]).encode('hex'), 16)/10
        return [pmtwofive, pmten]
