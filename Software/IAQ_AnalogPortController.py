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
    port = None
    A0  = None 
    A1  = None 
    A2  = None 
    A3  = None 
    A4  = None 
    A5  = None 
    idList = None
    GAIN = 1
    IAQ_ADS1115_CH = 0

    def __init__(self,sensorsByPort):
        self.adc = Adafruit_ADS1x15.ADS1115()
        self.dac = IAQ_DAC43608.DAC43608()
        self.mux = IAQ_Mux.Mux()
        self.dac.writeConfig(0x0000)
        self.dac.writeDacA(0xFFFF)
        self.dac.writeDacB(0xFFFF)

        self.idList = [self.A0,self.A1,self.A2,self.A3,self.A4,self.A5]
        for sensor,i in zip(sensorsByPort,range(len(self.idList))):
            try:
                if not hasattr(SensorIdEnum,sensor):
                    print('sensor must have attribute of SensorIdEnum(Enum)')
                    continue
            except TypeError:
                print('sensor must be of type SensorIdEnum(Enum)')
                continue
            self.idList[i] = sensor
        self.A0 = self.idList[0]
        self.A1 = self.idList[1]
        self.A2 = self.idList[2]
        self.A3 = self.idList[3]
        self.A4 = self.idList[4]
        self.A5 = self.idList[5]

    def getPortById(self,sensor_id):
        for ch,idx in zip(self.idList,range(len(self.idList))):
            if ch == sensor_id:
                return idx
        return -1

    def readPort(self,port):
        if not port in self.idList:
            print("Port A"+port+" is not initialized.")
            return -1
        if port is not self.port:
            self.mux.switchChannel(port)
            time.sleep(.010)  # Wait 10 milliseconds
        value = self.adc.read_adc(self.IAQ_ADS1115_CH, gain=self.GAIN)
        return value
