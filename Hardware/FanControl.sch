EESchema Schematic File Version 4
LIBS:Zephyrus-IAQ-HAT-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 4 7
Title "Motor Driver for Fan"
Date "2019-11-15"
Rev "A"
Comp "Zephyrus, Indoor Air Quality - Raspberry Pi HAT"
Comment1 "Designed By Aaron Jense"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD15
P 5650 4200
AR Path="/5DB4CD15" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD15" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 5650 3950 50  0001 C CNN
F 1 "GND" H 5655 4027 50  0000 C CNN
F 2 "" H 5650 4200 50  0001 C CNN
F 3 "" H 5650 4200 50  0001 C CNN
	1    5650 4200
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:DRV8837C U?
U 1 1 5DB4CD31
P 5650 3150
AR Path="/5DB4CD31" Ref="U?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD31" Ref="U2"  Part="1" 
F 0 "U2" H 5650 3265 50  0000 C CNN
F 1 "Fan Driver" H 5650 3174 50  0000 C CNB
F 2 "zephyrus-iaq:SON50P200X200X80-9N" H 5650 3150 50  0001 C CNN
F 3 "" H 5650 3150 50  0001 C CNN
	1    5650 3150
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DB4CD37
P 4250 3200
AR Path="/5DA09389/5DB4CD37" Ref="#PWR?"  Part="1" 
AR Path="/5DB4CD37" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD37" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 4250 3050 50  0001 C CNN
F 1 "+5V" H 4265 3373 50  0000 C CNN
F 2 "" H 4250 3200 50  0001 C CNN
F 3 "" H 4250 3200 50  0001 C CNN
	1    4250 3200
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB4CD3F
P 4250 3550
AR Path="/5DB4CD3F" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD3F" Ref="C?"  Part="1" 
AR Path="/5DA09389/5DB4CD3F" Ref="C?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD3F" Ref="C3"  Part="1" 
F 0 "C3" H 4000 3600 50  0000 L CNN
F 1 "100nF" H 3900 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4288 3400 50  0001 C CNN
F 3 "~" H 4250 3550 50  0001 C CNN
	1    4250 3550
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD45
P 4250 4000
AR Path="/5DB4CD45" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD45" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD45" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD45" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 4250 3750 50  0001 C CNN
F 1 "GND" H 4350 3900 50  0000 C CNN
F 2 "" H 4250 4000 50  0001 C CNN
F 3 "" H 4250 4000 50  0001 C CNN
	1    4250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3300 7550 3250
Wire Wire Line
	7550 3600 7550 3650
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB4CD50
P 7550 3450
AR Path="/5DB4CD50" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD50" Ref="C?"  Part="1" 
AR Path="/5DA09389/5DB4CD50" Ref="C?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD50" Ref="C4"  Part="1" 
F 0 "C4" H 7300 3550 50  0000 L CNN
F 1 "100nF" H 7200 3450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7588 3300 50  0001 C CNN
F 3 "~" H 7550 3450 50  0001 C CNN
	1    7550 3450
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD56
P 7550 3650
AR Path="/5DB4CD56" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD56" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD56" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD56" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 7550 3400 50  0001 C CNN
F 1 "GND" H 7550 3500 50  0000 C CNN
F 2 "" H 7550 3650 50  0001 C CNN
F 3 "" H 7550 3650 50  0001 C CNN
	1    7550 3650
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB4CD6A
P 7550 3250
AR Path="/5DB4CD6A" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD6A" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 7550 3100 50  0001 C CNN
F 1 "+3.3V" H 7700 3350 50  0000 C CNN
F 2 "" H 7550 3250 50  0000 C CNN
F 3 "" H 7550 3250 50  0000 C CNN
	1    7550 3250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6250 3500 6700 3500
Wire Wire Line
	6250 3700 6700 3700
Wire Wire Line
	6250 3900 6700 3900
$Comp
L zephyrus_iaq:SM02B-SRSS-TB(LF)(SN) J?
U 1 1 5DB4CD9F
P 5000 3750
AR Path="/5DB4CD9F" Ref="J?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD9F" Ref="J4"  Part="1" 
F 0 "J4" H 5450 4000 50  0000 L CNN
F 1 "Fan" H 5250 4100 50  0000 L CNB
F 2 "SM02B-SRSS-TB(LF)(SN)" H 5250 4150 50  0001 L BNN
F 3 "SH Series 2 Position 1 mm Pitch Surface Mount Side Entry Shrouded Header" H 5250 4250 50  0001 L BNN
F 4 "SM02B-SRSS-TB_LF__SN_" H 5250 4350 50  0001 L BNN "Field8"
	1    5000 3750
	-1   0    0    -1  
$EndComp
Text HLabel 6700 3500 2    50   Input ~ 10
FAN_nSLEEP
Text HLabel 6700 3700 2    50   Input ~ 10
FAN_PWM1
Text Notes 4400 2850 0    50   ~ 0
 2-Pin Connector for Fan\n(Unidirectional Control)
Wire Wire Line
	6250 3300 7550 3300
Connection ~ 7550 3300
$Comp
L cc-by-sa:LOGO #G?
U 1 1 5DD4EE40
P 5350 7550
AR Path="/5DB861AF/5DD4EE40" Ref="#G?"  Part="1" 
AR Path="/5DB33F6F/5DD4EE40" Ref="#G4"  Part="1" 
F 0 "#G4" H 5350 7287 60  0001 C CNN
F 1 "LOGO" H 5350 7813 60  0001 C CNN
F 2 "" H 5350 7550 50  0001 C CNN
F 3 "" H 5350 7550 50  0001 C CNN
	1    5350 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3650 5050 3700
Wire Wire Line
	5050 3550 5050 3500
Wire Wire Line
	4250 3300 4250 3400
Wire Wire Line
	4250 3300 5050 3300
Wire Wire Line
	5000 3550 5050 3550
Wire Wire Line
	5000 3650 5050 3650
Wire Wire Line
	4250 3700 4250 3900
Wire Wire Line
	4250 3900 5050 3900
Wire Wire Line
	4250 3200 4250 3300
Connection ~ 4250 3300
Wire Wire Line
	4250 3900 4250 4000
Connection ~ 4250 3900
Wire Wire Line
	5650 4100 5650 4150
Wire Wire Line
	5650 4150 6700 4150
Wire Wire Line
	6700 4150 6700 3900
Connection ~ 5650 4150
Wire Wire Line
	5650 4150 5650 4200
$EndSCHEMATC
