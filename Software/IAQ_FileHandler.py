#!/usr/bin/python

import csv

class FileHandler:

    def newCsv(self,filename=None,setup_info=None,setup_header=None,headers=None):
        # Append the Setup Header and it's corresponding info. underneath
        # Append Sensor Header last. File is now ready for sensor data.
        with open(filename,'a') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(setup_header)   # Setup Info. Header
            writer.writerow(setup_info)
            writer.writerow(headers)   # Sensor Header

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

    def getDataDict(self,header=None):
        return dict.fromkeys(header,None)

    def writeData(self,data=None,filename=None):
        sd = set(data.keys())
        sh = set(self.header)
        b = sd.difference(sh)

        if len(b) == 0:
            with open(filename,'a') as csvfile:
                writer = csv.writer(csvfile)
                writer.writerow(list(reversed(data.values())))
