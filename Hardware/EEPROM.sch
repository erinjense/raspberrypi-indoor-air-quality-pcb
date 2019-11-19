EESchema Schematic File Version 4
LIBS:Zephyrus-IAQ-HAT-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 7 7
Title "Raspberry Pi HAT Specifications"
Date "2019-11-15"
Rev "A"
Comp "Zephyrus, Indoor Air Quality - Raspberry Pi HAT"
Comment1 "Designed By Aaron Jense"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5450 5150 0    50   ~ 0
At boot time this I2C interface will be\ninterrogated to look for an EEPROM\nthat identifes the attached board and\nallows automagic setup of the GPIOs\n(and optionally, Linux drivers).
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B763
P 7000 3150
AR Path="/5DB0B763" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B763" Ref="R5"  Part="1" 
F 0 "R5" H 6750 3200 50  0000 L CNN
F 1 "3.9k" H 6750 3100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7000 3150 50  0001 C CNN
F 3 "~" H 7000 3150 50  0001 C CNN
	1    7000 3150
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B769
P 4800 3700
AR Path="/5DB0B769" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B769" Ref="R6"  Part="1" 
F 0 "R6" H 4900 3800 50  0000 L CNN
F 1 "3.9k" H 4900 3700 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4800 3700 50  0001 C CNN
F 3 "~" H 4800 3700 50  0001 C CNN
	1    4800 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4800 3350 4800 3450
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB0B772
P 4800 3350
AR Path="/5DB0B772" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B772" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 4800 3200 50  0001 C CNN
F 1 "+3.3V" H 4800 3500 50  0000 C CNN
F 2 "" H 4800 3350 50  0000 C CNN
F 3 "" H 4800 3350 50  0000 C CNN
	1    4800 3350
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:CAT24C32WI-GT3 U?
U 1 1 5DB0B779
P 6100 3750
AR Path="/5DB0B779" Ref="U?"  Part="1" 
AR Path="/5DAFB35B/5DB0B779" Ref="U1"  Part="1" 
F 0 "U1" H 6100 4420 50  0000 C CNN
F 1 "EEPROM" H 6100 4329 50  0000 C CNN
F 2 "zephyrus-iaq:SOIC127P600X175-8N" H 6100 3750 50  0001 L BNN
F 3 "" H 6100 3750 50  0001 L BNN
	1    6100 3750
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B77F
P 3900 3700
AR Path="/5DB0B77F" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B77F" Ref="R1"  Part="1" 
F 0 "R1" H 4000 3800 50  0000 L CNN
F 1 "1k" H 4000 3700 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 3700 50  0001 C CNN
F 3 "~" H 3900 3700 50  0001 C CNN
	1    3900 3700
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB0B785
P 4100 4250
AR Path="/5DB0B785" Ref="R?"  Part="1" 
AR Path="/5DAFB35B/5DB0B785" Ref="R2"  Part="1" 
F 0 "R2" V 4300 4100 50  0000 L CNN
F 1 "DNP" V 4200 4050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 4250 50  0001 C CNN
F 3 "~" H 4100 4250 50  0001 C CNN
	1    4100 4250
	0    -1   1    0   
$EndComp
Wire Wire Line
	4750 4250 4750 4150
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB0B78E
P 5300 3850
AR Path="/5DB0B78E" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B78E" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 5300 3600 50  0001 C CNN
F 1 "GND" H 5300 3700 50  0000 C CNN
F 2 "" H 5300 3850 50  0001 C CNN
F 3 "" H 5300 3850 50  0001 C CNN
	1    5300 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3850 5300 3850
Wire Wire Line
	5400 3650 5300 3650
Wire Wire Line
	5400 3750 5300 3750
Connection ~ 5300 3750
Wire Wire Line
	5300 3750 5300 3650
