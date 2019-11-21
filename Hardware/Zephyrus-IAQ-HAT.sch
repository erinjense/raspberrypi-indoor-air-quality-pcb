EESchema Schematic File Version 4
LIBS:Zephyrus-IAQ-HAT-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 7
Title "Top Level"
Date "2019-11-15"
Rev "A"
Comp "Zephyrus, Indoor Air Quality - Raspberry Pi HAT"
Comment1 "Designed By Aaron Jense"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L zephyrus_iaq:GND #PWR011
U 1 1 580C1D11
P 2850 3200
F 0 "#PWR011" H 2850 2950 50  0001 C CNN
F 1 "GND" H 2850 3050 50  0000 C CNN
F 2 "" H 2850 3200 50  0000 C CNN
F 3 "" H 2850 3200 50  0000 C CNN
	1    2850 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1350 2850 1750
Wire Wire Line
	2850 2750 2750 2750
Wire Wire Line
	2850 2550 2750 2550
Connection ~ 2850 2750
Wire Wire Line
	2850 2050 2750 2050
Connection ~ 2850 2550
Wire Wire Line
	2850 1750 2750 1750
Connection ~ 2850 2050
Wire Wire Line
	2150 3050 2250 3050
Wire Wire Line
	2150 2350 2250 2350
Connection ~ 2150 3050
Connection ~ 2050 1150
Wire Wire Line
	2050 1950 2250 1950
Wire Wire Line
	2050 1150 2250 1150
Wire Wire Line
	2050 1000 2050 1150
$Comp
L zephyrus_iaq:+3.3V #PWR01
U 1 1 580C1BC1
P 2050 1000
F 0 "#PWR01" H 2050 850 50  0001 C CNN
F 1 "+3.3V" H 2050 1140 50  0000 C CNN
F 2 "" H 2050 1000 50  0000 C CNN
F 3 "" H 2050 1000 50  0000 C CNN
	1    2050 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1250 1100 1250
Wire Wire Line
	1100 1350 2250 1350
Wire Wire Line
	1100 1450 2250 1450
Wire Wire Line
	2250 1650 1100 1650
Wire Wire Line
	1100 1750 2250 1750
Wire Wire Line
	1100 1850 2250 1850
Wire Wire Line
	2250 2050 1100 2050
Wire Wire Line
	1100 2150 2250 2150
Wire Wire Line
	1100 2250 2250 2250
Wire Wire Line
	2250 2450 1100 2450
Wire Wire Line
	1100 2550 2250 2550
Wire Wire Line
	1100 2650 2250 2650
Wire Wire Line
	2250 2750 1100 2750
Wire Wire Line
	1100 2850 2250 2850
Wire Wire Line
	1100 2950 2250 2950
Wire Wire Line
	2750 2850 3800 2850
Wire Wire Line
	2750 2950 3800 2950
Wire Wire Line
	2750 2350 3800 2350
Wire Wire Line
	2750 2450 3800 2450
Wire Wire Line
	2750 2150 3800 2150
Wire Wire Line
	2750 2250 3800 2250
Wire Wire Line
	2750 1850 3800 1850
Wire Wire Line
	2750 1950 3800 1950
Wire Wire Line
	2750 1650 3800 1650
Wire Wire Line
	2750 2650 3800 2650
