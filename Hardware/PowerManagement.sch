EESchema Schematic File Version 4
LIBS:Zephyrus-IAQ-HAT-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 3 7
Title "Power Management"
Date "2019-11-15"
Rev "A"
Comp "Zephyrus, Indoor Air Quality - Raspberry Pi HAT"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L zephyrus_iaq:10103594-0001LF J7
U 1 1 5DB5FC63
P 8850 4050
F 0 "J7" H 8950 4500 50  0000 C CNN
F 1 "10103594-0001LF" H 8850 4526 50  0001 C CNN
F 2 "zephyrus-iaq:FCI_10103594-0001LF" H 8850 4050 50  0001 L BNN
F 3 "" H 8850 4050 50  0001 L BNN
	1    8850 4050
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:Polyfuse F1
U 1 1 5DB5FC69
P 8200 3750
F 0 "F1" H 8150 3650 50  0000 L CNN
F 1 "MF-MSMF250/X" H 7900 3650 50  0001 L CNN
F 2 "Fuse:Fuse_1812_4532Metric" H 8250 3550 50  0001 L CNN
F 3 "~" H 8200 3750 50  0001 C CNN
	1    8200 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 3750 8350 3750
NoConn ~ 8450 3850
NoConn ~ 8450 3950
NoConn ~ 8450 4050
Wire Wire Line
	8400 4150 8450 4150
Text Notes 8600 3500 0    50   ~ 10
5V Power:  Micro USB Input
NoConn ~ 9250 3850
NoConn ~ 9250 3750
$Comp
L zephyrus_iaq:SMBJ5.0A D10
U 1 1 5DB5FC83
P 7850 4050
F 0 "D10" V 7900 3900 50  0000 R CNN
F 1 "SMBJ5.0A" V 7855 3921 50  0001 R CNN
F 2 "zephyrus-iaq:SMBJ5.0A" V 7700 3900 50  0001 L BNN
F 3 "" V 7700 3900 50  0001 L BNN
	1    7850 4050
	0    -1   -1   0   
$EndComp
NoConn ~ 9250 3950
NoConn ~ 9250 4050
NoConn ~ 9250 4150
NoConn ~ 9250 4250
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB686FF
P 6750 4050
AR Path="/5DB686FF" Ref="C?"  Part="1" 
AR Path="/5DB4C8BA/5DB686FF" Ref="C1"  Part="1" 
F 0 "C1" H 6500 4050 50  0000 L CNN
F 1 "47uF" H 6450 3950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6788 3900 50  0001 C CNN
F 3 "~" H 6750 4050 50  0001 C CNN
	1    6750 4050
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB68706
P 6750 4600
AR Path="/5DB68706" Ref="#PWR?"  Part="1" 
AR Path="/5DB4C8BA/5DB68706" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 6750 4350 50  0001 C CNN
F 1 "GND" H 6755 4427 50  0000 C CNN
F 2 "" H 6750 4600 50  0001 C CNN
F 3 "" H 6750 4600 50  0001 C CNN
	1    6750 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3750 7300 3750
Wire Wire Line
	6750 3750 6750 3900
Wire Wire Line
	5450 4000 6050 4000
Wire Wire Line
	5450 3750 6050 3750
$Comp
L zephyrus_iaq:ISL80102 U?
U 1 1 5DB747BE
P 5000 3550
AR Path="/5DB747BE" Ref="U?"  Part="1" 
AR Path="/5DB4C8BA/5DB747BE" Ref="U10"  Part="1" 
F 0 "U10" H 5000 3615 50  0000 C CNN
F 1 "5V" H 5000 3524 50  0000 C CNB
F 2 "zephyrus-iaq:REG_EY1501DI-ADJ" H 5000 3550 50  0001 C CNN
F 3 "" H 5000 3550 50  0001 C CNN
	1    5000 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4000 6050 3750
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB81F40
P 7300 4350
AR Path="/5DA09389/5DB81F40" Ref="R?"  Part="1" 
AR Path="/5DB81F40" Ref="R?"  Part="1" 
AR Path="/5DB4C8BA/5DB81F40" Ref="R3"  Part="1" 
F 0 "R3" H 7368 4396 50  0000 L CNN
F 1 "330" H 7368 4305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7340 4340 50  0001 C CNN
F 3 "~" H 7300 4350 50  0001 C CNN
	1    7300 4350
	1    0    0    -1  
