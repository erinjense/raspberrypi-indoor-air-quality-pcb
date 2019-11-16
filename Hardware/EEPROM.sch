EESchema Schematic File Version 4
LIBS:TopLevel-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
Title "Raspberry Pi HAT Specifications"
Date "2019-11-15"
Rev ""
Comp "Zephyrus, Indoor Air Quality - Raspberry Pi HAT"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5100 5300 0    50   ~ 0
ID_SD and ID_SC PINS:\nThese pins are reserved for HAT ID EEPROM.\n\nAt boot time this I2C interface will be\ninterrogated to look for an EEPROM\nthat identifes the attached board and\nallows automagic setup of the GPIOs\n(and optionally, Linux drivers).\n\nDO NOT USE these pins for anything other\nthan attaching an I2C ID EEPROM. Leave\nunconnected if ID EEPROM not required.
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B763
P 4300 4550
AR Path="/5DB0B763" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B763" Ref="R5"  Part="1" 
F 0 "R5" V 4400 4400 50  0000 L CNN
F 1 "3.9k" V 4400 4550 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4300 4550 50  0001 C CNN
F 3 "~" H 4300 4550 50  0001 C CNN
	1    4300 4550
	0    1    -1   0   
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B769
P 4300 4800
AR Path="/5DB0B769" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B769" Ref="R6"  Part="1" 
F 0 "R6" V 4400 4650 50  0000 L CNN
F 1 "3.9k" V 4400 4800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4300 4800 50  0001 C CNN
F 3 "~" H 4300 4800 50  0001 C CNN
	1    4300 4800
	0    1    -1   0   
$EndComp
Wire Wire Line
	4450 4550 4650 4550
Wire Wire Line
	4650 4550 4650 4800
Wire Wire Line
	4650 4800 4450 4800
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB0B772
P 4650 4550
AR Path="/5DB0B772" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B772" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 4650 4400 50  0001 C CNN
F 1 "+3.3V" H 4800 4650 50  0000 C CNN
F 2 "" H 4650 4550 50  0000 C CNN
F 3 "" H 4650 4550 50  0000 C CNN
	1    4650 4550
	1    0    0    -1  
$EndComp
Text Notes 4100 4400 0    50   ~ 10
Pullup Resistors
$Comp
L zephyrus_iaq:CAT24C32WI-GT3 U?
U 1 1 5DB0B779
P 5650 3350
AR Path="/5DB0B779" Ref="U?"  Part="1" 
AR Path="/5DAFB35B/5DB0B779" Ref="U1"  Part="1" 
F 0 "U1" H 5650 4020 50  0000 C CNN
F 1 "EEPROM" H 5650 3929 50  0000 C CNN
F 2 "zephyrus-iaq:SOIC127P600X175-8N" H 5650 3350 50  0001 L BNN
F 3 "" H 5650 3350 50  0001 L BNN
	1    5650 3350
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B77F
P 3900 3500
AR Path="/5DB0B77F" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B77F" Ref="R1"  Part="1" 
F 0 "R1" H 4000 3500 50  0000 L CNN
F 1 "1k" H 4000 3600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 3500 50  0001 C CNN
F 3 "~" H 3900 3500 50  0001 C CNN
	1    3900 3500
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B785
P 4100 3850
AR Path="/5DB0B785" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B785" Ref="R2"  Part="1" 
F 0 "R2" V 4300 3700 50  0000 L CNN
F 1 "DNP" V 4200 3650 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 3850 50  0001 C CNN
F 3 "~" H 4100 3850 50  0001 C CNN
	1    4100 3850
	0    -1   1    0   
$EndComp
Wire Wire Line
	4250 3850 4300 3850
Wire Wire Line
	4300 3850 4300 3750
Connection ~ 4300 3750
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB0B78E
P 4850 3450
AR Path="/5DB0B78E" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B78E" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 4850 3200 50  0001 C CNN
F 1 "GND" H 4750 3500 50  0000 C CNN
F 2 "" H 4850 3450 50  0001 C CNN
F 3 "" H 4850 3450 50  0001 C CNN
	1    4850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3450 4850 3450
