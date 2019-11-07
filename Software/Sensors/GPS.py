# !/usr/bin/python
'''
2018 / 09 / 16
Shaun Bowman
v0.001 - proof of concept
xa1110_gps.py
https://github.com/sbow/xa1110_i2c_python_GPS
A python driver for interacting with the Sparkfun GPS-14414 chip - an i2c based GPS products using a XA1110 gps chip.
This driver implements communication with the chip using i2c, via the smbus2 library
NOTE:
    root access typically required to access i2c
    either grant permission to user for i2c, or run with sudo, "sudo python xa1110_gps.py"
'''''

# uses smbus2 to interct with i2c device - pip install smbus2
from smbus2 import SMBusWrapper
import string

ADDR = 16   # DECIMAL address of i2c device, i2c
            # use 'sudo i2cdetect -y -r 1' where 1
            # is the bus number for your i2c device.
            # Note: output is in HEX, must convert to
            # DECIMAL here.
            # Default is 0x10h (16d) for GPS-14414

BUS = 1     # i2c bus number, 1 for my nVidia Jetson TX1 project

b_run = True
while( b_run ):
    with SMBusWrapper(BUS) as bus:
        # Read a block of 16 bytes from address 16, offset 0
        block = bus.read_i2c_block_data(ADDR, 0, 16)
        char_list = [ str( unichr( block[i] ) ) for i in range( len( block ) ) ]
        raw_strng = "".join( char_list )
        if all( x == "\n" for x in char_list ):
            # if all elements of char_list are equal to newline, stop
            b_run = False
        else:
            clean_strng = raw_strng.replace('\r', '').replace('\n', '')
            print( clean_strng )

# functions to be filled in
def get_lat_lon():
    # populates lat_lon, hh.mmmm,N hhh.mmmm,W
    pass

def get_nmea():
    # returns full NMEA sentances
    pass

def n_sat():
    # returns number of satilates active
    pass

def get_gsa():
    # returns NMEA GSA active satelite sentence
    pass

def get_gsv():
    # returns NMEA GSV visible, unusable, satilites
    pass