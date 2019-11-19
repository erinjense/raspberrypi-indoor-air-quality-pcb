EESchema Schematic File Version 4
LIBS:Zephyrus-IAQ-HAT-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 7
Title "Multiplexed Analog Input"
Date "2019-11-15"
Rev "A"
Comp "Zephyrus, Indoor Air Quality - Raspberry Pi HAT"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L zephyrus_iaq:ADS1115IDGSR U7
U 1 1 5DAF67B5
P 8650 3800
F 0 "U7" H 8650 4467 50  0000 C CNN
F 1 "ADC" H 8650 4376 50  0000 C CNB
F 2 "zephyrus-iaq:SOP50P490X110-10N" H 8350 4900 50  0001 L BNN
F 3 "MSOP-10 Texas Instruments" H 8200 4600 50  0001 L BNN
F 4 "Texas Instruments" H 8400 4700 50  0001 L BNN "Field4"
F 5 "16-Bit ADC with Integrated MUX, PGA, Comparator, Oscillator, and Reference 10-VSSOP -40 to 125" H 7200 4450 50  0001 L BNN "Field5"
F 6 "ADS1115IDGSR" H 8450 4800 50  0001 L BNN "Field7"
	1    8650 3800
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5DAF9FBB
P 10100 3800
AR Path="/5DAF9FBB" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DAF9FBB" Ref="C11"  Part="1" 
AR Path="/5DA09389/5DAF9FBB" Ref="C?"  Part="1" 
F 0 "C11" H 9850 3850 50  0000 L CNN
F 1 "100nF" H 9750 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10138 3650 50  0001 C CNN
F 3 "~" H 10100 3800 50  0001 C CNN
	1    10100 3800
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DAF9FC1
P 10100 4350
AR Path="/5DAF9FC1" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DAF9FC1" Ref="#PWR067"  Part="1" 
AR Path="/5DA09389/5DAF9FC1" Ref="#PWR?"  Part="1" 
F 0 "#PWR067" H 10100 4100 50  0001 C CNN
F 1 "GND" H 10200 4250 50  0000 C CNN
F 2 "" H 10100 4350 50  0001 C CNN
F 3 "" H 10100 4350 50  0001 C CNN
	1    10100 4350
	-1   0    0    -1  
$EndComp
Text HLabel 7550 4100 0    50   Input ~ 0
SCL_5
Text HLabel 7550 4200 0    50   Input ~ 0
SDA_5
$Comp
L zephyrus_iaq:SN74lV4051A U6
U 1 1 5DB1D523
P 5800 3100
F 0 "U6" H 5800 3300 50  0000 C CNN
F 1 "MUX" H 5800 3200 50  0000 C CNB
F 2 "zephyrus-iaq:SOP65P640X120-16N" H 5800 3100 50  0001 C CNN
F 3 "" H 5800 3100 50  0001 C CNN
	1    5800 3100
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR0111
U 1 1 5DB2199F
P 7550 3950
F 0 "#PWR0111" H 7550 3700 50  0001 C CNN
F 1 "GND" H 7650 4050 50  0000 C CNN
F 2 "" H 7550 3950 50  0001 C CNN
F 3 "" H 7550 3950 50  0001 C CNN
	1    7550 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3700 7550 3800
Connection ~ 7550 3800
Wire Wire Line
	5200 3800 4800 3800
Wire Wire Line
	5200 3600 4800 3600
Wire Wire Line
	5200 3400 4800 3400
Wire Wire Line
	5200 4000 4800 4000
Wire Wire Line
	6400 4000 6800 4000
Wire Wire Line
	6400 3200 6800 3200
Wire Wire Line
	6400 4400 6800 4400
Wire Wire Line
	6400 4600 6800 4600
