#!/usr/bin/python
from enum import Enum
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
    MQ135 = 9 # Air Quality (CO, Ammonia, Benzene, Alcohol, Smoke)
    MQ136 = 10 # Hydrogen Sulfide Gas
    MQ137 = 11 # Ammonia
    MQ138 = 12 # Benzene, Toluene, Alcohol, Acetone, Propane, Formaldehyde Gas, Hydrogen
    MQ214 = 13 # Methane, Natural Gas
    MQ246 = 14 # Natural Gas, Coal Gas
    ##########################################################################


class Sensor:
    sid   = None
    name = None
    headers = None
    i2c_addr = None
    filename = None
    analog_port = None

    def __init__(self,setup_dictionary=None):
        if (setup_dictionary == None):
            return
