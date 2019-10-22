EESchema Schematic File Version 4
LIBS:rpi-hat-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4950 4300 0    50   ~ 0
ID_SD and ID_SC PINS:\nThese pins are reserved for HAT ID EEPROM.\n\nAt boot time this I2C interface will be\ninterrogated to look for an EEPROM\nthat identifes the attached board and\nallows automagic setup of the GPIOs\n(and optionally, Linux drivers).\n\nDO NOT USE these pins for anything other\nthan attaching an I2C ID EEPROM. Leave\nunconnected if ID EEPROM not required.
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B763
P 4050 3500
AR Path="/5DB0B763" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B763" Ref="R5"  Part="1" 
F 0 "R5" V 4150 3350 50  0000 L CNN
F 1 "3.9k" V 4150 3500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 3500 50  0001 C CNN
F 3 "~" H 4050 3500 50  0001 C CNN
	1    4050 3500
	0    1    -1   0   
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B769
P 4050 3750
AR Path="/5DB0B769" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B769" Ref="R6"  Part="1" 
F 0 "R6" V 4150 3600 50  0000 L CNN
F 1 "3.9k" V 4150 3750 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 3750 50  0001 C CNN
F 3 "~" H 4050 3750 50  0001 C CNN
	1    4050 3750
	0    1    -1   0   
$EndComp
Wire Wire Line
	4200 3500 4400 3500
Wire Wire Line
	4400 3500 4400 3750
Wire Wire Line
	4400 3750 4200 3750
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB0B772
P 4400 3500
AR Path="/5DB0B772" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B772" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 4400 3350 50  0001 C CNN
F 1 "+3.3V" H 4550 3600 50  0000 C CNN
F 2 "" H 4400 3500 50  0000 C CNN
F 3 "" H 4400 3500 50  0000 C CNN
	1    4400 3500
	1    0    0    -1  
$EndComp
Text Notes 3850 3350 0    50   ~ 10
Pullup Resistors
$Comp
L zephyrus_iaq:CAT24C32WI-GT3 U?
U 1 1 5DB0B779
P 5650 2300
AR Path="/5DB0B779" Ref="U?"  Part="1" 
AR Path="/5DAFB35B/5DB0B779" Ref="U1"  Part="1" 
F 0 "U1" H 5650 2970 50  0000 C CNN
F 1 "EEPROM" H 5650 2879 50  0000 C CNN
F 2 "zephyrus-iaq:SOIC127P600X175-8N" H 5650 2300 50  0001 L BNN
F 3 "" H 5650 2300 50  0001 L BNN
	1    5650 2300
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B77F
P 3900 2450
AR Path="/5DB0B77F" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B77F" Ref="R1"  Part="1" 
F 0 "R1" H 4000 2450 50  0000 L CNN
F 1 "1k" H 4000 2550 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 2450 50  0001 C CNN
F 3 "~" H 3900 2450 50  0001 C CNN
	1    3900 2450
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B785
P 4100 2800
AR Path="/5DB0B785" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B785" Ref="R2"  Part="1" 
F 0 "R2" V 4250 2650 50  0000 L CNN
F 1 "DNP" V 4150 2600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 2800 50  0001 C CNN
F 3 "~" H 4100 2800 50  0001 C CNN
	1    4100 2800
	0    -1   1    0   
$EndComp
Wire Wire Line
	4250 2800 4300 2800
Wire Wire Line
	4300 2800 4300 2700
Connection ~ 4300 2700
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB0B78E
P 4850 2400
AR Path="/5DB0B78E" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B78E" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 4850 2150 50  0001 C CNN
F 1 "GND" H 4750 2450 50  0000 C CNN
F 2 "" H 4850 2400 50  0001 C CNN
F 3 "" H 4850 2400 50  0001 C CNN
	1    4850 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2400 4850 2400
Wire Wire Line
	4950 2200 4850 2200
Wire Wire Line
	4950 2300 4850 2300
Connection ~ 4850 2300
Wire Wire Line
	4850 2300 4850 2200
Text Notes 5500 1550 0    50   ~ 10
EEPROM
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB0B79A
P 4800 1950
AR Path="/5DB0B79A" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B79A" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 4800 1800 50  0001 C CNN
F 1 "+3.3V" H 4815 2123 50  0000 C CNN
F 2 "" H 4800 1950 50  0001 C CNN
F 3 "" H 4800 1950 50  0001 C CNN
	1    4800 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2700 4950 2700
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB0B7A1
P 3900 2250
AR Path="/5DB0B7A1" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7A1" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 3900 2100 50  0001 C CNN
F 1 "+3.3V" H 3900 2400 50  0000 C CNN
F 2 "" H 3900 2250 50  0001 C CNN
F 3 "" H 3900 2250 50  0001 C CNN
	1    3900 2250
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB0B7A7
P 4800 2150
AR Path="/5DB0B7A7" Ref="C?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7A7" Ref="C2"  Part="1" 
F 0 "C2" H 4550 2150 50  0000 L CNN
F 1 "100nF" H 4500 2050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4838 2000 50  0001 C CNN
F 3 "~" H 4800 2150 50  0001 C CNN
	1    4800 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3500 3900 3500