$Comp
L zephyrus_iaq:GND #PWR0113
U 1 1 5DB26E25
P 6800 4700
F 0 "#PWR0113" H 6800 4450 50  0001 C CNN
F 1 "GND" H 6805 4527 50  0000 C CNN
F 2 "" H 6800 4700 50  0001 C CNN
F 3 "" H 6800 4700 50  0001 C CNN
	1    6800 4700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6800 4400 6800 4600
Wire Wire Line
	6800 4700 6800 4600
Connection ~ 6800 4600
NoConn ~ 6400 3400
NoConn ~ 6400 3800
Connection ~ 7550 3900
Wire Wire Line
	7550 3900 7550 3950
Wire Wire Line
	7550 3800 7550 3900
Wire Wire Line
	7550 3700 7950 3700
Wire Wire Line
	7550 3800 7950 3800
Wire Wire Line
	7550 3900 7950 3900
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DAF9FB3
P 10100 3250
AR Path="/5DA09389/5DAF9FB3" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DAF9FB3" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 10100 3100 50  0001 C CNN
F 1 "+5V" H 10115 3423 50  0000 C CNN
F 2 "" H 10100 3250 50  0001 C CNN
F 3 "" H 10100 3250 50  0001 C CNN
	1    10100 3250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 3550 4050 3600
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB367C6
P 4050 3400
AR Path="/5DB367C6" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DB367C6" Ref="C12"  Part="1" 
AR Path="/5DA09389/5DB367C6" Ref="C?"  Part="1" 
F 0 "C12" H 3800 3450 50  0000 L CNN
F 1 "100nF" H 3700 3350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4088 3250 50  0001 C CNN
F 3 "~" H 4050 3400 50  0001 C CNN
	1    4050 3400
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB367CC
P 4050 3600
AR Path="/5DB367CC" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB367CC" Ref="#PWR068"  Part="1" 
AR Path="/5DA09389/5DB367CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR068" H 4050 3350 50  0001 C CNN
F 1 "GND" H 3900 3500 50  0000 C CNN
F 2 "" H 4050 3600 50  0001 C CNN
F 3 "" H 4050 3600 50  0001 C CNN
	1    4050 3600
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DB367D2
P 4050 3150
AR Path="/5DA09389/5DB367D2" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB367D2" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H 4050 3000 50  0001 C CNN
F 1 "+5V" H 4065 3323 50  0000 C CNN
F 2 "" H 4050 3150 50  0001 C CNN
F 3 "" H 4050 3150 50  0001 C CNN
	1    4050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3150 4050 3200
Connection ~ 4050 3200
Wire Wire Line
	4050 3200 4050 3250
Wire Wire Line
	7550 4100 7950 4100
Wire Wire Line
	7550 4200 7950 4200
$Comp
L zephyrus_iaq:Conn_01x01_Male J9
U 1 1 5DB74FAD
P 9450 3600
F 0 "J9" V 9500 3500 50  0000 C CNN
F 1 "Alert" V 9400 3600 50  0000 C CNB
F 2 "zephyrus-iaq:PinHeader_1x01_P2.54mm_Vertical" H 9450 3600 50  0001 C CNN
F 3 "" H 9450 3600 50  0001 C CNN
	1    9450 3600
	0    -1   1    0   
$EndComp
Text HLabel 4800 3400 0    50   Input ~ 0
ADC2
Text HLabel 4800 3600 0    50   Input ~ 0
ADC1
Text HLabel 4800 3800 0    50   Input ~ 0
ADC0
Text HLabel 4800 4000 0    50   Input ~ 0
ADC3
Text HLabel 6800 4000 2    50   Input ~ 0
ADC5
Text HLabel 6800 3200 2    50   Input ~ 0
ADC4
Text Label 4800 4200 0    50   ~ 0
MUL_A_5V
Text Label 4800 4600 0    50   ~ 0
MUL_C_5V
Text Label 4800 4400 0    50   ~ 0
MUL_B_5V
Wire Wire Line
	6400 4200 6800 4200
