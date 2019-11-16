EESchema Schematic File Version 4
LIBS:TopLevel-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 7
Title "Motor Driver for Fans"
Date "2019-11-15"
Rev ""
Comp "Zephyrus, Indoor Air Quality - Raspberry Pi HAT"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD15
P 5650 4300
AR Path="/5DB4CD15" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD15" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 5650 4050 50  0001 C CNN
F 1 "GND" H 5655 4127 50  0000 C CNN
F 2 "" H 5650 4300 50  0001 C CNN
F 3 "" H 5650 4300 50  0001 C CNN
	1    5650 4300
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:LED D?
U 1 1 5DB4CD1B
P 4100 4350
AR Path="/5DA09389/5DB4CD1B" Ref="D?"  Part="1" 
AR Path="/5DB4CD1B" Ref="D?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD1B" Ref="D2"  Part="1" 
F 0 "D2" V 4100 4450 50  0000 C CNN
F 1 "LED" V 4000 4450 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric" H 4100 4350 50  0001 C CNN
F 3 "~" H 4100 4350 50  0001 C CNN
	1    4100 4350
	0    -1   -1   0   
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB4CD22
P 4100 4750
AR Path="/5DA09389/5DB4CD22" Ref="R?"  Part="1" 
AR Path="/5DB4CD22" Ref="R?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD22" Ref="R7"  Part="1" 
F 0 "R7" H 4168 4796 50  0000 L CNN
F 1 "330" H 4168 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4140 4740 50  0001 C CNN
F 3 "~" H 4100 4750 50  0001 C CNN
	1    4100 4750
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD28
P 4100 5000
AR Path="/5DB4CD28" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD28" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD28" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD28" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 4100 4750 50  0001 C CNN
F 1 "GND" H 4200 4900 50  0000 C CNN
F 2 "" H 4100 5000 50  0001 C CNN
F 3 "" H 4100 5000 50  0001 C CNN
	1    4100 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4900 4100 5000
Wire Wire Line
	4100 4500 4100 4600
Text Notes 3650 4250 0    50   ~ 10
Fan LED
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
P 4500 3150
AR Path="/5DA09389/5DB4CD37" Ref="#PWR?"  Part="1" 
AR Path="/5DB4CD37" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD37" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 4500 3000 50  0001 C CNN
F 1 "+5V" H 4515 3323 50  0000 C CNN
F 2 "" H 4500 3150 50  0001 C CNN
F 3 "" H 4500 3150 50  0001 C CNN
	1    4500 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4450 4500 4500
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB4CD3F
P 4500 4300
AR Path="/5DB4CD3F" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD3F" Ref="C?"  Part="1" 
AR Path="/5DA09389/5DB4CD3F" Ref="C?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD3F" Ref="C3"  Part="1" 
F 0 "C3" H 4650 4450 50  0000 L CNN
F 1 "100nF" H 4650 4300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4538 4150 50  0001 C CNN
F 3 "~" H 4500 4300 50  0001 C CNN
	1    4500 4300
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD45
P 4500 4500
AR Path="/5DB4CD45" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD45" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD45" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD45" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 4500 4250 50  0001 C CNN
F 1 "GND" H 4600 4400 50  0000 C CNN
F 2 "" H 4500 4500 50  0001 C CNN
F 3 "" H 4500 4500 50  0001 C CNN
	1    4500 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3300 7900 3250
Wire Wire Line
	7900 3600 7900 3650
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB4CD50
P 7900 3450
AR Path="/5DB4CD50" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD50" Ref="C?"  Part="1" 
AR Path="/5DA09389/5DB4CD50" Ref="C?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD50" Ref="C4"  Part="1" 
F 0 "C4" H 7650 3550 50  0000 L CNN
F 1 "100nF" H 7550 3450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7938 3300 50  0001 C CNN
F 3 "~" H 7900 3450 50  0001 C CNN
	1    7900 3450
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD56
P 7900 3650
AR Path="/5DB4CD56" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD56" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD56" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD56" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 7900 3400 50  0001 C CNN
F 1 "GND" H 7900 3500 50  0000 C CNN
F 2 "" H 7900 3650 50  0001 C CNN
F 3 "" H 7900 3650 50  0001 C CNN
	1    7900 3650
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD63
P 3450 3950
AR Path="/5DB4CD63" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD63" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 3450 3700 50  0001 C CNN
F 1 "GND" H 3455 3777 50  0000 C CNN
F 2 "" H 3450 3950 50  0001 C CNN
F 3 "" H 3450 3950 50  0001 C CNN
	1    3450 3950
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB4CD6A
P 7900 3250
AR Path="/5DB4CD6A" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD6A" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 7900 3100 50  0001 C CNN
F 1 "+3.3V" H 8050 3350 50  0000 C CNN
F 2 "" H 7900 3250 50  0000 C CNN
F 3 "" H 7900 3250 50  0000 C CNN
	1    7900 3250
	-1   0    0    -1  
$EndComp
Text Label 4650 3500 0    50   ~ 0
FAN_OUT1
Text Label 6700 3300 2    50   ~ 0
FAN_VCC
Wire Wire Line
	6250 3500 6700 3500
