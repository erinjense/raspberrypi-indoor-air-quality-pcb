class LoggerConfig:
    LOGGER_ID        = "MSU-ECE-2019"
    SOFTWARE_VERSION = "1.0"
    GITHUB           = "https://github.com/aaronjense/zephyrus-iaq"


class SensorConfig:
    FAILSAFE_FOLDER = "failsafe/"
    DEFAULT_FOLDER  = "/media/zephyrus-iaq-usb/zephyrus-iaq/"
    ###########################################################################
    # Default Sensor Setup Info.
    ###########################################################################
    STORAGE_KEYS = ["Date(YYYY/MM/DD)", "Time(HH:MM:SS)", "Location(Deg)", 
            "Temp(C)","Humidity(RH)", "Pressure(hPa)"]

    MQ2_DICT = {
            "Port"    : 'A0',
            "Focus"   : 'Propane (Raw)',
            "DataKeys": ['LPG, Propane, Hydrogen (RAW)'],
            "Status"  : 'On'
            }
    MQ4_DICT = {
            "Port"   : 'A1',
            "Focus"  : 'Methane (Raw)',
            "DataKeys": ['Methane, Natural Gas (RAW)'],
            "Status"  : 'On'
            }
    MQ5_DICT = {
            "Port"   : 'A2',
            "Focus"  : 'Natural Gas (Raw)',
            "DataKeys": ['LPG, Natural Gas, Coal Gas (RAW)'],
            "Status"  : 'On'
            }
    MQ6_DICT = {
            "Port"   : 'A3',
            "Focus"  : 'LPG (Raw)',
            "DataKeys": ['LPG, ISO-Butane, Propane (RAW)'],
            "Status"  : 'On'
            }
    MQ7_DICT = {
            "Port"   : 'A4',
            "Focus"  : 'CO (Raw)',
            "DataKeys": ['Carbon Monoxide (RAW)'],
            "Status"  : 'Off'
            }
    MQ135_DICT = {
            "Port"   : 'A5',
            "Focus"  : 'NH3 (Raw)',
            "DataKeys": ['NH3, NOx, Benzene, Smoke (RAW)'],
            "Status"  : 'Off'
            }
    SCD30_DICT = {
            "Port"   : 'SoftSerial',
            "Focus"  : 'CO2 (PPM)',
            "DataKeys": ['CO2 (PPM)'],
            "Status"  : 'On'
            }
    SDS011_DICT = {
            "Port"   : '/dev/ttyUSB0',
            "Focus": ['PM2.5 (PPM)','PM10 (PPM)'],
            "DataKeys": ['PM2.5 (ug/m^3)','PM10 (ug/m^3)'],
            "Status"  : 'On'
            }
    BME680_DICT = {
            "Port"   : 'I2C',
            "Focus"  : 'VOC (Ohms)',
            "DataKeys": ['VOC (Ohms)'],
            "Status"  : 'On'
            }

    SENSOR_DICT = {
            "MQ2"    : MQ2_DICT,
            "MQ4"    : MQ4_DICT,
            "MQ5"    : MQ5_DICT,
            "MQ6"    : MQ6_DICT,
            "MQ7"    : MQ7_DICT,
            "MQ135"  : MQ135_DICT,
            "BME680" : BME680_DICT,
            "SCD30"  : SCD30_DICT,
            "SDS011" : SDS011_DICT
            }
