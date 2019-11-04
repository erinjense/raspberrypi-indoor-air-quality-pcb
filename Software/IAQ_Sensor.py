#!/usr/bin/python

class SensorIdEnum(Enum):
    ##########################################################################
    # The following Sensor list was provided at:
    # https://www.strawdogs.co/2018/06/MQ-Gas-Sensors-List
    ##########################################################################
    MQ2   = 1  # Methane, Butane, LPG, Smoke
    MQ3   = 2  # Alcohol, Ethanol, Smoke
    MQ4   = 3  # Methane, CNG Gas
    MQ5   = 4  # Natural Gas, LPG
    MQ6   = 5  # LPG, Butane Gas
    MQ7   = 6  # Carbon Monoxide
    MQ8   = 7  # Hydrogen Gas
    MQ9   = 8  # Carbon Monoxide, Flammable Gas
    MQ131 = 9  # Ozone
    MQ135 = 10 # Air Quality (CO, Ammonia, Benzene, Alcohol, Smoke)
    MQ136 = 11 # Hydrogen Sulfide Gas
    MQ137 = 12 # Ammonia
    MQ138 = 13 # Benzene, Toluene, Alcohol, Acetone, Propane, Formaldehyde Gas, Hydrogen
    MQ214 = 14 # Methane, Natural Gas
    MQ246 = 15 # Natural Gas, Coal Gas
    ##########################################################################


class IAQ_Sensor:
    self.id   = None
    self.name = None
    self.headers = None
    self.i2c_addr = None
    self.filename = None
    self.analog_port = None
