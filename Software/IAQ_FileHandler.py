#!/usr/bin/python

import csv
import logging
import os
import datetime

now = datetime.datetime.now()

class FileHandler:
    """
        Controls CSV file manipulation for a series of data loggers.
    """
    def __init__(self,setup_path):
        self.setup_path      = setup_path
        self.headers         = []
        self.sensors         = []
        self.filename        = None

    """
    Setup CSV Object using a CSV file located at "setup_path"
    Setup file holds Id,Type,Version,Sensor Header and a path to CSVs for sensors.
    The CSV for each sensor also holds information about each sensor
    """
    def newCSV(self):
        setup_config = self.csvToDict(self.setup_path)
        log_id   = str(setup_config.get('Id',None)[0])
        log_type = str(setup_config.get('Logger Type',None)[0])
        softwareversion = str(setup_config.get('Software Version',None)[0])
        self.filename = log_type + "_" + "_" + log_id + now.strftime("%Y-%m-%d")
        sensor_path  = setup_config.get('Sensors',None)
        self.sensors = self.csvToDict(sensor_path)
        self.headers = setup_config.get('Headers',None)

        setup_header = ["Logger Type","Logger ID","Software Version","Setup Path","Sensors"]
        # Get a list of names for each sensor
        sensor_names = []
        for s in self.sensors:
            sensor_names.append(s.get("Name",None))
        setup_info = [log_type,log_id,softwareversion,self.setup_path,sensor_names]
        # Append the Setup Header and it's corresponding info. underneath
        # Append Sensor Header last. File is now ready for sensor data.
        with open(self.filename,'a') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(setup_header)   # Setup Info. Header
            writer.writerow(setup_info)
            writer.writerow(self.headers)   # Sensor Header

    # Input:  Path to CSV file
    # Output: Dictionary based on items in CSV
    # The first column is the key, the rest are items. Items can be lists.
    def csvToDict(self,path):
        d = []
        if isinstance(path,list):
            for p in path:
                with open(p,'rb') as f:
                    reader = csv.reader(f,delimiter=',')
                    d.append({rows[0]:rows[1:] for rows in reader})
        else:
            with open(path,'rb') as f:
                reader = csv.reader(f,delimiter=',')
                d = {rows[0]:rows[1:] for rows in reader}
        return d

    def getDataDict(self):
        return dict.fromkeys(self.header,None)

    def writeData(self,data):
        sd = set(data.keys())
        sh = set(self.header)
        b = sd.difference(sh)

        if len(b) == 0:
            with open(self.filename,'a') as csvfile:
                writer = csv.writer(csvfile)
                writer.writerow(list(reversed(data.values())))