Wire Wire Line
	6250 3700 6700 3700
Wire Wire Line
	6250 3900 6700 3900
$Comp
L zephyrus_iaq:LED D?
U 1 1 5DB4CD77
P 3550 4450
AR Path="/5DA09389/5DB4CD77" Ref="D?"  Part="1" 
AR Path="/5DB4CD77" Ref="D?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD77" Ref="D3"  Part="1" 
F 0 "D3" V 3550 4550 50  0000 C CNN
F 1 "LED" V 3450 4550 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric" H 3550 4450 50  0001 C CNN
F 3 "~" H 3550 4450 50  0001 C CNN
	1    3550 4450
	0    -1   -1   0   
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB4CD7E
P 3550 4850
AR Path="/5DA09389/5DB4CD7E" Ref="R?"  Part="1" 
AR Path="/5DB4CD7E" Ref="R?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD7E" Ref="R8"  Part="1" 
F 0 "R8" H 3618 4896 50  0000 L CNN
F 1 "330" H 3618 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3590 4840 50  0001 C CNN
F 3 "~" H 3550 4850 50  0001 C CNN
	1    3550 4850
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD84
P 3550 5100
AR Path="/5DB4CD84" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD84" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD84" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD84" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 3550 4850 50  0001 C CNN
F 1 "GND" H 3650 5000 50  0000 C CNN
F 2 "" H 3550 5100 50  0001 C CNN
F 3 "" H 3550 5100 50  0001 C CNN
	1    3550 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5000 3550 5100
Wire Wire Line
	3550 4600 3550 4700
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD92
P 4000 3550
AR Path="/5DB4CD92" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD92" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD92" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD92" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 4000 3300 50  0001 C CNN
F 1 "GND" H 4150 3500 50  0000 C CNN
F 2 "" H 4000 3550 50  0001 C CNN
F 3 "" H 4000 3550 50  0001 C CNN
	1    4000 3550
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:SM02B-SRSS-TB(LF)(SN) J?
U 1 1 5DB4CD9F
P 3900 3450
AR Path="/5DB4CD9F" Ref="J?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD9F" Ref="J4"  Part="1" 
F 0 "J4" V 4450 3700 50  0000 L CNN
F 1 "Fan 1" V 4350 3550 50  0000 L CNB
F 2 "SM02B-SRSS-TB(LF)(SN)" H 4150 3850 50  0001 L BNN
F 3 "SH Series 2 Position 1 mm Pitch Surface Mount Side Entry Shrouded Header" H 4150 3950 50  0001 L BNN
F 4 "SM02B-SRSS-TB_LF__SN_" H 4150 4050 50  0001 L BNN "Field8"
	1    3900 3450
	0    1    -1   0   
$EndComp
$Comp
L zephyrus_iaq:SM02B-SRSS-TB(LF)(SN) J?
U 1 1 5DB4CDA6
P 3350 3650
AR Path="/5DB4CDA6" Ref="J?"  Part="1" 
AR Path="/5DB33F6F/5DB4CDA6" Ref="J5"  Part="1" 
F 0 "J5" V 3900 3850 50  0000 L CNN
F 1 "Fan 2" V 3800 3700 50  0000 L CNB
F 2 "SM02B-SRSS-TB(LF)(SN)" H 3600 4050 50  0001 L BNN
F 3 "SH Series 2 Position 1 mm Pitch Surface Mount Side Entry Shrouded Header" H 3600 4150 50  0001 L BNN
F 4 "SM02B-SRSS-TB_LF__SN_" H 3600 4250 50  0001 L BNN "Field8"
	1    3350 3650
	0    1    -1   0   
$EndComp
Text HLabel 6700 3500 2    50   Input ~ 10
FAN_nSLEEP
Text HLabel 6700 3700 2    50   Input ~ 10
FAN_PWM0
Text HLabel 6700 3900 2    50   Input ~ 10
FAN_PWM1
Wire Wire Line
	4000 3450 4000 3550
Wire Wire Line
	4100 3500 4100 3450
Wire Wire Line
	4100 3500 5050 3500
Wire Wire Line
	5050 3700 3550 3700
Wire Wire Line
	3550 3700 3550 3650
Wire Wire Line
	3450 3650 3450 3900
Wire Wire Line
	3450 3900 5050 3900
Wire Wire Line
	3450 3900 3450 3950
Connection ~ 3450 3900
Wire Wire Line
	3550 4300 3550 3700
Connection ~ 3550 3700
Wire Wire Line
	4100 3500 4100 4200
Connection ~ 4100 3500
Wire Wire Line
	6250 3300 7900 3300
Connection ~ 7900 3300
Wire Wire Line
	4500 3150 4500 3300
Wire Wire Line
	4500 3300 5050 3300
Connection ~ 4500 3300
Wire Wire Line
	4500 3300 4500 4150
Wire Wire Line
	5650 4100 5650 4300
Text Notes 3000 2950 0    50   ~ 0
Fan 2-Pin Connectors\n(Unidirectional Control)
Text Label 4650 3700 0    50   ~ 0
FAN_OUT2
$EndSCHEMATC
