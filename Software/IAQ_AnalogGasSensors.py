#!/usr/bin/python

from third_party import Adafruit_ADS1x15
from HAT import IAQ_DAC43608
import IAQ_Mux
import time
from enum import Enum

# The following Sensor list was provided at:
# https://www.strawdogs.co/2018/06/MQ-Gas-Sensors-List
class MQSensorsList(Enum):
    MQ2   = 1  # Methane, Butane, LPG, Smoke
    MQ3   = 2  # Alcohol, Ethanol, Smoke
    MQ4   = 3  # Methane, CNG Gas
    MQ5   = 4  # Natural Gas, LPG
    MQ6   = 5  # LPG, Butane Gas
    MQ7   = 6  # Carbon Monoxide
    MQ8   = 7  # Hydrogen Gas
    MQ9   = 8  # Carbon Monoxide, Flammable Gas
    MQ131 = 9  # Ozone
    MQ135 = 10 # Air Quality (CO, Ammonia, Benzene, Alcohol, Smoke)
    MQ136 = 11 # Hydrogen Sulfide Gas
    MQ137 = 12 # Ammonia
    MQ138 = 13 # Benzene, Toluene, Alcohol, Acetone, Propane, Formaldehyde Gas, Hydrogen
    MQ214 = 14 # Methane, Natural Gas
    MQ246 = 15 # Natural Gas, Coal Gas

class AnalogGasSensors:

    adc = None
    dac = None
    mux = None
    A0  = 0 
    A1  = 0 
    A2  = 0 
    A3  = 0 
    A4  = 0 
    A5  = 0 
    GAIN = 1

    def __init__(self,sensorsByChannel):
        self.adc = Adafruit_ADS1x15.ADS1115()
        self.dac = IAQ_DAC43608.DAC43608()
        self.mux = IAQ_Mux.Mux()
        self.dac.writeConfig(0x0000)
        self.dac.writeDacA(0xFFFF)
        self.dac.writeDacB(0xFFFF)

        ch = [self.A0,self.A1,self.A2,self.A3,self.A4,self.A5]
        for sensor,i in zip(sensorsByChannel,range(len(ch))):
            try:
                if not hasattr(MQSensorsList,sensor):
                    print('sensor must have attribute of MQSensorsList(Enum)')
                    continue
            except TypeError:
                print('sensor must be of type MQSensorsList(Enum)')
                continue
            ch[i] = sensor
        self.A0 = ch[0]
        self.A1 = ch[1]
        self.A2 = ch[2]
        self.A3 = ch[3]
        self.A4 = ch[4]
        self.A3 = ch[5]

    def readChannel(self,channel):
        self.mux.switchChannel(channel)
        time.sleep(.010)  # Wait 10 milliseconds
        value = self.adc.read_adc(3, gain=self.GAIN)
        return value

    def checkChannel(self,channel):
        if (channel == 0):
            return False
        return True

    def readA0(self):
        if not self.checkChannel(self.A0):
            print('Channel A0 is not initialized. Return -1')
            return -1
        value = self.readChannel(self.mux.Channel.A0.name)
        return value

    def readA1(self):
        if not self.checkChannel(self.A1):
            print('Channel A1 is not initialized. Return -1')
            return -1
        value = self.readChannel(self.mux.Channel.A1.name)
        return value

    def readA2(self):
        if not self.checkChannel(self.A2):
            print('Channel A2 is not initialized. Return -1')
            return -1
        value = self.readChannel(self.mux.Channel.A2.name)
        return value

    def readA3(self):
        if not self.checkChannel(self.A3):
            print('Channel A3 is not initialized. Return -1')
            return -1
        value = self.readChannel(self.mux.Channel.A3.name)
        return value

    def readA4(self):
        if not self.checkChannel(self.A4):
            print('Channel A4 is not initialized. Return -1')
            return -1
        value = self.readChannel(self.mux.Channel.A4.name)
        return value

    def readA5(self):
        if not self.checkChannel(self.A5):
            print('Channel A5 is not initialized. Return -1')
            return -1
        value = self.readChannel(self.mux.Channel.A5.name)
        return value