Wire Wire Line
	6800 4200 6800 4400
Connection ~ 6800 4400
$Comp
L zephyrus_iaq:R_US R10
U 1 1 5DB7485C
P 9750 3600
F 0 "R10" H 9500 3650 50  0000 L CNN
F 1 "10K" H 9500 3550 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9790 3590 50  0001 C CNN
F 3 "" H 9750 3600 50  0001 C CNN
	1    9750 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 3200 4050 3200
Text Notes 5500 2750 0    50   ~ 0
Multiplexer\n6:1 Analog Input to ADC\nChannels: A0 - A5\n
Text Notes 9000 3050 2    50   ~ 0
ADS1115\n16-bit ADC\n5 [V] I2C Interface
Wire Wire Line
	9350 4200 10100 4200
Wire Wire Line
	9350 3400 9750 3400
Text Notes 7450 4750 0    50   ~ 0
Software Driver:\nzephyrus-iaq/Software/third_party/Adafruit_I2C.py\nzephyrus-iaq/Software/third_party/Adafruit_ADS1x15.py
Text Notes 6300 4950 2    50   ~ 0
Software Driver:\nzephyrus-iaq/Software/HAT/IAQ_Mux.py
Text HLabel 7550 3400 0    50   Input ~ 0
SCL_5
Wire Wire Line
	7550 3400 7950 3400
Wire Wire Line
	3200 3550 3200 3600
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DA1879D
P 3200 3600
AR Path="/5DA1879D" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DA1879D" Ref="#PWR0114"  Part="1" 
AR Path="/5DA09389/5DA1879D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 3200 3350 50  0001 C CNN
F 1 "GND" H 3050 3500 50  0000 C CNN
F 2 "" H 3200 3600 50  0001 C CNN
F 3 "" H 3200 3600 50  0001 C CNN
	1    3200 3600
	-1   0    0    -1  
$EndComp
Text Notes 2450 3350 2    50   ~ 0
Raspberry Pi 3.3 [V] TTL\nShifted To\n Multiplexer 5 [V] CMOS.
Wire Wire Line
	2950 5100 2950 5250
NoConn ~ 1350 4800
NoConn ~ 2550 4900
NoConn ~ 1350 4900
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DA187A3
P 3200 3150
AR Path="/5DA09389/5DA187A3" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DA187A3" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 3200 3000 50  0001 C CNN
F 1 "+5V" H 3215 3323 50  0000 C CNN
F 2 "" H 3200 3150 50  0001 C CNN
F 3 "" H 3200 3150 50  0001 C CNN
	1    3200 3150
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5DA18797
P 3200 3400
AR Path="/5DA18797" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DA18797" Ref="C14"  Part="1" 
AR Path="/5DA09389/5DA18797" Ref="C?"  Part="1" 
F 0 "C14" H 2900 3450 50  0000 L CNN
F 1 "100nF" H 2850 3350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3238 3250 50  0001 C CNN
F 3 "~" H 3200 3400 50  0001 C CNN
	1    3200 3400
	-1   0    0    -1  
$EndComp
Text Label 2950 4600 2    50   ~ 0
MUL_C_5V
Text Label 2950 4300 2    50   ~ 0
MUL_B_5V
Text Label 2950 4000 2    50   ~ 0
MUL_A_5V
$Comp
L zephyrus_iaq:GND #PWR0117
U 1 1 5DA136A6
P 2950 5250
F 0 "#PWR0117" H 2950 5000 50  0001 C CNN
F 1 "GND" H 2955 5077 50  0000 C CNN
F 2 "" H 2950 5250 50  0001 C CNN
F 3 "" H 2950 5250 50  0001 C CNN
	1    2950 5250
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR0133
U 1 1 5DA08CD6
P 950 4500
F 0 "#PWR0133" H 950 4250 50  0001 C CNN
F 1 "GND" V 955 4327 50  0000 C CNN
F 2 "" H 950 4500 50  0001 C CNN
F 3 "" H 950 4500 50  0001 C CNN
	1    950  4500
	0    1    1    0   