Text Label 1200 1250 0    50   ~ 0
GPIO2(SDA1)
Text Label 1200 1350 0    50   ~ 0
GPIO3(SCL1)
Text Label 1200 1450 0    50   ~ 0
GPIO4(GCLK)
Text Label 1200 1650 0    50   ~ 0
GPIO17(GEN0)
Text Label 1200 1750 0    50   ~ 0
GPIO27(GEN2)
Text Label 1200 1850 0    50   ~ 0
GPIO22(GEN3)
Text Label 1200 2050 0    50   ~ 0
GPIO10(SPI0_MOSI)
Text Label 1200 2150 0    50   ~ 0
GPIO9(SPI0_MISO)
Text Label 1200 2250 0    50   ~ 0
GPIO11(SPI0_SCK)
Text Label 1200 2550 0    50   ~ 0
GPIO5
Text Label 1200 2650 0    50   ~ 0
GPIO6
Text Label 1200 2750 0    50   ~ 0
GPIO13(PWM1)
Text Label 1200 2850 0    50   ~ 0
GPIO19(SPI1_MISO)
Text Label 1200 2950 0    50   ~ 0
GPIO26
Text Label 3700 2950 2    50   ~ 0
GPIO20(SPI1_MOSI)
Text Label 3700 2850 2    50   ~ 0
GPIO16
Text Label 3700 2650 2    50   ~ 0
GPIO12(PWM0)
Text Label 3700 2350 2    50   ~ 0
GPIO7(SPI1_CE_N)
Text Label 3700 2250 2    50   ~ 0
GPIO8(SPI0_CE_N)
Text Label 3700 2150 2    50   ~ 0
GPIO25(GEN6)
Text Label 3700 1950 2    50   ~ 0
GPIO24(GEN5)
Text Label 3700 1850 2    50   ~ 0
GPIO23(GEN4)
Text Label 3700 1650 2    50   ~ 0
GPIO18(GEN1)(PWM0)
Text Label 3700 1550 2    50   ~ 0
GPIO15(RXD0)
Text Label 3700 1450 2    50   ~ 0
GPIO14(TXD0)
Wire Wire Line
	2850 1350 2750 1350
Connection ~ 2850 1750
Wire Wire Line
	2750 3050 3800 3050
Text Label 3700 3050 2    50   ~ 0
GPIO21(SPI1_SCK)
Wire Wire Line
	2850 2750 2850 3200
Wire Wire Line
	2850 2550 2850 2750
Wire Wire Line
	2850 2050 2850 2550
Wire Wire Line
	2150 3050 2150 3200
Wire Wire Line
	2050 1150 2050 1950
Wire Wire Line
	2150 2350 2150 3050
Wire Wire Line
	2850 1750 2850 2050
NoConn ~ 2750 1150
NoConn ~ 2750 1250
NoConn ~ 3800 2350
NoConn ~ 3800 2850
NoConn ~ 3800 2950
NoConn ~ 3800 3050
NoConn ~ 1100 2850
NoConn ~ 1100 1450
$Comp
L zephyrus_iaq:GND #PWR010
U 1 1 5CD6B8BE
P 2150 3200
F 0 "#PWR010" H 2150 2950 50  0001 C CNN
F 1 "GND" H 2155 3027 50  0000 C CNN
F 2 "" H 2150 3200 50  0001 C CNN
F 3 "" H 2150 3200 50  0001 C CNN
	1    2150 3200
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:Conn_02x20_Odd_Even__Rpi J1
U 1 1 5CDDF295
P 2500 1050
F 0 "J1" H 2500 1150 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even__Rpi" H 2800 1100 50  0001 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 2500 1050 50  0001 C CNN
F 3 "" H 2500 1050 50  0001 C CNN
	1    2500 1050
	1    0    0    -1  
$EndComp
Text Label 4950 4450 0    50   ~ 0
ADC0
Text Label 4950 4600 0    50   ~ 0
ADC1
Text Label 4950 4750 0    50   ~ 0
ADC2
Text Label 4950 4900 0    50   ~ 0
ADC3
Text Label 4950 5050 0    50   ~ 0
ADC4
Text Label 4950 5200 0    50   ~ 0
ADC5
Text Label 1000 4450 0    50   ~ 0
SDA_3.3
Text Label 1100 1250 2    50   ~ 0
SDA_3.3
Text Label 1100 1350 2    50   ~ 0
SCL_3.3
Text Label 3800 2450 0    50   ~ 0
ID_SC_EEPROM
NoConn ~ 1100 2550
NoConn ~ 1100 2650
NoConn ~ 1100 2950
Text Label 1100 2450 2    50   ~ 0
ID_SD_EEPROM
Wire Wire Line
	2250 1550 2150 1550
Wire Wire Line
	2150 1550 2150 2350
