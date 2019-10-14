EESchema Schematic File Version 4
LIBS:rpi-hat-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
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
P 8850 2950
AR Path="/5DB91D94" Ref="J?"  Part="1" 
AR Path="/5DB861AF/5DB91D94" Ref="J16"  Part="1" 
F 0 "J16" H 8850 3400 50  0000 L CNN
F 1 "I2C 5V" H 8750 3300 50  0000 L CNN
F 2 "SM04B-SRSS-TB_LF__SN_:JST_SM04B-SRSS-TB(LF)(SN)" H 8850 2950 50  0001 L BNN
F 3 "" H 8850 2950 50  0001 L BNN
	1    8850 2950
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB91D9A
P 8050 2750
AR Path="/5DB91D9A" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91D9A" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 8050 2500 50  0001 C CNN
F 1 "GND" V 8050 2550 50  0000 C CNN
F 2 "" H 8050 2750 50  0001 C CNN
F 3 "" H 8050 2750 50  0001 C CNN
	1    8050 2750
	0    1    -1   0   
$EndComp
Text Notes 6500 2350 0    50   ~ 10
3.3V I2C
Text Notes 8700 2400 0    50   ~ 10
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
P 8050 2850
AR Path="/5DB91DA9" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91DA9" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 8050 2700 50  0001 C CNN
F 1 "+5V" V 8065 2978 50  0000 L CNN
F 2 "" H 8050 2850 50  0001 C CNN
F 3 "" H 8050 2850 50  0001 C CNN
	1    8050 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8050 2750 8550 2750
Wire Wire Line
	8050 2850 8550 2850
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
	8550 2950 8050 2950
Wire Wire Line
	8550 3050 8050 3050
Text HLabel 8050 2950 0    50   Input ~ 10
SDA_5
Text HLabel 8050 3050 0    50   Input ~ 10
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
$EndSCHEMATC
