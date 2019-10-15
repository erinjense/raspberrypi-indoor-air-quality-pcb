EESchema Schematic File Version 4
LIBS:rpi-hat-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4000 2350 0    50   ~ 10
SparkFun GPS Breakout - XA1110 (Qwiic) 
$Comp
L zephyrus_iaq:SM04B-SRSS-TB(LF)(SN) J?
U 1 1 5DB91D7C
P 5050 2900
AR Path="/5DB91D7C" Ref="J?"  Part="1" 
AR Path="/5DB861AF/5DB91D7C" Ref="J6"  Part="1" 
F 0 "J6" H 5200 3350 50  0000 L CNN
F 1 "I2C 3.3V" H 4900 3250 50  0000 L CNB
F 2 "zephyrus-iaq:JST_SM04B-SRSS-TB(LF)(SN)" H 5050 2900 50  0001 L BNN
F 3 "" H 5050 2900 50  0001 L BNN
	1    5050 2900
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:SM04B-SRSS-TB(LF)(SN) J?
U 1 1 5DB91D82
P 6650 2900
AR Path="/5DB91D82" Ref="J?"  Part="1" 
AR Path="/5DB861AF/5DB91D82" Ref="J8"  Part="1" 
F 0 "J8" H 6750 3350 50  0000 L CNN
F 1 "I2C 3.3V" H 6500 3250 45  0000 L CNB
F 2 "zephyrus-iaq:JST_SM04B-SRSS-TB(LF)(SN)" H 6650 2900 50  0001 L BNN
F 3 "" H 6650 2900 50  0001 L BNN
	1    6650 2900
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB91D88
P 5850 2800
AR Path="/5DB91D88" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91D88" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 5850 2650 50  0001 C CNN
F 1 "+3.3V" V 5850 3000 50  0000 C CNN
F 2 "" H 5850 2800 50  0001 C CNN
F 3 "" H 5850 2800 50  0001 C CNN
	1    5850 2800
	0    -1   1    0   
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB91D8E
P 5850 2700
AR Path="/5DB91D8E" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91D8E" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 5850 2450 50  0001 C CNN
F 1 "GND" V 5850 2500 50  0000 C CNN
F 2 "" H 5850 2700 50  0001 C CNN
F 3 "" H 5850 2700 50  0001 C CNN
	1    5850 2700
	0    1    -1   0   
$EndComp
$Comp
L zephyrus_iaq:SM04B-SRSS-TB(LF)(SN) J?
U 1 1 5DB91D94
P 8450 2900
AR Path="/5DB91D94" Ref="J?"  Part="1" 
AR Path="/5DB861AF/5DB91D94" Ref="J16"  Part="1" 
F 0 "J16" H 8450 3350 50  0000 L CNN
F 1 "I2C 5V" H 8350 3250 50  0000 L CNN
F 2 "zephyrus-iaq:JST_SM04B-SRSS-TB(LF)(SN)" H 8450 2900 50  0001 L BNN
F 3 "" H 8450 2900 50  0001 L BNN
	1    8450 2900
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB91D9A
P 7650 2700
AR Path="/5DB91D9A" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91D9A" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 7650 2450 50  0001 C CNN
F 1 "GND" V 7650 2500 50  0000 C CNN
F 2 "" H 7650 2700 50  0001 C CNN
F 3 "" H 7650 2700 50  0001 C CNN
	1    7650 2700
	0    1    -1   0   
$EndComp
Text Notes 6500 2350 0    50   ~ 10
3.3V I2C
Text Notes 8300 2350 0    50   ~ 10
5V I2C
$Comp
L zephyrus_iaq:Conn_01x01_Female J?
U 1 1 5DB91DA2
P 3400 3000
AR Path="/5DB91DA2" Ref="J?"  Part="1" 
AR Path="/5DB861AF/5DB91DA2" Ref="J17"  Part="1" 
F 0 "J17" H 3000 3250 50  0000 L CNN
F 1 "PPS" H 2950 3150 50  0000 L CNB
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 3400 3000 50  0001 C CNN
F 3 "~" H 3400 3000 50  0001 C CNN
	1    3400 3000
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DB91DA9
P 7650 2800
AR Path="/5DB91DA9" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91DA9" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 7650 2650 50  0001 C CNN
F 1 "+5V" V 7665 2928 50  0000 L CNN
F 2 "" H 7650 2800 50  0001 C CNN
F 3 "" H 7650 2800 50  0001 C CNN
	1    7650 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 2700 8150 2700
Wire Wire Line
	7650 2800 8150 2800
Wire Wire Line
	6350 2900 5850 2900
Wire Wire Line
	6350 3000 5850 3000
Wire Wire Line
	5850 2800 6350 2800
Wire Wire Line
	5850 2700 6350 2700
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB91DB9
P 4250 2800
AR Path="/5DB91DB9" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91DB9" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 4250 2650 50  0001 C CNN
F 1 "+3.3V" V 4250 3000 50  0000 C CNN
F 2 "" H 4250 2800 50  0001 C CNN
F 3 "" H 4250 2800 50  0001 C CNN
	1    4250 2800
	0    -1   1    0   
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB91DBF
P 4250 2700
AR Path="/5DB91DBF" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91DBF" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 4250 2450 50  0001 C CNN
F 1 "GND" V 4250 2500 50  0000 C CNN
F 2 "" H 4250 2700 50  0001 C CNN
F 3 "" H 4250 2700 50  0001 C CNN
	1    4250 2700
	0    1    -1   0   
$EndComp
Wire Wire Line
	4250 2800 4750 2800
Wire Wire Line
	4750 2700 4250 2700