Connection ~ 2150 2350
NoConn ~ 3800 2250
NoConn ~ 1100 2050
NoConn ~ 1100 2150
NoConn ~ 1100 2250
$Sheet
S 5450 3800 1450 1900
U 5D9BB3B6
F0 "Multiplexed ADC" 50
F1 "MultiplexedADC.sch" 50
F2 "ADC0" I L 5450 4450 50 
F3 "ADC1" I L 5450 4600 50 
F4 "ADC2" I L 5450 4750 50 
F5 "ADC3" I L 5450 4900 50 
F6 "ADC4" I L 5450 5050 50 
F7 "ADC5" I L 5450 5200 50 
F8 "MUL_A" I L 5450 3950 50 
F9 "MUL_B" I L 5450 4100 50 
F10 "MUL_C" I L 5450 4250 50 
F11 "SDA_5" I L 5450 5400 50 
F12 "SCL_5" I L 5450 5550 50 
$EndSheet
Text Label 4950 3950 0    50   ~ 0
MUL_A
Wire Wire Line
	5450 3950 4950 3950
Wire Wire Line
	4950 4100 5450 4100
Wire Wire Line
	4950 4250 5450 4250
Text Label 4950 5400 0    50   ~ 0
SDA_5
Text Label 4950 5550 0    50   ~ 0
SCL_5
Text Label 4950 4100 0    50   ~ 0
MUL_B
Text Label 4950 4250 0    50   ~ 0
MUL_C
Text Label 1100 1650 2    50   ~ 0
MUL_A
Text Label 1100 1750 2    50   ~ 0
MUL_B
Text Label 1100 1850 2    50   ~ 0
MUL_C
Text Label 7900 3350 2    50   ~ 0
FAN_nSLEEP
Text Label 3800 2150 0    50   ~ 0
FAN_nSLEEP
Text Label 1100 2750 2    50   ~ 0
FAN_PWM1
Text Label 3800 1650 0    50   ~ 0
GPS_PPS
$Sheet
S 8400 4950 1000 1050
U 5DB4C8BA
F0 "Power Management" 50
F1 "PowerManagement.sch" 50
$EndSheet
Text Label 1000 4600 0    50   ~ 0
SCL_3.3
NoConn ~ 3800 1850
Text Notes 8550 4800 0    79   ~ 16
Power Mgmt.
Text Notes 4600 4250 2    79   ~ 16
DAC/Buffer power control\n for Analog Sensors\nAnalog Sensor Ports: A0-A5\n\n
Text Notes 4100 5050 2    39   ~ 8
A0 - A5: Analog Channels\nBuffers (250 [mA] to A0 - A5)\nDAC     (0 - 5 [V] to Buffers)
$Sheet
S 8450 3000 1150 1350
U 5DB33F6F
F0 "Fan Control" 59
F1 "FanControl.sch" 59
F2 "FAN_PWM1" I L 8450 3150 59 
F3 "FAN_nSLEEP" I L 8450 3350 59 
$EndSheet
Wire Wire Line
	4450 4450 5450 4450
Wire Wire Line
	4450 4600 5450 4600
Wire Wire Line
	4450 4750 5450 4750
Wire Wire Line
	4450 4900 5450 4900
Wire Wire Line
	4450 5050 5450 5050
Wire Wire Line
	4450 5200 5450 5200
$Sheet
S 1400 4300 1000 1050
U 5DB861AF
F0 "I2C" 59
F1 "I2C.sch" 59
F2 "SDA_3.3" I L 1400 4450 59 
F3 "SCL_3.3" I L 1400 4600 59 
F4 "SDA_5" O R 2400 4450 59 
F5 "SCL_5" O R 2400 4600 59 
F6 "GPS_PPS" O L 1400 4800 59 
$EndSheet
Text Label 950  4800 0    50   ~ 0
GPS_PPS
NoConn ~ 3800 1950
Wire Wire Line
	1400 4800 950  4800
Text Notes 9350 3600 2    50   ~ 10
Unidirectional Fan\n
Text Notes 6600 4600 2    50   ~ 10
6:1\nMultiplexed\nADC\n (0 - 5 [V])
Text Notes 1700 5100 0    50   ~ 0
3.3V to 5V I2C\nI2C Connectors
Text Notes 6850 3650 2    79   ~ 16
Multiplexed 16-bit ADC
Text Notes 2450 4000 2    79   ~ 16
I2C Connectors\nand\nI2C Logic Level Conversion
Wire Wire Line
	7900 3150 8450 3150
Wire Wire Line
	8450 3350 7900 3350
Wire Wire Line
	4450 5400 5450 5400
Wire Wire Line
	4450 5550 5450 5550
Wire Wire Line
	1000 4450 1400 4450
Wire Wire Line
	1000 4600 1400 4600
