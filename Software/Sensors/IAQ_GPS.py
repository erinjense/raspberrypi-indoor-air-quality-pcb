#!/usr/bin/python

from third_party.Adafruit_I2C import *
from IAQ_Exceptions import *
import pynmea2
import serial

class IAQ_GPS():
    sid = None
    portController = None
    port = "/dev/ttySOFT0"
        

    def __init__(self,sensor_id=None,portController=None):
		self.sid = sensor_id
		self.portController = portController
                	
        
    def getLocation(self):
        
        
        try:
            location = None
            serialPort = serial.Serial("/dev/ttySOFT0",baudrate = 9600, timeout = .5)
	    gpsData = serialPort.readline()
	    #print(gpsData)
	    if gpsData.find('GNGGA') > 0:
		    msg = pynmea2.parse(gpsData)
		    lati = "%.8s"%msg.lat
                    lon = "%.8s"%msg.lon
                    ladir = msg.lat_dir
                    lodir = msg.lon_dir

                    location = (lati+ladir+lon+lodir)
                    #print(location)
            else:
                location = "No Lock"
        except IOError:
            pass
        except pynmea2.ParseError:
            pass
        except pynmea2.ChecksumError:
            pass
        except TypeError:
            pass

        print (location)
        return location
    def getData(self):
        print(self.getLocation())
        return self.getLocation()
