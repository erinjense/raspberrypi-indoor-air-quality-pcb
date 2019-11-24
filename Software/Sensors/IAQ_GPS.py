#!/usr/bin/python

from third_party.Adafruit_I2C import *
import pynmea2
import serial

class GPS():
    sid = None
    portController = None
	port = "/dev/ttyS0"
    

    def __init__(self,sensor_id=None,portController=None):
		self.sid = sensor_id
		self.portController = portController
		gpsData = self.serialPort.readline()
		getData(gpsData)
        
    def getData(gpsData):
        try:
		
			if gpsData.find('GNGGA') > 0
				data = pynmea2.parse(gpsData)
				#print "Timestamp: %s -- Lat: %s %s -- Lon: %s %s -- Altitude: %s %s -- Satellites: %s" % (msg.timestamp,msg.lat,msg.lat_dir,msg.lon,msg.lon_dir,msg.altitude,msg.altitude_units,msg.num_sats)
			
        except IOError:
            pass
        return data