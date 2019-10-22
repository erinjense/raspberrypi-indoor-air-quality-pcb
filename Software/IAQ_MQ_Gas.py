#!/usr/bin/python

from third_party import Adafruit_ADS1x15


#class MQ_Gas:
import time

# Import the ADS1x15 module.
from third_party import Adafruit_ADS1x15
from HAT import IAQ_DAC43608

address=0x48
# Create an ADS1115 ADC (16-bit) instance.
adc = Adafruit_ADS1x15.ADS1115()
dac = IAQ_DAC43608.DAC43608()
dac.writeConfig(0x0000)
dac.writeDacA(0xFFFF)

# Choose a gain of 1 for reading voltages from 0 to 4.09V.
# Or pick a different gain to change the range of voltages that are read:
#  - 2/3 = +/-6.144V
#  -   1 = +/-4.096V
#  -   2 = +/-2.048V
#  -   4 = +/-1.024V
#  -   8 = +/-0.512V
#  -  16 = +/-0.256V
# See table 3 in the ADS1015/ADS1115 datasheet for more info on gain.
GAIN = 1

print('Reading ADS1x15 values, press Ctrl-C to quit...')
while True:
    values = adc.read_adc(0, gain=GAIN)
    print(values)
    time.sleep(0.5)
