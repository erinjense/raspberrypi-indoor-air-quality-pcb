#!/usr/bin/python

import csv
import sqlite3
import os
from GUI.IAQ_GUI import *
from contextlib import closing
from IAQ_Exceptions import *
from Sensors.IAQ_Sensor import SensorInfo

class FileHandler:

    # This mount point is configured in Software/Setup/usb-port-setup.sh
    DEFAULT_USB_MNT="/dev/zephyrus-iaq-usb"
    ERR_NOT_MOUNTED=256
    ERR_IS_MOUNTED=8192

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

    def mountUSB(self, mountPath = None):
        if mountPath == None: mountPath = self.DEFAULT_USB_MNT
        out = os.system("mount " + mountPath)
        if out == self.ERR_NOT_MOUNTED:
            raise UsbNotAttached('mountUSB: USB is not attached to port.')
        elif out == self.ERR_IS_MOUNTED:
            raise UsbIsMounted('mountUSB: USB is already mounted.')

    def umountUSB(self, mountPath = None):
        if mountPath == None: mountPath = self.DEFAULT_USB_MNT
        out = os.system("umount " + mountPath)
        if out == self.ERR_NOT_MOUNTED:
            raise UsbNotMounted('umountUSB: USB is not mounted.')
 
    def writeData(self,data=None,filename=None):
        sd = set(data.keys())
        sh = set(self.header)
        b = sd.difference(sh)

        if len(b) == 0:
            with open(filename,'a') as csvfile:
                writer = csv.writer(csvfile)
                writer.writerow(list(reversed(data.values())))

    def createStorageFolder(self, path = None):
        if path == None: path = SensorInfo.FAILSAFE_FOLDER
        if (self._fileExists(path) == True): return
        os.makedirs(path)

    def createDatabase(self, path = None):
        if path == None: path = SensorInfo.FAILSAFE_FOLDER
        if (self._fileExists(path) == True): return

        try:
            with closing (sqlite3.connect(path))\
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
        except sqlite3.OperationalError:
            raise SqlitePathErr('The DEFAULT_DB path does not exist yet.')

    def getSensorConfig(self, path = None):
        if path == None: path = SensorInfo.FAILSAFE_DB
        configDict = {}
        with closing (sqlite3.connect(path))\
                as con, con, closing(con.cursor()) as c:
            con.row_factory = sqlite3.Row
            c.execute("select * from Sensors")
            keys = [description[0] for description in c.description]
            for row in c:
                config = dict(zip(keys,row))
                configDict[config["name"]] = config.items()
        return configDict

    def writeSensorData(self, dataList=None, sensor_id=None, path=None):
        if dataList == None or sensor_id == None:
            raise InvalidArguement('InvalidArguement(writeSensorData): Data or Sensor Id.')
        if path == None: path = SensorInfo.FAILSAFE_DB
        with closing (sqlite3.connect(path))\
                as con, con, closing(con.cursor()) as c:
            
            transaction = SensorInfo.getInsertCmd(sensor_id).format(*dataList)
            c.execute(transaction)
            con.commit()
        return transaction

    def _fileExists(self,f=None):
        try: open(f, 'r') 
        except IOError: return False
        return True