$EndComp
Text Notes 4350 3400 0    50   ~ 10
5V Regulator (0.125V drop @ 2A)
Wire Wire Line
	7300 4500 7300 4550
Text Label 3800 4250 0    50   ~ 0
VREG_SENSE
Wire Wire Line
	3800 4250 4550 4250
$Comp
L zephyrus_iaq:R_US R23
U 1 1 5DBB231C
P 3600 4250
F 0 "R23" H 3350 4300 50  0000 L CNN
F 1 "100k" H 3350 4200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3640 4240 50  0001 C CNN
F 3 "" H 3600 4250 50  0001 C CNN
	1    3600 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4400 3600 4500
Wire Wire Line
	3600 4500 4550 4500
Wire Wire Line
	3600 4100 3600 4000
Wire Wire Line
	3600 4500 3600 4750
Wire Wire Line
	3600 4750 4400 4750
Connection ~ 3600 4500
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DBB603E
P 3600 4850
AR Path="/5DBB603E" Ref="#PWR?"  Part="1" 
AR Path="/5DB4C8BA/5DBB603E" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 3600 4600 50  0001 C CNN
F 1 "GND" H 3605 4677 50  0000 C CNN
F 2 "" H 3600 4850 50  0001 C CNN
F 3 "" H 3600 4850 50  0001 C CNN
	1    3600 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4750 3600 4850
Connection ~ 3600 4750
NoConn ~ 5450 4750
Connection ~ 7300 3750
Wire Wire Line
	8400 4550 8400 4150
Wire Wire Line
	6750 4550 7300 4550
Wire Wire Line
	6750 4200 6750 4550
Connection ~ 7300 4550
Wire Wire Line
	6750 4550 6750 4600
Connection ~ 6750 4550
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB6870F
P 2150 4050
AR Path="/5DB6870F" Ref="C?"  Part="1" 
AR Path="/5DB4C8BA/5DB6870F" Ref="C13"  Part="1" 
F 0 "C13" H 1850 4050 50  0000 L CNN
F 1 "47uF" H 1850 3950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2188 3900 50  0001 C CNN
F 3 "~" H 2150 4050 50  0001 C CNN
	1    2150 4050
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DB68715
P 2150 3600
AR Path="/5DB68715" Ref="#PWR?"  Part="1" 
AR Path="/5DB4C8BA/5DB68715" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 2150 3450 50  0001 C CNN
F 1 "+5V" H 2150 3740 50  0000 C CNN
F 2 "" H 2150 3600 50  0000 C CNN
F 3 "" H 2150 3600 50  0000 C CNN
	1    2150 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 4200 2150 4350
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB6871D
P 2150 4350
AR Path="/5DB6871D" Ref="#PWR?"  Part="1" 
AR Path="/5DB4C8BA/5DB6871D" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 2150 4100 50  0001 C CNN
F 1 "GND" H 2155 4177 50  0000 C CNN
F 2 "" H 2150 4350 50  0001 C CNN
F 3 "" H 2150 4350 50  0001 C CNN
	1    2150 4350
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:R_US R4
U 1 1 5DB95547
P 2650 4000
F 0 "R4" H 2718 4046 50  0000 L CNN
F 1 "2.61k" H 2718 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2690 3990 50  0001 C CNN
F 3 "" H 2650 4000 50  0001 C CNN
	1    2650 4000
	1    0    0    -1  
$EndComp
Text Label 3150 4350 2    50   ~ 0
VREG_SENSE
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB97E83
P 2650 4950
AR Path="/5DB97E83" Ref="#PWR?"  Part="1" 
AR Path="/5DB4C8BA/5DB97E83" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 2650 4700 50  0001 C CNN
F 1 "GND" H 2655 4777 50  0000 C CNN
F 2 "" H 2650 4950 50  0001 C CNN
F 3 "" H 2650 4950 50  0001 C CNN
	1    2650 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3850 2650 3750