$Sheet
S 3000 4300 1450 1400
U 5DA09389
F0 "Analog Port Control" 50
F1 "AnalogPortControl.sch" 50
F2 "ADC0" O R 4450 4450 50 
F3 "ADC1" O R 4450 4600 50 
F4 "ADC2" O R 4450 4750 50 
F5 "ADC3" O R 4450 4900 50 
F6 "ADC4" O R 4450 5050 50 
F7 "ADC5" O R 4450 5200 50 
F8 "SDA_5" I L 3000 4450 50 
F9 "SCL_5" I L 3000 4600 50 
F10 "SDA_5" I R 4450 5400 50 
F11 "SCL_5" I R 4450 5550 50 
$EndSheet
Wire Wire Line
	2400 4450 3000 4450
Wire Wire Line
	2400 4600 3000 4600
Text Notes 2950 6100 0    50   ~ 0
Software Driver:\nzephyrus-iaq/Software/HAT/IAQ_DAC43608.py\nzephyrus-iaq/Software/HAT/IAQ_AnalogPortController.py
Text Notes 5450 6150 0    50   ~ 0
Software Driver:\nzephyrus-iaq/Software/HAT/IAQ_Mux.py\nzephyrus-iaq/Software/third_party/Adafruit_I2C.py\nzephyrus-iaq/Software/third_party/Adafruit_ADS1x15.py
Text Notes 2000 750  0    79   ~ 16
Raspberry Pi Header
$Comp
L zephyrus_iaq:BSS138 U?
U 1 1 5DE9F97B
P 5150 2050
AR Path="/5DB861AF/5DE9F97B" Ref="U?"  Part="1" 
AR Path="/5DE9F97B" Ref="U3"  Part="1" 
F 0 "U3" V 5393 2050 50  0000 C CNN
F 1 "BSS138" V 5484 2050 50  0001 C CNN
F 2 "zephyrus-iaq:BSS138" H 5600 2750 50  0001 L BNN
F 3 "TO-236-3 Micross" H 5600 2550 50  0001 L BNN
F 4 "MICROSS/On Semiconductor" H 5600 2450 50  0001 L BNN "Field4"
F 5 "Mosfet n-Ch 50v 220ma Die" H 5600 2300 50  0001 L BNN "Field5"
F 6 "BSS138" H 5600 2650 50  0001 L BNN "Field7"
	1    5150 2050
	0    1    1    0   
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DE9F972
P 5450 1950
AR Path="/5DB861AF/5DE9F972" Ref="R?"  Part="1" 
AR Path="/5DE9F972" Ref="R9"  Part="1" 
F 0 "R9" H 5550 2000 50  0000 L CNN
F 1 "10k" H 5550 1900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5490 1940 50  0001 C CNN
F 3 "~" H 5450 1950 50  0001 C CNN
	1    5450 1950
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DE9F969
P 5050 1700
AR Path="/5DB861AF/5DE9F969" Ref="#PWR?"  Part="1" 
AR Path="/5DE9F969" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 5050 1550 50  0001 C CNN
F 1 "+3.3V" H 5050 1850 50  0000 C CNN
F 2 "" H 5050 1700 50  0001 C CNN
F 3 "" H 5050 1700 50  0001 C CNN
	1    5050 1700
	1    0    0    -1  
$EndComp
Text Label 6000 1450 0    50   ~ 0
TXD0
Text Label 6000 1550 0    50   ~ 0
RXD0
$Comp
L zephyrus_iaq:GND #PWR08
U 1 1 5D9839C0
P 6300 1900
F 0 "#PWR08" H 6300 1650 50  0001 C CNN
F 1 "GND" H 6300 1700 50  0000 C CNN
F 2 "" H 6300 1900 50  0001 C CNN
F 3 "" H 6300 1900 50  0001 C CNN
	1    6300 1900
	1    0    0    -1  
$EndComp
Text Notes 5050 1050 0    79   ~ 16
5V USART , 3.3V Pi Compatible
$Comp
L zephyrus_iaq:SM04B-SRSS-TB(LF)(SN)_USART J2
U 1 1 5D996B28
P 6750 1650
F 0 "J2" H 6900 2100 50  0000 L CNN
F 1 "USART" H 6750 2000 50  0000 L CNB
F 2 "zephyrus-iaq:JST_SM04B-SRSS-TB(LF)(SN)" H 6800 1750 50  0001 C CNN
F 3 "" H 6800 1750 50  0001 C CNN
	1    6750 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2150 5750 1550