Text HLabel 5850 2900 0    50   Input ~ 10
SDA_3.3
Text HLabel 5850 3000 0    50   Input ~ 10
SCL_3.3
Wire Wire Line
	8150 2900 7650 2900
Wire Wire Line
	8150 3000 7650 3000
Text HLabel 7650 2900 0    50   Input ~ 10
SDA_5
Text HLabel 7650 3000 0    50   Input ~ 10
SCL_5
Wire Wire Line
	4750 2900 4250 2900
Wire Wire Line
	4750 3000 4250 3000
Text HLabel 4250 2900 0    50   Input ~ 10
SDA_3.3
Text HLabel 4250 3000 0    50   Input ~ 10
SCL_3.3
Text Notes 2600 3250 0    50   ~ 0
Pulse Per Second\nBreakout for Sparkfun GPS
Text HLabel 3200 3000 0    50   Input ~ 10
GPS_PPS
Text Notes 5600 4050 0    50   ~ 10
3.3V/5V I2C Compatibility
Text HLabel 7100 4900 2    50   Input ~ 0
SCL_5
Text HLabel 6500 4900 0    50   Input ~ 0
SCL_3.3
Wire Wire Line
	7100 4400 7100 4500
$Comp
L zephyrus_iaq:+5V #PWR0129
U 1 1 5DC58BDA
P 7100 4400
F 0 "#PWR0129" H 7100 4250 50  0001 C CNN
F 1 "+5V" H 7115 4573 50  0000 C CNN
F 2 "" H 7100 4400 50  0001 C CNN
F 3 "" H 7100 4400 50  0001 C CNN
	1    7100 4400
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR0130
U 1 1 5DC58BE0
P 6700 4600
F 0 "#PWR0130" H 6700 4450 50  0001 C CNN
F 1 "+3.3V" H 6715 4773 50  0000 C CNN
F 2 "" H 6700 4600 50  0001 C CNN
F 3 "" H 6700 4600 50  0001 C CNN
	1    6700 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4900 7100 4800
Wire Wire Line
	7000 4900 7100 4900
Wire Wire Line
	6500 4900 6600 4900
$Comp
L zephyrus_iaq:R_US R17
U 1 1 5DC58BE9
P 7100 4650
F 0 "R17" H 7200 4700 50  0000 L CNN
F 1 "3.3k" H 7200 4600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7140 4640 50  0001 C CNN
F 3 "~" H 7100 4650 50  0001 C CNN
	1    7100 4650
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:BSS138 U5
U 1 1 5DC58BF2
P 6800 4800
F 0 "U5" V 7043 4800 50  0000 C CNN
F 1 "BSS138" V 7134 4800 50  0001 C CNN
F 2 "zephyrus-iaq:BSS138" H 7250 5500 50  0001 L BNN
F 3 "TO-236-3 Micross" H 7250 5300 50  0001 L BNN
F 4 "MICROSS/On Semiconductor" H 7250 5200 50  0001 L BNN "Field4"
F 5 "Mosfet n-Ch 50v 220ma Die" H 7250 5050 50  0001 L BNN "Field5"
F 6 "BSS138" H 7250 5400 50  0001 L BNN "Field7"
	1    6800 4800
	0    1    1    0   
$EndComp
Text HLabel 5350 4900 2    50   Input ~ 0
SDA_5
Text HLabel 4750 4900 0    50   Input ~ 0
SDA_3.3
Wire Wire Line
	5350 4400 5350 4500
$Comp
L zephyrus_iaq:+5V #PWR0131
U 1 1 5DC58BFB
P 5350 4400
F 0 "#PWR0131" H 5350 4250 50  0001 C CNN
F 1 "+5V" H 5365 4573 50  0000 C CNN
F 2 "" H 5350 4400 50  0001 C CNN
F 3 "" H 5350 4400 50  0001 C CNN
	1    5350 4400
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR0132
U 1 1 5DC58C01
P 4950 4600
F 0 "#PWR0132" H 4950 4450 50  0001 C CNN
F 1 "+3.3V" H 4965 4773 50  0000 C CNN
F 2 "" H 4950 4600 50  0001 C CNN
F 3 "" H 4950 4600 50  0001 C CNN
	1    4950 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4900 5350 4800
Wire Wire Line
	5250 4900 5350 4900
Wire Wire Line
	4750 4900 4850 4900
$Comp
L zephyrus_iaq:R_US R16
U 1 1 5DC58C0A
P 5350 4650
F 0 "R16" H 5450 4700 50  0000 L CNN
F 1 "3.3k" H 5450 4600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5390 4640 50  0001 C CNN
F 3 "~" H 5350 4650 50  0001 C CNN
	1    5350 4650
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:BSS138 U4
U 1 1 5DC58C13
P 5050 4800
F 0 "U4" V 5293 4800 50  0000 C CNN
F 1 "BSS138" V 5384 4800 50  0001 C CNN
F 2 "zephyrus-iaq:BSS138" H 5500 5500 50  0001 L BNN
F 3 "TO-236-3 Micross" H 5500 5300 50  0001 L BNN
F 4 "MICROSS/On Semiconductor" H 5500 5200 50  0001 L BNN "Field4"
F 5 "Mosfet n-Ch 50v 220ma Die" H 5500 5050 50  0001 L BNN "Field5"
F 6 "BSS138" H 5500 5400 50  0001 L BNN "Field7"
	1    5050 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 4600 4950 4700
Text Notes 4050 4250 0    50   ~ 0
SDA_3.3 has a 1.8k fixed pull up\ninternal to the Raspberry Pi
Wire Wire Line
	6700 4600 6700 4700
$EndSCHEMATC