$Comp
L zephyrus_iaq:R_US R24
U 1 1 5DBA047F
P 2650 4650
F 0 "R24" H 2718 4696 50  0000 L CNN
F 1 "287" H 2718 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2690 4640 50  0001 C CNN
F 3 "" H 2650 4650 50  0001 C CNN
	1    2650 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4800 2650 4950
Wire Wire Line
	2650 4150 2650 4350
Wire Wire Line
	2650 4350 3150 4350
Connection ~ 2650 4350
Wire Wire Line
	2650 4350 2650 4500
Wire Wire Line
	2650 3750 3600 3750
Wire Wire Line
	3600 4000 3600 3750
Connection ~ 3600 4000
Connection ~ 3600 3750
Wire Wire Line
	3600 4000 4550 4000
Wire Wire Line
	3600 3750 4550 3750
Wire Wire Line
	7300 4550 7900 4550
Connection ~ 7900 4550
Wire Wire Line
	7900 4550 8400 4550
$Comp
L zephyrus_iaq:LED D?
U 1 1 5DB81F39
P 7300 4000
AR Path="/5DA09389/5DB81F39" Ref="D?"  Part="1" 
AR Path="/5DB81F39" Ref="D?"  Part="1" 
AR Path="/5DB4C8BA/5DB81F39" Ref="D1"  Part="1" 
F 0 "D1" V 7300 4100 50  0000 C CNN
F 1 "PWR" V 7200 4100 50  0001 C CNN
F 2 "Diode_SMD:D_0805_2012Metric" H 7300 4000 50  0001 C CNN
F 3 "~" H 7300 4000 50  0001 C CNN
	1    7300 4000
	0    -1   -1   0   
$EndComp
Connection ~ 4400 4750
Wire Wire Line
	4400 4750 4550 4750
Wire Wire Line
	4400 5050 5000 5050
Wire Wire Line
	5000 5050 5000 4950
Wire Wire Line
	4400 4750 4400 5050
Connection ~ 6050 3750
Wire Wire Line
	5450 4500 6050 4500
Text Notes 7500 3700 0    39   ~ 0
Polyfuse\n2.5A hold ; 5A trip
Wire Wire Line
	6050 3750 6750 3750
Connection ~ 6750 3750
Wire Wire Line
	6050 4000 6050 4500
Connection ~ 6050 4000
Text Notes 7900 4300 0    39   ~ 0
TVS\n5V Reverse\n9.2V Clamp Max
Wire Wire Line
	2150 3600 2150 3750
Wire Wire Line
	2650 3750 2150 3750
Connection ~ 2650 3750
Connection ~ 2150 3750
Wire Wire Line
	2150 3750 2150 3900
Wire Wire Line
	7300 4150 7300 4200
Wire Wire Line
	7300 3750 7300 3850
Wire Wire Line
	7300 3750 7900 3750
Wire Wire Line
	7900 3750 7900 3850
Connection ~ 7900 3750
Wire Wire Line
	7900 3750 8050 3750
Wire Wire Line
	7900 4150 7900 4550
$Comp
L cc-by-sa:LOGO #G?
U 1 1 5DD4D88D
P 5350 7550
AR Path="/5DB861AF/5DD4D88D" Ref="#G?"  Part="1" 
AR Path="/5DB4C8BA/5DD4D88D" Ref="#G3"  Part="1" 
F 0 "#G3" H 5350 7287 60  0001 C CNN
F 1 "LOGO" H 5350 7813 60  0001 C CNN
F 2 "" H 5350 7550 50  0001 C CNN
F 3 "" H 5350 7550 50  0001 C CNN
	1    5350 7550
	1    0    0    -1  
$EndComp
Text Notes 5700 5900 0    50   ~ 0
The micro-USB power input was inspired by reading\nthe documents on the Raspberry Pi 3 B+ at the\nfollowing link (Upper Left Hand Corner of Schematic):\nhttps://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf\n\nLicense:\nhttps://www.raspberrypi.org/creative-commons/\n\nNo changes except for the voltage regulator \nthat the micro-USB input feeds into.
$EndSCHEMATC
