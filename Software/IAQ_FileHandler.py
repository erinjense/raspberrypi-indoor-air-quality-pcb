#!/usr/bin/python

import csv
import os
from GUI.IAQ_GUI    import *
from IAQ_Exceptions import *
from IAQ_Config     import SensorConfig

class FileHandler:

    # This mount point is configured in Software/Setup/usb-port-setup.sh
    DEFAULT_USB_MNT = "/dev/zephyrus-iaq-usb"
    ERR_NOT_MOUNTED = 256
    ERR_IS_MOUNTED  = 8192

    def newCsv(self,filename=None,sensor_name=None):
        with open(filename,'a') as csvfile:
            writer = csv.writer(csvfile)
            header = self._getSensorCsvHeader(sensor_name)
            writer.writerow(header)

    def writeDataToCSV(self,data,filename=None):
        if (self._fileExists(filename) == False):
            raise CsvPathErr('CSV file path does not exist.')
        with open(filename,'a') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(data)

    def createStorageFolder(self, path = None):
        if path == None: path = SensorConfig.FAILSAFE_FOLDER
        if (self._fileExists(path) == True): return
        os.makedirs(path)

    def _getSensorCsvHeader(self, sensor_id):
        sensor_config = SensorConfig.SENSOR_DICT.get(sensor_id)
        data_keys     = sensor_config.get("DataKeys")
        header        = SensorConfig.STORAGE_KEYS + data_keys
        return header

    def _fileExists(self,f=None):
        try: open(f, 'r') 
        except IOError: return False
        return True

    ###############################################################################
    # USB Storage Manipulation
    ###############################################################################
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
