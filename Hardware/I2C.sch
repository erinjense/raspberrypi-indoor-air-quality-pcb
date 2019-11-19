EESchema Schematic File Version 4
LIBS:Zephyrus-IAQ-HAT-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 5 7
Title "I2C Connectors and Logic Level Conversion"
Date "2019-11-15"
Rev "A"
Comp "Zephyrus, Indoor Air Quality - Raspberry Pi HAT"
Comment1 "Designed By Aaron Jense"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L zephyrus_iaq:SM04B-SRSS-TB(LF)(SN) J?
U 1 1 5DB91D7C
P 3250 3900
AR Path="/5DB91D7C" Ref="J?"  Part="1" 
AR Path="/5DB861AF/5DB91D7C" Ref="J6"  Part="1" 
F 0 "J6" H 3500 4150 50  0000 L CNN
F 1 "I2C 3.3V" H 3100 4250 50  0000 L CNB
F 2 "zephyrus-iaq:JST_SM04B-SRSS-TB(LF)(SN)" H 3250 3900 50  0001 L BNN
F 3 "" H 3250 3900 50  0001 L BNN
	1    3250 3900
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:SM04B-SRSS-TB(LF)(SN) J?
U 1 1 5DB91D82
P 5650 3900
AR Path="/5DB91D82" Ref="J?"  Part="1" 
AR Path="/5DB861AF/5DB91D82" Ref="J8"  Part="1" 
F 0 "J8" H 5900 4150 50  0000 L CNN
F 1 "I2C 3.3V" H 5500 4250 45  0000 L CNB
F 2 "zephyrus-iaq:JST_SM04B-SRSS-TB(LF)(SN)" H 5650 3900 50  0001 L BNN
F 3 "" H 5650 3900 50  0001 L BNN
	1    5650 3900
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB91D88
P 5250 3300
AR Path="/5DB91D88" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91D88" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 5250 3150 50  0001 C CNN
F 1 "+3.3V" H 5250 3450 50  0000 C CNN
F 2 "" H 5250 3300 50  0001 C CNN
F 3 "" H 5250 3300 50  0001 C CNN
	1    5250 3300
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB91D8E
P 5200 4450
AR Path="/5DB91D8E" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91D8E" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 5200 4200 50  0001 C CNN
F 1 "GND" H 5200 4300 50  0000 C CNN
F 2 "" H 5200 4450 50  0001 C CNN
F 3 "" H 5200 4450 50  0001 C CNN
	1    5200 4450
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:SM04B-SRSS-TB(LF)(SN) J?
U 1 1 5DB91D94
P 8400 3900
AR Path="/5DB91D94" Ref="J?"  Part="1" 
AR Path="/5DB861AF/5DB91D94" Ref="J16"  Part="1" 
F 0 "J16" H 8650 4150 50  0000 L CNN
F 1 "I2C 5V" H 8300 4250 50  0000 L CNB
F 2 "zephyrus-iaq:JST_SM04B-SRSS-TB(LF)(SN)" H 8400 3900 50  0001 L BNN
F 3 "" H 8400 3900 50  0001 L BNN
	1    8400 3900
	1    0    0    -1  
$EndComp
Text Notes 3700 2950 0    50   ~ 10
3.3V I2C Connectors\nCompatible with Sparkfun's Qwiic system.
$Comp
L zephyrus_iaq:Conn_01x01_Female J?
U 1 1 5DB91DA2
P 2650 3650
AR Path="/5DB91DA2" Ref="J?"  Part="1" 
AR Path="/5DB861AF/5DB91DA2" Ref="J17"  Part="1" 
F 0 "J17" H 2250 3900 50  0000 L CNN
F 1 "PPS" H 2200 3800 50  0000 L CNB
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2650 3650 50  0001 C CNN
F 3 "~" H 2650 3650 50  0001 C CNN
	1    2650 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4000 4850 4000
Wire Wire Line
	5250 3300 5250 3800
$Comp
L zephyrus_iaq:+3.3V #PWR?
U 1 1 5DB91DB9
P 3650 3300
AR Path="/5DB91DB9" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DB91DB9" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 3650 3150 50  0001 C CNN
F 1 "+3.3V" H 3650 3450 50  0000 C CNN
F 2 "" H 3650 3300 50  0001 C CNN
F 3 "" H 3650 3300 50  0001 C CNN
	1    3650 3300
	1    0    0    -1  