Text Notes 5950 3000 0    50   ~ 10
EEPROM
Wire Wire Line
	4750 4150 5400 4150
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB0B7A7
P 5200 3600
AR Path="/5DB0B7A7" Ref="C?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7A7" Ref="C2"  Part="1" 
F 0 "C2" H 4950 3600 50  0000 L CNN
F 1 "100nF" H 4900 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5238 3450 50  0001 C CNN
F 3 "~" H 5200 3600 50  0001 C CNN
	1    5200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3450 7000 3300
Wire Wire Line
	5300 3750 5300 3850
$Comp
L zephyrus_iaq:Conn_01x02_Male J?
U 1 1 5DB0B7D0
P 3650 4150
AR Path="/5DB0B7D0" Ref="J?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7D0" Ref="J3"  Part="1" 
F 0 "J3" H 3550 4150 50  0000 C CNN
F 1 "Jumper" H 3500 4050 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 3650 4150 50  0001 C CNN
F 3 "~" H 3650 4150 50  0001 C CNN
	1    3650 4150
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB0B7D6
P 3900 4300
AR Path="/5DB0B7D6" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7D6" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 3900 4050 50  0001 C CNN
F 1 "GND" H 3905 4127 50  0000 C CNN
F 2 "" H 3900 4300 50  0001 C CNN
F 3 "" H 3900 4300 50  0001 C CNN
	1    3900 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4250 3900 4250
Wire Wire Line
	3900 4300 3900 4250
Connection ~ 3900 4250
Wire Wire Line
	3900 4250 3950 4250
Wire Wire Line
	3850 4150 3900 4150
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB0B7E2
P 5400 4350
AR Path="/5DB0B7E2" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DB0B7E2" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 5400 4100 50  0001 C CNN
F 1 "GND" H 5405 4177 50  0000 C CNN
F 2 "" H 5400 4350 50  0001 C CNN
F 3 "" H 5400 4350 50  0001 C CNN
	1    5400 4350
	1    0    0    -1  
$EndComp
Connection ~ 5300 3850
Text HLabel 7150 3450 2    59   Input ~ 0
ID_SD_EEPROM
Text HLabel 4650 4050 0    59   Input ~ 0
ID_SC_EEPROM
Connection ~ 3900 4150
Wire Wire Line
	6800 3450 7000 3450
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DFEA0CF
P 7000 2850
AR Path="/5DFEA0CF" Ref="#PWR?"  Part="1" 
AR Path="/5DAFB35B/5DFEA0CF" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 7000 2700 50  0001 C CNN
F 1 "+3.3V" H 7000 3000 50  0000 C CNN
F 2 "" H 7000 2850 50  0000 C CNN
F 3 "" H 7000 2850 50  0000 C CNN
	1    7000 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2850 7000 3000
Wire Wire Line
	4800 4050 5400 4050
Wire Wire Line
	4800 3850 4800 4050
Wire Wire Line
	4250 4250 4750 4250
Wire Wire Line
	3900 4150 4750 4150
Connection ~ 4750 4150
Connection ~ 4800 3450
Wire Wire Line
	4800 3450 4800 3550
Connection ~ 5200 3450
Wire Wire Line
	5200 3450 4800 3450
Wire Wire Line
	5200 3450 5400 3450
Wire Wire Line
	5200 3750 5300 3750
Wire Wire Line
	3900 3550 3900 3450
Wire Wire Line
	3900 3450 4800 3450
Wire Wire Line
	3900 3850 3900 4150
Wire Wire Line
	4800 4050 4650 4050
Connection ~ 4800 4050
Wire Wire Line
	7000 3450 7150 3450
Connection ~ 7000 3450
$Comp
L cc-by-sa:LOGO #G?
U 1 1 5DD4FDD6
P 5350 7550
AR Path="/5DB861AF/5DD4FDD6" Ref="#G?"  Part="1" 
AR Path="/5DAFB35B/5DD4FDD6" Ref="#G7"  Part="1" 
F 0 "#G7" H 5350 7287 60  0001 C CNN
F 1 "LOGO" H 5350 7813 60  0001 C CNN
F 2 "" H 5350 7550 50  0001 C CNN
F 3 "" H 5350 7550 50  0001 C CNN
	1    5350 7550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
