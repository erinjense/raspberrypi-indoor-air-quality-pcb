#!/usr/bin/python

import csv
import logging
import os
import datetime

now = datetime.datetime.now()

class Csv:
    """
        Controls CSV file manipulation for a series of data loggers.

            Data Logger Information (loggerinfo)
                Data Logger type (Air Quality, Furnace, Energy, etc.)
                Unique Identifier
                Software Version
                Field Names: The column corresponding to data type

            Sensor Module Information (moduleinfo)
                Calibration Date, Parameters

         Functions:
            setFieldNames: Set to a default value based on Data Logger Type.
                           Can be changed dynamically.
            writeData: Write Data row by row, based on data in and field name
    """
    def __init__(self,setup_path):
        self.setup_path      = setup_path
        self.filename        = None
        self.type            = None
        self.id              = None
        self.softwareversion = None
        self.sensors         = []
        self.headers         = []

    # Input:  Path to CSV file
    # Output: Dictionary based on items in CSV
    # The first column is the key, the rest are items. Items can be lists.
    def csvToDict(self,path):
        with open(path,'rb') as f:
            reader = csv.reader(f,delimiter=',')
            return {rows[0]:rows[1:] for rows in reader}

    """
    Iterate through iterable such as sensor_paths or headers when multiple of
    those are pulled from a CSV row. Append item to sensors or headers,etc.
    When item=None then the item is a dictionary based on p=path.

    @param iterable: item to iterate such as multiple header paths or CSV paths
    @param myList:   list to append item to
    @param item:     if item=None then return a Dictionary based on p=path
    """
    def iterAppend(self,iterable,myList,item=None):
        for p in iterable:
            if p and item: myList.append(item)
            else:          myList.append(self.csvToDict(p))
    """
    Setup CSV Object using a CSV file located at "setup_path"
    Setup file holds Id,Type,Version and paths to CSV for sensors and headers
    The CSV for each sensor also holds information about each sensor
    """
    def setupNewFile(self):
        # General Logger Information
        setup_config = self.csvToDict(self.setup_path)
        self.id      = str(setup_config.get('Id',None)[0])
        self.type    = str(setup_config.get('Logger Type',None)[0])
        self.softwareversion = str(setup_config.get('Software Version',None)[0])
        self.filename = self.type+"_"+"_"+self.id+now.strftime("%Y-%m-%d")
        # Get All Sensor Information
        sensor_path = setup_config.get('Sensors',None)
        self.iterAppend(sensor_path,self.sensors)
        # Get Desired CSV Headers
        header_path = setup_config.get('Headers',None)
        self.iterAppend(header_path,self.headers)

        print "---------------------------------------------------------------"
        print "             CSV for Sensor Logging Created"
        print "---------------------------------------------------------------"
        print "CSV Filename:"       + self.filename
        print "CSV Header Format:"
        print str(self.headers)
        print "Logger Setup Path:"  + self.setup_path
        print "Logger Type: "       + self.type
        print "Logger Id: "         + self.id
        print "Software Version: "  + self.softwareversion
        print "Loaded Sensors:"
        for s in self.sensors:
            print s

    def setHeader(self,header):
        self.header = header

    def writeData(self,data):
        with open(self.filename,'a') as csvfile:
            writer = csv.DictWriter(csvfile,fieldnames=self.header)
            for key,val in data.items():
                writer.writerow([key, value])

    def writeHeader(self):
        with open(self.filename,'a') as csvfile:
            writer = csv.DictWriter(csvfile,fieldnames=self.header)
            writer.writeheader()