Wire Wire Line
	5750 1550 6450 1550
Wire Wire Line
	6450 1650 6300 1650
Wire Wire Line
	6300 1650 6300 1900
Wire Wire Line
	5450 1750 6450 1750
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DE9F963
P 5450 1700
AR Path="/5DB861AF/5DE9F963" Ref="#PWR?"  Part="1" 
AR Path="/5DE9F963" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 5450 1550 50  0001 C CNN
F 1 "+5V" H 5450 1850 50  0000 C CNN
F 2 "" H 5450 1700 50  0001 C CNN
F 3 "" H 5450 1700 50  0001 C CNN
	1    5450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1700 5450 1750
Wire Wire Line
	2750 1450 6450 1450
Text Notes 9600 1300 2    79   ~ 16
Raspberry Pi HAT\nRequirements:\nEEPROM\n\n
Wire Wire Line
	7950 1800 8450 1800
Wire Wire Line
	7950 1600 8450 1600
Text Notes 9250 2100 2    59   ~ 12
Mnt. Holes
Text Notes 9150 2000 2    59   ~ 12
EEPROM
Text Label 7950 1600 2    50   ~ 0
ID_SC_EEPROM
Text Label 7950 1800 2    50   ~ 0
ID_SD_EEPROM
$Sheet
S 8450 1450 1200 750 
U 5DAFB35B
F0 "EEPROM" 59
F1 "EEPROM.sch" 59
F2 "ID_SC_EEPROM" I L 8450 1600 59 
F3 "ID_SD_EEPROM" I L 8450 1800 59 
$EndSheet
Text Notes 650  4150 0    50   ~ 0
SCL/SDA 5V is on the same I2C bus as 3.3V SCL/SDA
Text Notes 4600 2600 0    50   ~ 0
Step the TX line from target device \ndown for 3.3V RX on Raspbery line\nSimiliar BSS138 circuit as I2C logic level shifting.
Text Notes 3800 1300 0    50   ~ 0
Raspberry Pi 3.3V TX can register HIGH on 5V TTL compatible USART
$Comp
L cc-by-sa:LOGO #G?
U 1 1 5DD3D76A
P 5350 7600
AR Path="/5DB861AF/5DD3D76A" Ref="#G?"  Part="1" 
AR Path="/5DD3D76A" Ref="#G1"  Part="1" 
F 0 "#G1" H 5350 7337 60  0001 C CNN
F 1 "LOGO" H 5350 7863 60  0001 C CNN
F 2 "" H 5350 7600 50  0001 C CNN
F 3 "" H 5350 7600 50  0001 C CNN
	1    5350 7600
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DD3B4E5
P 4700 1950
AR Path="/5DB861AF/5DD3B4E5" Ref="R?"  Part="1" 
AR Path="/5DD3B4E5" Ref="R20"  Part="1" 
F 0 "R20" H 4800 2000 50  0000 L CNN
F 1 "10k" H 4800 1900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4740 1940 50  0001 C CNN
F 3 "~" H 4700 1950 50  0001 C CNN
	1    4700 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1550 4550 1550
Wire Wire Line
	4550 2150 4550 1550
Wire Wire Line
	5050 1700 5050 1750
Wire Wire Line
	4700 1750 5050 1750
Connection ~ 5050 1750
Wire Wire Line
	5050 1750 5050 1950
Wire Wire Line
	4550 2150 4700 2150
Wire Wire Line
	5350 2150 5450 2150
Wire Wire Line
	4700 2100 4700 2150
Connection ~ 4700 2150
Wire Wire Line
	4700 2150 4950 2150
Wire Wire Line
	4700 1800 4700 1750
Wire Wire Line
	5450 1800 5450 1750
Connection ~ 5450 1750
Wire Wire Line
	5450 2100 5450 2150
Connection ~ 5450 2150
Wire Wire Line
	5450 2150 5750 2150
Text Notes 9650 2850 2    79   ~ 16
 PWM controlled Fan\n
Text Label 7900 3150 2    50   ~ 0
FAN_PWM1
NoConn ~ 3800 2650
$EndSCHEMATC