$EndComp
$Comp
L zephyrus_iaq:GND #PWR0134
U 1 1 5DA0782E
P 950 4200
F 0 "#PWR0134" H 950 3950 50  0001 C CNN
F 1 "GND" V 955 4027 50  0000 C CNN
F 2 "" H 950 4200 50  0001 C CNN
F 3 "" H 950 4200 50  0001 C CNN
	1    950  4200
	0    1    1    0   
$EndComp
$Comp
L zephyrus_iaq:GND #PWR0135
U 1 1 5DA06364
P 950 3900
F 0 "#PWR0135" H 950 3650 50  0001 C CNN
F 1 "GND" V 955 3727 50  0000 C CNN
F 2 "" H 950 3900 50  0001 C CNN
F 3 "" H 950 3900 50  0001 C CNN
	1    950  3900
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 5100 2550 5100
Wire Wire Line
	1350 4500 950  4500
Wire Wire Line
	1350 4200 950  4200
Wire Wire Line
	1350 3900 950  3900
$Comp
L zephyrus_iaq:SN74LV4T125PWR U8
U 1 1 5D9F68B4
P 1950 4400
F 0 "U8" H 1950 5367 50  0000 C CNN
F 1 "V-Shift" H 1950 5276 50  0000 C CNB
F 2 "zephyrus-iaq:SOP65P640X120-14N" H 1950 4400 50  0001 L BNN
F 3 "" H 1950 4400 50  0001 L BNN
	1    1950 4400
	1    0    0    -1  
$EndComp
Text HLabel 950  4600 0    50   Input ~ 0
MUL_C
Text HLabel 950  4300 0    50   Input ~ 0
MUL_B
Text HLabel 950  4000 0    50   Input ~ 0
MUL_A
Wire Wire Line
	1350 4600 950  4600
Wire Wire Line
	1350 4300 950  4300
Wire Wire Line
	1350 4000 950  4000
Wire Wire Line
	3200 3150 3200 3200
Wire Wire Line
	9450 3800 9350 3800
Wire Wire Line
	9750 3450 9750 3400
Connection ~ 9750 3400
Wire Wire Line
	9750 3400 10100 3400
Wire Wire Line
	9750 3750 9750 3800
Wire Wire Line
	9750 3800 9450 3800
Connection ~ 9450 3800
Wire Wire Line
	7950 3600 6400 3600
Wire Wire Line
	5200 4200 3800 4200
Wire Wire Line
	3800 4000 2550 4000
Wire Wire Line
	5200 4400 3700 4400
Wire Wire Line
	3700 4300 2550 4300
Wire Wire Line
	3800 4000 3800 4200
Wire Wire Line
	3700 4300 3700 4400
Wire Wire Line
	5200 4600 2550 4600
Wire Wire Line
	3200 3200 2550 3200
Wire Wire Line
	2550 3200 2550 3700
Connection ~ 3200 3200
Wire Wire Line
	3200 3200 3200 3250
Text Notes 7900 3300 2    50   ~ 0
Address: 0x4B
Wire Wire Line
	10100 3400 10100 3650
Wire Wire Line
	10100 3950 10100 4200
Wire Wire Line
	10100 4200 10100 4350
Connection ~ 10100 4200
Wire Wire Line
	10100 3250 10100 3400
Connection ~ 10100 3400
$Comp
L cc-by-sa:LOGO #G2
U 1 1 5DD4B434
P 5350 7550
F 0 "#G2" H 5350 7287 60  0001 C CNN
F 1 "LOGO" H 5350 7813 60  0001 C CNN
F 2 "" H 5350 7550 50  0001 C CNN
F 3 "" H 5350 7550 50  0001 C CNN
	1    5350 7550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