$EndComp
Text HLabel 4300 3750 0    50   Input ~ 10
SDA_3.3
Text HLabel 4300 4150 0    50   Input ~ 10
SCL_3.3
Text HLabel 7400 3400 2    50   Input ~ 10
SDA_5
Text HLabel 7450 4250 2    50   Input ~ 10
SCL_5
Text Notes 1850 3900 0    50   ~ 0
Pulse Per Second\nBreakout for Sparkfun GPS
Text HLabel 2450 3650 0    50   Input ~ 10
GPS_PPS
Wire Wire Line
	7100 3850 7100 3950
$Comp
L zephyrus_iaq:+5V #PWR0129
U 1 1 5DC58BDA
P 7100 3850
F 0 "#PWR0129" H 7100 3700 50  0001 C CNN
F 1 "+5V" H 7115 4023 50  0000 C CNN
F 2 "" H 7100 3850 50  0001 C CNN
F 3 "" H 7100 3850 50  0001 C CNN
	1    7100 3850
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR0130
U 1 1 5DC58BE0
P 6700 4050
F 0 "#PWR0130" H 6700 3900 50  0001 C CNN
F 1 "+3.3V" H 6715 4223 50  0000 C CNN
F 2 "" H 6700 4050 50  0001 C CNN
F 3 "" H 6700 4050 50  0001 C CNN
	1    6700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4350 7100 4250
Wire Wire Line
	7000 4350 7100 4350
$Comp
L zephyrus_iaq:R_US R17
U 1 1 5DC58BE9
P 7100 4100
F 0 "R17" H 7200 4150 50  0000 L CNN
F 1 "3.3k" H 7200 4050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7140 4090 50  0001 C CNN
F 3 "~" H 7100 4100 50  0001 C CNN
	1    7100 4100
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:BSS138 U5
U 1 1 5DC58BF2
P 6800 4250
F 0 "U5" V 7043 4250 50  0000 C CNN
F 1 "BSS138" V 7134 4250 50  0001 C CNN
F 2 "zephyrus-iaq:BSS138" H 7250 4950 50  0001 L BNN
F 3 "TO-236-3 Micross" H 7250 4750 50  0001 L BNN
F 4 "MICROSS/On Semiconductor" H 7250 4650 50  0001 L BNN "Field4"
F 5 "Mosfet n-Ch 50v 220ma Die" H 7250 4500 50  0001 L BNN "Field5"
F 6 "BSS138" H 7250 4850 50  0001 L BNN "Field7"
	1    6800 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 3000 7100 3050
$Comp
L zephyrus_iaq:+5V #PWR0131
U 1 1 5DC58BFB
P 7100 3000
F 0 "#PWR0131" H 7100 2850 50  0001 C CNN
F 1 "+5V" H 7115 3173 50  0000 C CNN
F 2 "" H 7100 3000 50  0001 C CNN
F 3 "" H 7100 3000 50  0001 C CNN
	1    7100 3000
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+3.3V #PWR0132
U 1 1 5DC58C01
P 6700 3200
F 0 "#PWR0132" H 6700 3050 50  0001 C CNN
F 1 "+3.3V" H 6715 3373 50  0000 C CNN
F 2 "" H 6700 3200 50  0001 C CNN
F 3 "" H 6700 3200 50  0001 C CNN
	1    6700 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3500 7100 3400
Wire Wire Line
	7000 3500 7100 3500
$Comp
L zephyrus_iaq:R_US R16
U 1 1 5DC58C0A
P 7100 3250
F 0 "R16" H 7200 3300 50  0000 L CNN
F 1 "3.3k" H 7200 3200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7140 3240 50  0001 C CNN
F 3 "~" H 7100 3250 50  0001 C CNN
	1    7100 3250
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:BSS138 U4
U 1 1 5DC58C13
P 6800 3400
F 0 "U4" V 7043 3400 50  0000 C CNN
F 1 "BSS138" V 7134 3400 50  0001 C CNN
F 2 "zephyrus-iaq:BSS138" H 7250 4100 50  0001 L BNN
F 3 "TO-236-3 Micross" H 7250 3900 50  0001 L BNN
F 4 "MICROSS/On Semiconductor" H 7250 3800 50  0001 L BNN "Field4"
F 5 "Mosfet n-Ch 50v 220ma Die" H 7250 3650 50  0001 L BNN "Field5"
F 6 "BSS138" H 7250 4000 50  0001 L BNN "Field7"
	1    6800 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 3200 6700 3300
