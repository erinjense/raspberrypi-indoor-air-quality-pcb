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
        self.adc = Adafruit_ADS1x15.ADS1115()
        self.dac = IAQ_DAC43608.DAC43608()
        self.mux = IAQ_Mux.Mux()
        self.setPortVoltage()

    def getPortNumById(self,sensor_id):
        for port,entry in self.portIdDict.items():
            entry = dict(entry)
            name = entry["Name"]
            if sensor_id.name == name:
                return port
        raise ValueError('Sensor, '+sensor_id.name+' ,is not assigned to a port.')

    def readPort(self,portNum):
        if portNum is not self.currentPort:
            self.currentPort = portNum
            self.mux.switchChannel(portNum)
            time.sleep(.010)  # Wait 10 milliseconds
        value = self.adc.read_adc(self.IAQ_ADS1115_CH, gain=self.GAIN)
        return value

    def setPortVoltage(self):
        self.dac.writeConfig(0x0000)
        for port,entry in self.portIdDict.items():
            entry = dict(entry)
            status = entry["Status"]
            if (status == "ON"):
                self.turnOn(port)
            elif (status == "OFF"):
                self.turnOff(port)

    def turnOn(self,port):
        self.setVoltage(port,0xFFFF)

    def turnOff(self,port):
        self.setVoltage(port,0x0000)

    def setVoltage(self,port,voltage):
        try: self.checkPortInput(port)
        except TypeError: raise TypeError('Error setVoltage')
        if port is self.mux.Channel.A0.name:
            self.dac.writeDacA(voltage)
        elif port is self.mux.Channel.A1.name:
            self.dac.writeDacB(voltage)
        elif port is self.mux.Channel.A2.name:
            self.dac.writeDacC(voltage)
        elif port is self.mux.Channel.A3.name:
            self.dac.writeDacD(voltage)

    def checkPortInput(self,port):
        try:
            if not hasattr(self.mux.Channel,port):
                print('port must have attribute of Mux.Channel(Enum)')
        except TypeError:
            raise TypeError('port must be of type Mux.Channel(Enum)')
