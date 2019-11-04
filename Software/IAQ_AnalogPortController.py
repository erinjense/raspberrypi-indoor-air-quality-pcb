#!/usr/bin/python

from HAT import IAQ_DAC43608
from HAT import IAQ_Mux
from Sensors.IAQ_Sensor import SensorIdEnum
from third_party import Adafruit_ADS1x15
import time

class AnalogPortController:
    adc = None
    dac = None
    mux = None
    channel = None
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
                if not hasattr(SensorIdEnum,sensor):
                    print('sensor must have attribute of SensorIdEnum(Enum)')
                    continue
            except TypeError:
                print('sensor must be of type SensorIdEnum(Enum)')
                continue
            ch[i] = sensor
        self.A0 = ch[0]
        self.A1 = ch[1]
        self.A2 = ch[2]
        self.A3 = ch[3]
        self.A4 = ch[4]
        self.A3 = ch[5]

    def readChannel(self,channel):
        if not (channel == self.channel):
            self.mux.switchChannel(channel)
            time.sleep(.010)  # Wait 10 milliseconds
        value = self.adc.read_adc(0, gain=self.GAIN)
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
