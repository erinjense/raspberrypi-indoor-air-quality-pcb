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
    # Store the Sensor Id for Ports: [A0-A5]
    #########################################
    idList = []
    #########################################
    # Store Mux.Channel.A0 to A5
    #########################################
    portEnumList = []
    #########################################
    # Set the Gain of ADS1115 ADC
    # Ports A0-A5 are multiplexed onto ADC 0
    #########################################
    GAIN = 1
    IAQ_ADS1115_CH = 0
    #########################################

    def __init__(self,sensorsByPort):
        self.adc = Adafruit_ADS1x15.ADS1115()
        self.dac = IAQ_DAC43608.DAC43608()
        self.mux = IAQ_Mux.Mux()
        for chEnum in dir(self.mux.Channel):
            self.portEnumList.append(chEnum)

        self.dac.writeConfig(0x0000)
        self.dac.writeDacA(0xFFFF)
        self.dac.writeDacB(0xFFFF)

        for sensor in sensorsByPort:
            try:
                if not hasattr(SensorIdEnum,sensor):
                    print('sensor must have attribute of SensorIdEnum(Enum)')
                    continue
            except TypeError:
                print('sensor must be of type SensorIdEnum(Enum)')
                continue
            self.idList.append(sensor)

    def getPortNumById(self,sensor_id):
        for ch,idx in zip(self.idList,range(len(self.idList))):
            if ch == sensor_id:
                return idx
        raise ValueError('Sensor, '+sensor_id+' ,is not assigned to a port.')

    def readPort(self,portNum):
        portEnum = self.portEnumList[portNum]
        if portEnum is not self.currentPort:
            self.currentPort = portEnum
            self.mux.switchChannel(portEnum)
            time.sleep(.010)  # Wait 10 milliseconds
        value = self.adc.read_adc(self.IAQ_ADS1115_CH, gain=self.GAIN)
        return value
