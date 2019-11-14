#!/usr/bin/python

import csv
import sqlite3
from GUI.IAQ_GUI import *
from contextlib import closing
from IAQ_Exceptions import *
from Sensors.IAQ_Sensor import SensorInfo

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

    def createDefaultDatabase(self):
        if (self._fileExists(SensorInfo.DEFAULT_DB) == True): return

        with closing (sqlite3.connect(SensorInfo.DEFAULT_DB))\
                as con, con, closing(con.cursor()) as c:
            try:
                c.execute(SensorInfo.SENSORS_TABLE)
                for table in SensorInfo.getStorageSetup():
                    c.execute(table)
                con.commit()
            except sqlite3.OperationalError:
                raise sqlite3.OperationalError('Invalid SQLite Input')
            for i in SensorInfo.getSensorSetup():
                c.execute(i)

    def getSensorConfig(self):
        configDict = {}
        with closing (sqlite3.connect(SensorInfo.DEFAULT_DB))\
                as con, con, closing(con.cursor()) as c:
            con.row_factory = sqlite3.Row
            c.execute("select * from Sensors")
            keys = [description[0] for description in c.description]
            for row in c:
                config = dict(zip(keys,row))
                configDict[config["name"]] = config.items()
        return configDict

    def writeSensorData(self,dataList=None,sensor_id=None):
        if dataList == None or sensor_id == None:
            raise InvalidArguement('InvalidArguement(writeSensorData): Data or Sensor Id.')
        with closing (sqlite3.connect(SensorInfo.DEFAULT_DB))\
                as con, con, closing(con.cursor()) as c:
            
            transaction = SensorInfo.getInsertCmd(sensor_id).format(*dataList)
            c.execute(transaction)
            con.commit()
        return transaction

    def _fileExists(self,f=None):
        try: open(f, 'r') 
        except IOError: return False
        return True
