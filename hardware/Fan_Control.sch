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
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD15
P 6300 3750
AR Path="/5DB4CD15" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD15" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 6300 3500 50  0001 C CNN
F 1 "GND" H 6305 3577 50  0000 C CNN
F 2 "" H 6300 3750 50  0001 C CNN
F 3 "" H 6300 3750 50  0001 C CNN
	1    6300 3750
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:LED D?
U 1 1 5DB4CD1B
P 4750 3800
AR Path="/5DA09389/5DB4CD1B" Ref="D?"  Part="1" 
AR Path="/5DB4CD1B" Ref="D?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD1B" Ref="D2"  Part="1" 
F 0 "D2" V 4750 3900 50  0000 C CNN
F 1 "LED" V 4650 3900 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric" H 4750 3800 50  0001 C CNN
F 3 "~" H 4750 3800 50  0001 C CNN
	1    4750 3800
	0    -1   -1   0   
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB4CD22
P 4750 4200
AR Path="/5DA09389/5DB4CD22" Ref="R?"  Part="1" 
AR Path="/5DB4CD22" Ref="R?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD22" Ref="R7"  Part="1" 
F 0 "R7" H 4818 4246 50  0000 L CNN
F 1 "330" H 4818 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4790 4190 50  0001 C CNN
F 3 "~" H 4750 4200 50  0001 C CNN
	1    4750 4200
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD28
P 4750 4450
AR Path="/5DB4CD28" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD28" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD28" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD28" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 4750 4200 50  0001 C CNN
F 1 "GND" H 4850 4350 50  0000 C CNN
F 2 "" H 4750 4450 50  0001 C CNN
F 3 "" H 4750 4450 50  0001 C CNN
	1    4750 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4350 4750 4450
Wire Wire Line
	4750 3950 4750 4050
Text Notes 4300 3700 0    50   ~ 10
Fan LED
$Comp
L zephyrus_iaq:DRV8837C U?
U 1 1 5DB4CD31
P 6300 2600
AR Path="/5DB4CD31" Ref="U?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD31" Ref="U2"  Part="1" 
F 0 "U2" H 6300 2715 50  0000 C CNN
F 1 "Fan Driver" H 6300 2624 50  0000 C CNB
F 2 "zephyrus-iaq:SON50P200X200X80-9N" H 6300 2600 50  0001 C CNN
F 3 "" H 6300 2600 50  0001 C CNN
	1    6300 2600
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DB4CD37
P 5150 2600
AR Path="/5DA09389/5DB4CD37" Ref="#PWR?"  Part="1" 
AR Path="/5DB4CD37" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD37" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 5150 2450 50  0001 C CNN
F 1 "+5V" H 5165 2773 50  0000 C CNN
F 2 "" H 5150 2600 50  0001 C CNN
F 3 "" H 5150 2600 50  0001 C CNN
	1    5150 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3900 5150 3950
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB4CD3F
P 5150 3750
AR Path="/5DB4CD3F" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD3F" Ref="C?"  Part="1" 
AR Path="/5DA09389/5DB4CD3F" Ref="C?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD3F" Ref="C3"  Part="1" 
F 0 "C3" H 5300 3900 50  0000 L CNN
F 1 "100nF" H 5300 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5188 3600 50  0001 C CNN
F 3 "~" H 5150 3750 50  0001 C CNN
	1    5150 3750
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD45
P 5150 3950
AR Path="/5DB4CD45" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD45" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD45" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD45" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 5150 3700 50  0001 C CNN
F 1 "GND" H 5250 3850 50  0000 C CNN
F 2 "" H 5150 3950 50  0001 C CNN
F 3 "" H 5150 3950 50  0001 C CNN
	1    5150 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2750 8550 2700
Wire Wire Line
	8550 3050 8550 3100
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB4CD50
P 8550 2900
AR Path="/5DB4CD50" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD50" Ref="C?"  Part="1" 
AR Path="/5DA09389/5DB4CD50" Ref="C?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD50" Ref="C4"  Part="1" 
F 0 "C4" H 8300 3000 50  0000 L CNN
F 1 "100nF" H 8200 2900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8588 2750 50  0001 C CNN
F 3 "~" H 8550 2900 50  0001 C CNN
	1    8550 2900
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD56
P 8550 3100
AR Path="/5DB4CD56" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD56" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD56" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD56" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 8550 2850 50  0001 C CNN
F 1 "GND" H 8550 2950 50  0000 C CNN
F 2 "" H 8550 3100 50  0001 C CNN
F 3 "" H 8550 3100 50  0001 C CNN
	1    8550 3100
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD63
P 4100 3400
AR Path="/5DB4CD63" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD63" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 4100 3150 50  0001 C CNN
F 1 "GND" H 4105 3227 50  0000 C CNN
F 2 "" H 4100 3400 50  0001 C CNN
F 3 "" H 4100 3400 50  0001 C CNN
	1    4100 3400
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB4CD6A
P 8550 2700
AR Path="/5DB4CD6A" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD6A" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 8550 2550 50  0001 C CNN
F 1 "+3.3V" H 8700 2800 50  0000 C CNN
F 2 "" H 8550 2700 50  0000 C CNN
F 3 "" H 8550 2700 50  0000 C CNN
	1    8550 2700
	-1   0    0    -1  
$EndComp
Text Label 5300 2950 0    50   ~ 0
FAN_OUT1
Text Label 7350 2750 2    50   ~ 0
FAN_VCC
Wire Wire Line
	6900 2950 7350 2950
