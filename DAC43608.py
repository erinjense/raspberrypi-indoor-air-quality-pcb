#!/usr/bin/python

import time
import smbus

# Standard mode (100 kbps)
# Fast mode (400 kbps)
# Fast+ mode (1.0 Mbps)


#
# +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
# | MSB | ... | LSB | ACK | MSB | ... | LSB | ACK | MSB | ... | LSB | ACK | MSB | ... | LSB | ACK |
# +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
# | Address (byte)  |     | Command byte    |     | MSDB            |     | LSDB            |     |
# +-----------------+-----+-----------------+-----+-----------------+-----+-----------------+-----+
# | DB [32:24]      |     | DB [23:16]      |     | DB [15:8]       |     | DB [7:0]        |     |
# +-----------------+-----+-----------------+-----+-----------------+-----+-----------------+-----+
#

# Vout = (DACn_DATA / (2^N)) * Vref
#   N = resolution in bits (8 for DAC43608)
#   DACn_DATA decimal equivalent to binary code loaded into DAC reg
#   DACn_DATA ranges from 0 to 2^N - 1


# CLR / LDAC not on Zephyrus IAQ rev a

# DAC43608 Command Byte
# Controls which command is executed and which is being accessed.
# TI 8.5.4 pg 27
# Byte:   B23 - B16
__DAC43608_DEVICE_CONFIG = 1
__DAC43608_STATUS        = 2
__DAC43608_BRDCAST       = 3
__DAC43608_DACA_DATA     = 8
__DAC43608_DACB_DATA     = 9
__DAC43608_DACC_DATA     = 10
__DAC43608_DACD_DATA     = 11
__DAC43608_DACE_DATA     = 12
__DAC43608_DACF_DATA     = 13
__DAC43608_DACG_DATA     = 14
__DAC43608_DACH_DATA     = 15

# DAC43608 Data Byte (MSDB and LSDB)
#


# DACn_DATA Register Field
# B15 - B12 Don't Care
# B11 - B2  DACn_DATA[7:0]
#  B1 - B0  Don't Care

class DAC43608:

    # TODO: Add ~LDAC~ 0V pull down for synchronous mode.
    def syncLDAC(void):
        return

    # TODO: Add ~CLR~ 0V pull down for clearing DAC buffers.
    def clrBuffer(void):
        return

    # TODO: add generic write register.
    def writeRegister(code, data):
        return

    # TODO: add write for DACn_DATA A-H
