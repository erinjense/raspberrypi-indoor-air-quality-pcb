#!/usr/bin/python
from enum import Enum
import sqlite3
from IAQ_Exceptions import *
from IAQ_MqGas import MqGas

class SensorInfo:
    DEFAULT_DB=".sqlite/default.db"
    ##########################################################################################################
    # Default Sensor Setup Info.
    ##########################################################################################################
    SETUP_KEYS = ["name","type","port","status","manufacturer","cal","setup_db","setup_header"]
    SETUP_HEADER=\
            '''{0} TEXT, {1} TEXT, {2} TEXT, {3} TEXT, 
            {4} TEXT, {5} TEXT, {6} TEXT, {7} TEXT
            '''.format(*SETUP_KEYS)
    SENSORS_TABLE=\
            '''CREATE TABLE Sensors 
            ({0} TEXT, {1} TEXT, {2} TEXT, {3} TEXT, 
            {4} TEXT, {5} TEXT, {6} TEXT, {7} TEXT)
            '''.format(*SETUP_KEYS)

    MQ_DATA_KEYS = ['Methane,Butane,LPG,Smoke',
                 'Alcohol,Ethanol,Smoke',
                 'Methane, CNG Gas',
                 'Natural Gas, LPG',
                 'LPG,Butane Gas',
                 'Carbon Monoxide,Flammable',
                 'Hydrogen Gas',
                 'Carbon Monoxide']

    DATA_KEYS = MQ_DATA_KEYS + ['CO2','Particulate']
 
    @staticmethod
    def getSensorSetup():
        ports = ['A0','A1','A2','A3','A4','A5']
        manufacturer = 'Flying Fish'
        path = SensorInfo.DEFAULT_DB
        setupList = []

        for sid,i in zip(SensorIdEnum,range(len(SensorInfo.DATA_KEYS))):
            name = sid.name
            status="OFF"
            port = None
            if "MQ" in name:
                manufacturer = 'Flying Fish'
            elif "BME680" is name:
                manufacturer = 'Sparkfun Module'
            elif "SDC30" is name:
                manufacturer = 'Sensiron'
            else:
                manufacturer = 'Unavailable'
            # TEMP!!!: Remove once database can store and setup sensors through GUI
            if i < 6:
                status="ON"
                port = ports[i]
            key = SensorInfo.DATA_KEYS[i]
            calibration=None

            setup =\
                    '''INSERT INTO Sensors VALUES 
                    ('{0}','{1}',
                    '{2}','{3}',
                    '{4}','{5}',
                    '{6}','{7}')
                    '''.format(name,key,port,status,manufacturer,calibration,path,None)
            setupList.append(setup)
        return setupList

    ##########################################################################################################
    # Default Sensor Storage
    ##########################################################################################################
    STORAGE_KEYS = ["Date(YYYY/MM/DD)","Time(HH:MM:SS)","Location(Deg)","Temp(C)","Humidity(RH)"]
    STORAGE_FMT = ''' ("{0}" TEXT,"{1}" TEXT,"{2}" REAL,"{3}" REAL,"{4}" REAL,"{5}" REAL)'''
    STORAGE_INSERT_FMT = ''' ("{0}","{1}",{2},{3},{4},{5})'''
    @staticmethod
    def getStorageSetup():
        setupList = []
        for sid,dkey in zip(SensorIdEnum,SensorInfo.MQ_DATA_KEYS):
            if "MQ" in sid.name:
                dkey = dkey+"(PPM)"
            table_info = SensorInfo.STORAGE_KEYS
            table_info.append(dkey)
            data_header = SensorInfo.STORAGE_FMT.format(*table_info)
            sensor_table = "CREATE TABLE {0}".format(sid.name)+data_header
            setupList.append(sensor_table)
        return setupList

    @staticmethod
    def getInsertCmd(sensor_id):
        insertCmd = "INSERT INTO {0} VALUES".format(sensor_id.name)\
                        + SensorInfo.STORAGE_INSERT_FMT
        return insertCmd


    ##########################################################################################################

class SensorIdEnum(Enum):
    ##########################################################################
    # The following Sensor list was provided at:
    # https://www.strawdogs.co/2018/06/MQ-Gas-Sensors-List
    ##########################################################################
    MQ2   = 0  # Methane, Butane, LPG, Smoke
    MQ3   = 1  # Alcohol, Ethanol, Smoke
    MQ4   = 2  # Methane, CNG Gas
    MQ5   = 3  # Natural Gas, LPG
    MQ6   = 4  # LPG, Butane Gas
    MQ7   = 5  # Carbon Monoxide
    MQ8   = 6  # Hydrogen Gas
    MQ9   = 7  # Carbon Monoxide, Flammable Gas
    MQ131 = 8  # Ozone
    MQ135 = 9  # Air Quality (CO, Ammonia, Benzene, Alcohol, Smoke)
    MQ136 = 10 # Hydrogen Sulfide Gas
    MQ137 = 11 # Ammonia
    MQ138 = 12 # Benzene, Toluene, Alcohol, Acetone, Propane, Formaldehyde Gas, Hydrogen
    MQ214 = 13 # Methane, Natural Gas
    MQ246 = 14 # Natural Gas, Coal Gas

    BME680 = 15 # Temperature, Humidity, VOCs
    SDS011 = 16 # Particulates (PM2.5 and PM10)
    SCD30  = 17 # CO2
    ##########################################################################

class Sensor:
    name        = None
    stype       = None
    port        = None
    status      = None
    maker       = None
    calibration = None
    setupDb     = None
    sid         = None
    _Sensor     = None
    portController = None

    def __init__(self, setupDictionary=None, portController=None):
        self.name        = setupDictionary[SensorInfo.SETUP_KEYS[0]]
        self.type        = setupDictionary[SensorInfo.SETUP_KEYS[1]]
        self.port        = setupDictionary[SensorInfo.SETUP_KEYS[2]]
        self.status      = setupDictionary[SensorInfo.SETUP_KEYS[3]]
        self.maker       = setupDictionary[SensorInfo.SETUP_KEYS[4]]
        self.calibration = setupDictionary[SensorInfo.SETUP_KEYS[5]]
        self.setupDb     = setupDictionary[SensorInfo.SETUP_KEYS[6]]
        self.sid         = SensorIdEnum[self.name]
        self.portController = portController
        try:
            if "MQ" in self.name:
                self._Sensor = MqGas(self.sid,self.portController);
                if self.status == "ON":
                    self.turnOn()
                elif self.status == "OFF":
                    self.turnOff()
        except SensorSetupError:
            raise SensorIsOff('Sensor was labeled ON, but has no assigned port.')

    def getData(self):
        data = None
        try:
            if self.status == "ON":
                data = self._Sensor.getData()
        except SensorSetupError:
            raise SensorSetupError('Leaving Sensor.getData()')
        if data == None: raise SensorReadError('Error Reading Senor: '+self.name)
        return data

    def turnOff(self):
        self._Sensor.turnOff()

    def turnOn(self):
        self._Sensor.turnOn()