Wire Wire Line
	6900 3150 7350 3150
Wire Wire Line
	6900 3350 7350 3350
$Comp
L zephyrus_iaq:LED D?
U 1 1 5DB4CD77
P 4200 3900
AR Path="/5DA09389/5DB4CD77" Ref="D?"  Part="1" 
AR Path="/5DB4CD77" Ref="D?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD77" Ref="D3"  Part="1" 
F 0 "D3" V 4200 4000 50  0000 C CNN
F 1 "LED" V 4100 4000 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric" H 4200 3900 50  0001 C CNN
F 3 "~" H 4200 3900 50  0001 C CNN
	1    4200 3900
	0    -1   -1   0   
$EndComp
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5DB4CD7E
P 4200 4300
AR Path="/5DA09389/5DB4CD7E" Ref="R?"  Part="1" 
AR Path="/5DB4CD7E" Ref="R?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD7E" Ref="R8"  Part="1" 
F 0 "R8" H 4268 4346 50  0000 L CNN
F 1 "330" H 4268 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4240 4290 50  0001 C CNN
F 3 "~" H 4200 4300 50  0001 C CNN
	1    4200 4300
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD84
P 4200 4550
AR Path="/5DB4CD84" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD84" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD84" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD84" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 4200 4300 50  0001 C CNN
F 1 "GND" H 4300 4450 50  0000 C CNN
F 2 "" H 4200 4550 50  0001 C CNN
F 3 "" H 4200 4550 50  0001 C CNN
	1    4200 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4450 4200 4550
Wire Wire Line
	4200 4050 4200 4150
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB4CD92
P 4650 3000
AR Path="/5DB4CD92" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB4CD92" Ref="#PWR?"  Part="1" 
AR Path="/5DA09389/5DB4CD92" Ref="#PWR?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD92" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 4650 2750 50  0001 C CNN
F 1 "GND" H 4800 2950 50  0000 C CNN
F 2 "" H 4650 3000 50  0001 C CNN
F 3 "" H 4650 3000 50  0001 C CNN
	1    4650 3000
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:SM02B-SRSS-TB(LF)(SN) J?
U 1 1 5DB4CD9F
P 4550 2900
AR Path="/5DB4CD9F" Ref="J?"  Part="1" 
AR Path="/5DB33F6F/5DB4CD9F" Ref="J4"  Part="1" 
F 0 "J4" V 5100 3150 50  0000 L CNN
F 1 "Fan 1" V 5000 3000 50  0000 L CNB
F 2 "SM02B-SRSS-TB(LF)(SN)" H 4800 3300 50  0001 L BNN
F 3 "SH Series 2 Position 1 mm Pitch Surface Mount Side Entry Shrouded Header" H 4800 3400 50  0001 L BNN
F 4 "SM02B-SRSS-TB_LF__SN_" H 4800 3500 50  0001 L BNN "Field8"
	1    4550 2900
	0    1    -1   0   
$EndComp
$Comp
L zephyrus_iaq:SM02B-SRSS-TB(LF)(SN) J?
U 1 1 5DB4CDA6
P 4000 3100
AR Path="/5DB4CDA6" Ref="J?"  Part="1" 
AR Path="/5DB33F6F/5DB4CDA6" Ref="J5"  Part="1" 
F 0 "J5" V 4550 3300 50  0000 L CNN
F 1 "Fan 2" V 4450 3150 50  0000 L CNB
F 2 "SM02B-SRSS-TB(LF)(SN)" H 4250 3500 50  0001 L BNN
F 3 "SH Series 2 Position 1 mm Pitch Surface Mount Side Entry Shrouded Header" H 4250 3600 50  0001 L BNN
F 4 "SM02B-SRSS-TB_LF__SN_" H 4250 3700 50  0001 L BNN "Field8"
	1    4000 3100
	0    1    -1   0   
$EndComp
Text HLabel 7350 2950 2    50   Input ~ 10
FAN_nSLEEP
Text HLabel 7350 3150 2    50   Input ~ 10
FAN_PWM0
Text HLabel 7350 3350 2    50   Input ~ 10
FAN_PWM1
Wire Wire Line
	4650 2900 4650 3000
Wire Wire Line
	4750 2950 4750 2900
Wire Wire Line
	4750 2950 5700 2950
Wire Wire Line
	5700 3150 4200 3150
Wire Wire Line
	4200 3150 4200 3100
Wire Wire Line
	4100 3100 4100 3350
Wire Wire Line
	4100 3350 5700 3350
Wire Wire Line
	4100 3350 4100 3400
Connection ~ 4100 3350
Wire Wire Line
	4200 3750 4200 3150
Connection ~ 4200 3150
Wire Wire Line
	4750 2950 4750 3650
Connection ~ 4750 2950
Wire Wire Line
	6900 2750 8550 2750
Connection ~ 8550 2750
Wire Wire Line
	5150 2600 5150 2750
Wire Wire Line
	5150 2750 5700 2750
Connection ~ 5150 2750
Wire Wire Line
	5150 2750 5150 3600
Wire Wire Line
	6300 3550 6300 3750
Text Notes 3650 2400 0    50   ~ 0
Fan 2-Pin Connectors\n(Unidirectional Control)
Text Label 5300 3150 0    50   ~ 0
FAN_OUT2
$EndSCHEMATC