Wire Wire Line
	4950 3250 4850 3250
Wire Wire Line
	4950 3350 4850 3350
Connection ~ 4850 3350
Wire Wire Line
	4850 3350 4850 3250
Text Notes 5500 2600 0    50   ~ 10
EEPROM
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB0B79A
P 4800 3000
AR Path="/5DB0B79A" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B79A" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 4800 2850 50  0001 C CNN
F 1 "+3.3V" H 4815 3173 50  0000 C CNN
F 2 "" H 4800 3000 50  0001 C CNN
F 3 "" H 4800 3000 50  0001 C CNN
	1    4800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3750 4950 3750
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB0B7A1
P 3900 3300
AR Path="/5DB0B7A1" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7A1" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 3900 3150 50  0001 C CNN
F 1 "+3.3V" H 3900 3450 50  0000 C CNN
F 2 "" H 3900 3300 50  0001 C CNN
F 3 "" H 3900 3300 50  0001 C CNN
	1    3900 3300
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB0B7A7
P 4800 3200
AR Path="/5DB0B7A7" Ref="C?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7A7" Ref="C2"  Part="1" 
F 0 "C2" H 4550 3200 50  0000 L CNN
F 1 "100nF" H 4500 3100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4838 3050 50  0001 C CNN
F 3 "~" H 4800 3200 50  0001 C CNN
	1    4800 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4550 4150 4550
Wire Wire Line
	4800 3050 4950 3050
Wire Wire Line
	4850 3350 4850 3450
Wire Wire Line
	4800 3350 4850 3350
Wire Wire Line
	4800 3000 4800 3050
Wire Wire Line
	3900 3300 3900 3350
$Comp
L zephyrus_iaq:Conn_01x02_Male J?
U 1 1 5DB0B7D0
P 3650 3750
AR Path="/5DB0B7D0" Ref="J?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7D0" Ref="J3"  Part="1" 
F 0 "J3" H 3550 3750 50  0000 C CNN
F 1 "Jumper" H 3500 3650 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 3650 3750 50  0001 C CNN
F 3 "~" H 3650 3750 50  0001 C CNN
	1    3650 3750
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB0B7D6
P 3900 3900
AR Path="/5DB0B7D6" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7D6" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 3900 3650 50  0001 C CNN
F 1 "GND" H 3905 3727 50  0000 C CNN
F 2 "" H 3900 3900 50  0001 C CNN
F 3 "" H 3900 3900 50  0001 C CNN
	1    3900 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3850 3900 3850
Wire Wire Line
	3900 3900 3900 3850
Connection ~ 3900 3850
Wire Wire Line
	3900 3850 3950 3850
Wire Wire Line
	3850 3750 3900 3750
Wire Wire Line
	4050 4800 4150 4800
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB0B7E2
P 4950 3950
AR Path="/5DB0B7E2" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7E2" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 4950 3700 50  0001 C CNN
F 1 "GND" H 4955 3777 50  0000 C CNN
F 2 "" H 4950 3950 50  0001 C CNN
F 3 "" H 4950 3950 50  0001 C CNN
	1    4950 3950
	1    0    0    -1  
$EndComp
Connection ~ 4650 4550
Connection ~ 4800 3050
Connection ~ 4850 3450
Text HLabel 4000 4550 0    59   Input ~ 0
ID_SD_EEPROM
Text HLabel 4050 4800 0    59   Input ~ 0
ID_SC_EEPROM
Text HLabel 4950 3650 0    59   Input ~ 0
ID_SC_EEPROM
Wire Wire Line
	3900 3650 3900 3750
Connection ~ 3900 3750
Wire Wire Line
	3900 3750 4300 3750
Text HLabel 6350 3050 2    59   Input ~ 0
ID_SD_EEPROM
$EndSCHEMATC
