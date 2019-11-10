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
    #########################################
    # Store the port that ADC is receiving on
    #########################################
    currentPort = None
    #########################################
    # Store a dictionary of Port and Sensor Id
    # E.g. {'A0':,SensorIdEnum.MQ2.name,...}
    #########################################
    portIdDict = None
    #########################################
    # Set the Gain of ADS1115 ADC
    # Ports A0-A5 are multiplexed onto ADC 0
    #########################################
    GAIN = 1
    IAQ_ADS1115_CH = 0
    #########################################
 
    def __init__(self,sensorPortDict=None):

        self.portIdDict = sensorPortDict
        for sensor in self.portIdDict.values():
            try:
                if not hasattr(SensorIdEnum,sensor):
                    print('sensor must have attribute of SensorIdEnum(Enum)')
                    continue
            except TypeError:
                print('sensor must be of type SensorIdEnum(Enum)')
                continue

        self.adc = Adafruit_ADS1x15.ADS1115()
        self.dac = IAQ_DAC43608.DAC43608()
        self.mux = IAQ_Mux.Mux()

        self.dac.writeConfig(0x0000)
        self.turnPortsOn()

    def getPortNumById(self,sensor_id):
        for key,val in self.portIdDict.items():
            if sensor_id.name == val:
                return key
        raise ValueError('Sensor, '+sensor_id.name+' ,is not assigned to a port.')

    def readPort(self,portNum):
        if portNum is not self.currentPort:
            self.currentPort = portNum
            self.mux.switchChannel(portNum)
            time.sleep(.010)  # Wait 10 milliseconds
        value = self.adc.read_adc(self.IAQ_ADS1115_CH, gain=self.GAIN)
        return value

    def turnPortsOn(self):
        for key,val in self.portIdDict.items():
            if key is self.mux.Channel.A0.name and val != None:
                self.dac.writeDacA(0xFFFF)
            elif key is self.mux.Channel.A1.name and val != None:
                self.dac.writeDacB(0xFFFF)
            elif key is self.mux.Channel.A2.name and val != None:
                self.dac.writeDacC(0xFFFF)
            elif key is self.mux.Channel.A3.name and val != None:
                self.dac.writeDacD(0xFFFF)
#            elif key is self.mux.Channel.A4.name and val != None:
#                self.dac.writeDacE(0xFFFF)
#            elif key is self.mux.Channel.A5.name and val != None:
#                self.dac.writeDacF(0xFFFF)

    def turnPortsOff(self):
        for key,val in self.portIdDict.items():
            if key is self.mux.Channel.A0.name and val == None:
                self.dac.writeDacA(0x0000)
            elif key is self.mux.Channel.A1.name and val == None:
                self.dac.writeDacB(0x0000)
            elif key is self.mux.Channel.A2.name and val == None:
                self.dac.writeDacC(0x0000)
            elif key is self.mux.Channel.A3.name and val == None:
                self.dac.writeDacD(0x0000)
#            elif key is self.mux.Channel.A4.name and val == None:
#                self.dac.writeDacE(0x0000)
#            elif key is self.mux.Channel.A5.name and val == None:
#                self.dac.writeDacF(0x0000)