Wire Wire Line
	6700 4050 6700 4150
Text Notes 4600 2000 0    118  ~ 24
3.3V and 5V I2C Connectors
Text Notes 6300 5550 0    50   ~ 0
The Bi-Directional logic level shift using the BSS138\nwas inspired by reading Sparkfun's schematic\nhttps://cdn.sparkfun.com/datasheets/BreakoutBoards/Logic_Level_Bidirectional.pdf\n\nLicense:\nhttps://creativecommons.org/licenses/by-sa/3.0/us/\n\nChanges:\nThere is no Pull-Up on the Source, because of the\ninterl Raspberry Pi 1.8k Pull-Ups
Connection ~ 7100 3050
Wire Wire Line
	7100 3050 7100 3100
Wire Wire Line
	4850 3900 4850 3500
Wire Wire Line
	4850 4000 4850 4350
Wire Wire Line
	4850 4350 6600 4350
Wire Wire Line
	5200 3700 5350 3700
Wire Wire Line
	5200 3700 5200 4450
Wire Wire Line
	5250 3800 5350 3800
Wire Wire Line
	4850 3500 6600 3500
Connection ~ 4850 3900
Wire Wire Line
	4850 3900 5350 3900
Wire Wire Line
	7100 3400 7400 3400
Connection ~ 7100 3400
Wire Wire Line
	7100 4250 7450 4250
Connection ~ 7100 4250
Wire Wire Line
	7100 3050 8000 3050
Wire Wire Line
	3550 3900 4400 3900
Wire Wire Line
	3550 4000 4400 4000
Connection ~ 4850 4000
Wire Wire Line
	3650 3300 3650 3800
Wire Wire Line
	3700 3700 3550 3700
Wire Wire Line
	3700 3700 3700 4450
Wire Wire Line
	3650 3800 3550 3800
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DF2A51B
P 3700 4450
AR Path="/5DF2A51B" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DF2A51B" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 3700 4200 50  0001 C CNN
F 1 "GND" H 3700 4300 50  0000 C CNN
F 2 "" H 3700 4450 50  0001 C CNN
F 3 "" H 3700 4450 50  0001 C CNN
	1    3700 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4300 3750 4400 3750
Wire Wire Line
	4400 3750 4400 3900
Connection ~ 4400 3900
Wire Wire Line
	4400 3900 4850 3900
Wire Wire Line
	4400 4000 4400 4150
Wire Wire Line
	4400 4150 4300 4150
Connection ~ 4400 4000
Wire Wire Line
	4400 4000 4850 4000
Wire Wire Line
	7950 3700 8100 3700
Wire Wire Line
	7950 3700 7950 4450
Wire Wire Line
	8000 3800 8100 3800
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DF34FE7
P 7950 4450
AR Path="/5DF34FE7" Ref="#PWR?"  Part="1" 
AR Path="/5DB861AF/5DF34FE7" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 7950 4200 50  0001 C CNN
F 1 "GND" H 7950 4300 50  0000 C CNN
F 2 "" H 7950 4450 50  0001 C CNN
F 3 "" H 7950 4450 50  0001 C CNN
	1    7950 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3050 8000 3800
Connection ~ 7100 3500
Wire Wire Line
	7100 4350 7850 4350
Wire Wire Line
	7850 4350 7850 4000
Wire Wire Line
	7850 4000 8100 4000
Connection ~ 7100 4350
Wire Wire Line
	7850 3900 7850 3500
Wire Wire Line
	7850 3900 8100 3900
Wire Wire Line
	7100 3500 7850 3500
$Comp
L cc-by-sa:LOGO #G5
U 1 1 5DD3A469
P 5350 7550
F 0 "#G5" H 5350 7287 60  0001 C CNN
F 1 "LOGO" H 5350 7813 60  0001 C CNN
F 2 "" H 5350 7550 50  0001 C CNN
F 3 "" H 5350 7550 50  0001 C CNN
	1    5350 7550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