$Comp
L zephyrus_iaq:Mounting-Hole-Mechanical MK?
U 1 1 5DB0B7B2
P 7750 4100
AR Path="/5DB0B7B2" Ref="MK?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7B2" Ref="MK4"  Part="1" 
F 0 "MK4" H 7850 4046 50  0000 L CNN
F 1 "M2.5" H 7850 3955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 7750 4100 50  0001 C CNN
F 3 "" H 7750 4100 50  0001 C CNN
	1    7750 4100
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:Mounting-Hole-Mechanical MK?
U 1 1 5DB0B7B8
P 7750 3850
AR Path="/5DB0B7B8" Ref="MK?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7B8" Ref="MK2"  Part="1" 
F 0 "MK2" H 7850 3796 50  0000 L CNN
F 1 "M2.5" H 7850 3705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 7750 3850 50  0001 C CNN
F 3 "" H 7750 3850 50  0001 C CNN
	1    7750 3850
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:Mounting-Hole-Mechanical MK?
U 1 1 5DB0B7BE
P 7300 4100
AR Path="/5DB0B7BE" Ref="MK?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7BE" Ref="MK3"  Part="1" 
F 0 "MK3" H 7400 4046 50  0000 L CNN
F 1 "M2.5" H 7400 3955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 7300 4100 50  0001 C CNN
F 3 "" H 7300 4100 50  0001 C CNN
	1    7300 4100
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:Mounting-Hole-Mechanical MK?
U 1 1 5DB0B7C4
P 7300 3850
AR Path="/5DB0B7C4" Ref="MK?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7C4" Ref="MK1"  Part="1" 
F 0 "MK1" H 7400 3796 50  0000 L CNN
F 1 "M2.5" H 7400 3705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 7300 3850 50  0001 C CNN
F 3 "" H 7300 3850 50  0001 C CNN
	1    7300 3850
	1    0    0    -1  
$EndComp
Text Notes 7300 3800 0    50   ~ 10
Mounting Holes
Wire Wire Line
	4800 2000 4950 2000
Wire Wire Line
	4850 2300 4850 2400
Wire Wire Line
	4800 2300 4850 2300
Wire Wire Line
	4800 1950 4800 2000
Wire Wire Line
	3900 2250 3900 2300
$Comp
L zephyrus_iaq:Conn_01x02_Male J?
U 1 1 5DB0B7D0
P 3650 2700
AR Path="/5DB0B7D0" Ref="J?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7D0" Ref="J3"  Part="1" 
F 0 "J3" H 3550 2700 50  0000 C CNN
F 1 "Jumper" H 3500 2600 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 3650 2700 50  0001 C CNN
F 3 "~" H 3650 2700 50  0001 C CNN
	1    3650 2700
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB0B7D6
P 3900 2850
AR Path="/5DB0B7D6" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7D6" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 3900 2600 50  0001 C CNN
F 1 "GND" H 3905 2677 50  0000 C CNN
F 2 "" H 3900 2850 50  0001 C CNN
F 3 "" H 3900 2850 50  0001 C CNN
	1    3900 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2800 3900 2800
Wire Wire Line
	3900 2850 3900 2800
Connection ~ 3900 2800
Wire Wire Line
	3900 2800 3950 2800
Wire Wire Line
	3850 2700 3900 2700
Wire Wire Line
	3800 3750 3900 3750
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB0B7E2
P 4950 2900
AR Path="/5DB0B7E2" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7E2" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 4950 2650 50  0001 C CNN
F 1 "GND" H 4955 2727 50  0000 C CNN
F 2 "" H 4950 2900 50  0001 C CNN
F 3 "" H 4950 2900 50  0001 C CNN
	1    4950 2900
	1    0    0    -1  
$EndComp
Connection ~ 4400 3500
Connection ~ 4800 2000
Connection ~ 4850 2400
Text HLabel 3750 3500 0    59   Input ~ 0
ID_SD_EEPROM
Text HLabel 3800 3750 0    59   Input ~ 0
ID_SC_EEPROM
Text HLabel 4950 2600 0    59   Input ~ 0
ID_SC_EEPROM
Wire Wire Line
	3900 2600 3900 2700
Connection ~ 3900 2700
Wire Wire Line
	3900 2700 4300 2700
Text HLabel 6350 2000 2    59   Input ~ 0
ID_SD_EEPROM
$EndSCHEMATC
