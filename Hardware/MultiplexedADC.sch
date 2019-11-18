EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
P 8950 3000
F 0 "U7" H 8950 3667 50  0000 C CNN
F 1 "ADC" H 8950 3576 50  0000 C CNB
F 2 "zephyrus-iaq:SOP50P490X110-10N" H 8650 4100 50  0001 L BNN
F 3 "MSOP-10 Texas Instruments" H 8500 3800 50  0001 L BNN
F 4 "Texas Instruments" H 8700 3900 50  0001 L BNN "Field4"
F 5 "16-Bit ADC with Integrated MUX, PGA, Comparator, Oscillator, and Reference 10-VSSOP -40 to 125" H 7500 3650 50  0001 L BNN "Field5"
F 6 "ADS1115IDGSR" H 8750 4000 50  0001 L BNN "Field7"
	1    8950 3000
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5DAF9FBB
P 10400 3200
AR Path="/5DAF9FBB" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DAF9FBB" Ref="C11"  Part="1" 
AR Path="/5DA09389/5DAF9FBB" Ref="C?"  Part="1" 
F 0 "C11" H 10150 3250 50  0000 L CNN
F 1 "100nF" H 10050 3150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10438 3050 50  0001 C CNN
F 3 "~" H 10400 3200 50  0001 C CNN
	1    10400 3200
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DAF9FC1
P 10400 3800
AR Path="/5DAF9FC1" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DAF9FC1" Ref="#PWR067"  Part="1" 
AR Path="/5DA09389/5DAF9FC1" Ref="#PWR?"  Part="1" 
F 0 "#PWR067" H 10400 3550 50  0001 C CNN
F 1 "GND" H 10500 3700 50  0000 C CNN
F 2 "" H 10400 3800 50  0001 C CNN
F 3 "" H 10400 3800 50  0001 C CNN
	1    10400 3800
	-1   0    0    -1  
$EndComp
Text HLabel 7850 3300 0    50   Input ~ 0
SCL_5
Text HLabel 7850 3400 0    50   Input ~ 0
SDA_5
$Comp
L zephyrus_iaq:SN74lV4051A U6
U 1 1 5DB1D523
P 6100 2300
F 0 "U6" H 6100 2500 50  0000 C CNN
F 1 "MUX" H 6100 2400 50  0000 C CNB
F 2 "zephyrus-iaq:SOP65P640X120-16N" H 6100 2300 50  0001 C CNN
F 3 "" H 6100 2300 50  0001 C CNN
	1    6100 2300
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR0111
U 1 1 5DB2199F
P 7850 3150
F 0 "#PWR0111" H 7850 2900 50  0001 C CNN
F 1 "GND" H 7950 3250 50  0000 C CNN
F 2 "" H 7850 3150 50  0001 C CNN
F 3 "" H 7850 3150 50  0001 C CNN
	1    7850 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2900 7850 3000
Connection ~ 7850 3000
Wire Wire Line
	5500 3000 5100 3000
Wire Wire Line
	5500 2800 5100 2800
Wire Wire Line
	5500 2600 5100 2600
Wire Wire Line
	5500 3200 5100 3200
Wire Wire Line
	6700 3200 7100 3200
Wire Wire Line
	6700 2400 7100 2400
Wire Wire Line
	6700 3600 7100 3600
Wire Wire Line
	6700 3800 7100 3800
$Comp
L zephyrus_iaq:GND #PWR0113
U 1 1 5DB26E25
P 7100 3900
F 0 "#PWR0113" H 7100 3650 50  0001 C CNN
F 1 "GND" H 7105 3727 50  0000 C CNN
F 2 "" H 7100 3900 50  0001 C CNN
F 3 "" H 7100 3900 50  0001 C CNN
	1    7100 3900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7100 3600 7100 3800
Wire Wire Line
	7100 3900 7100 3800
Connection ~ 7100 3800
NoConn ~ 6700 2600
NoConn ~ 6700 3000
Connection ~ 7850 3100
Wire Wire Line
	7850 3100 7850 3150
Wire Wire Line
	7850 3000 7850 3100
Wire Wire Line
	7850 2900 8250 2900
Wire Wire Line
	7850 3000 8250 3000
Wire Wire Line
	7850 3100 8250 3100
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DAF9FB3
P 10400 2350
AR Path="/5DA09389/5DAF9FB3" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DAF9FB3" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 10400 2200 50  0001 C CNN
F 1 "+5V" H 10415 2523 50  0000 C CNN
F 2 "" H 10400 2350 50  0001 C CNN
F 3 "" H 10400 2350 50  0001 C CNN
	1    10400 2350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4350 2750 4350 2800
$Comp
L zephyrus_iaq:C C?
U 1 1 5DB367C6
P 4350 2600
AR Path="/5DB367C6" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DB367C6" Ref="C12"  Part="1" 
AR Path="/5DA09389/5DB367C6" Ref="C?"  Part="1" 
F 0 "C12" H 4100 2650 50  0000 L CNN
F 1 "100nF" H 4000 2550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4388 2450 50  0001 C CNN
F 3 "~" H 4350 2600 50  0001 C CNN
	1    4350 2600
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DB367CC
P 4350 2800
AR Path="/5DB367CC" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB367CC" Ref="#PWR068"  Part="1" 
AR Path="/5DA09389/5DB367CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR068" H 4350 2550 50  0001 C CNN
F 1 "GND" H 4200 2700 50  0000 C CNN
F 2 "" H 4350 2800 50  0001 C CNN
F 3 "" H 4350 2800 50  0001 C CNN
	1    4350 2800
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DB367D2
P 4350 2350
AR Path="/5DA09389/5DB367D2" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DB367D2" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H 4350 2200 50  0001 C CNN
F 1 "+5V" H 4365 2523 50  0000 C CNN
F 2 "" H 4350 2350 50  0001 C CNN
F 3 "" H 4350 2350 50  0001 C CNN
	1    4350 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2350 4350 2400
Connection ~ 4350 2400
Wire Wire Line
	4350 2400 4350 2450
Wire Wire Line
	7850 3300 8250 3300
Wire Wire Line
	7850 3400 8250 3400
$Comp
L zephyrus_iaq:Conn_01x01_Male J9
U 1 1 5DB74FAD
P 9750 2800
F 0 "J9" V 9800 2700 50  0000 C CNN
F 1 "Alert" V 9700 2800 50  0000 C CNB
F 2 "zephyrus-iaq:PinHeader_1x01_P2.54mm_Vertical" H 9750 2800 50  0001 C CNN
F 3 "" H 9750 2800 50  0001 C CNN
	1    9750 2800
	0    -1   1    0   
$EndComp
Text HLabel 5100 2600 0    50   Input ~ 0
ADC2
Text HLabel 5100 2800 0    50   Input ~ 0
ADC1
Text HLabel 5100 3000 0    50   Input ~ 0
ADC0
Text HLabel 5100 3200 0    50   Input ~ 0
ADC3
Text HLabel 7100 3200 2    50   Input ~ 0
ADC5
Text HLabel 7100 2400 2    50   Input ~ 0
ADC4
Text Label 5100 3400 0    50   ~ 0
MUL_A_5V
Text Label 5100 3800 0    50   ~ 0
MUL_C_5V
Text Label 5100 3600 0    50   ~ 0
MUL_B_5V
Wire Wire Line
	6700 3400 7100 3400
Wire Wire Line
	7100 3400 7100 3600
Connection ~ 7100 3600
$Comp
L zephyrus_iaq:R_US R10
U 1 1 5DB7485C
P 10050 2800
F 0 "R10" H 9800 2850 50  0000 L CNN
F 1 "10K" H 9800 2750 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10090 2790 50  0001 C CNN
F 3 "" H 10050 2800 50  0001 C CNN
	1    10050 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5500 2400 4350 2400
Text Notes 5800 1950 0    50   ~ 0
Multiplexer\n6:1 Analog Input to ADC\nChannels: A0 - A5\n
Text Notes 9300 2250 2    50   ~ 0
ADS1115\n16-bit ADC\n5 [V] I2C Interface\nAddress: 0x4B
Wire Wire Line
	9650 3400 10400 3400
Wire Wire Line
	10400 3400 10400 3800
Wire Wire Line
	9650 2600 10050 2600
Wire Wire Line
	10400 2350 10400 2600
Wire Wire Line
	10400 3350 10400 3400
Connection ~ 10400 3400
Connection ~ 10400 2600
Wire Wire Line
	10400 2600 10400 3050
Text Notes 7750 3950 0    50   ~ 0
Software Driver:\nzephyrus-iaq/Software/third_party/Adafruit_I2C.py\nzephyrus-iaq/Software/third_party/Adafruit_ADS1x15.py
Text Notes 6600 4150 2    50   ~ 0
Software Driver:\nzephyrus-iaq/Software/HAT/IAQ_Mux.py
Text HLabel 7850 2600 0    50   Input ~ 0
SCL_5
Wire Wire Line
	7850 2600 8250 2600
Wire Wire Line
	3500 2750 3500 2800
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5DA1879D
P 3500 2800
AR Path="/5DA1879D" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DA1879D" Ref="#PWR0114"  Part="1" 
AR Path="/5DA09389/5DA1879D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 3500 2550 50  0001 C CNN
F 1 "GND" H 3350 2700 50  0000 C CNN
F 2 "" H 3500 2800 50  0001 C CNN
F 3 "" H 3500 2800 50  0001 C CNN
	1    3500 2800
	-1   0    0    -1  
$EndComp
Text Notes 2750 2550 2    50   ~ 0
Raspberry Pi 3.3 [V] TTL\nShifted To\n Multiplexer 5 [V] CMOS.
Wire Wire Line
	3250 4300 3250 4450
NoConn ~ 1650 4000
NoConn ~ 2850 4100
NoConn ~ 1650 4100
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5DA187A3
P 3500 2350
AR Path="/5DA09389/5DA187A3" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5DA187A3" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 3500 2200 50  0001 C CNN
F 1 "+5V" H 3515 2523 50  0000 C CNN
F 2 "" H 3500 2350 50  0001 C CNN
F 3 "" H 3500 2350 50  0001 C CNN
	1    3500 2350
	-1   0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5DA18797
P 3500 2600
AR Path="/5DA18797" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5DA18797" Ref="C14"  Part="1" 
AR Path="/5DA09389/5DA18797" Ref="C?"  Part="1" 
F 0 "C14" H 3200 2650 50  0000 L CNN
F 1 "100nF" H 3150 2550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3538 2450 50  0001 C CNN
F 3 "~" H 3500 2600 50  0001 C CNN
	1    3500 2600
	-1   0    0    -1  
$EndComp
Text Label 3250 3800 2    50   ~ 0
MUL_C_5V
Text Label 3250 3500 2    50   ~ 0
MUL_B_5V
Text Label 3250 3200 2    50   ~ 0
MUL_A_5V
$Comp
L zephyrus_iaq:GND #PWR0117
U 1 1 5DA136A6
P 3250 4450
F 0 "#PWR0117" H 3250 4200 50  0001 C CNN
F 1 "GND" H 3255 4277 50  0000 C CNN
F 2 "" H 3250 4450 50  0001 C CNN
F 3 "" H 3250 4450 50  0001 C CNN
	1    3250 4450
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR0133
U 1 1 5DA08CD6
P 1250 3700
F 0 "#PWR0133" H 1250 3450 50  0001 C CNN
F 1 "GND" V 1255 3527 50  0000 C CNN
F 2 "" H 1250 3700 50  0001 C CNN
F 3 "" H 1250 3700 50  0001 C CNN
	1    1250 3700
	0    1    1    0   
$EndComp
$Comp
L zephyrus_iaq:GND #PWR0134
U 1 1 5DA0782E
P 1250 3400
F 0 "#PWR0134" H 1250 3150 50  0001 C CNN
F 1 "GND" V 1255 3227 50  0000 C CNN
F 2 "" H 1250 3400 50  0001 C CNN
F 3 "" H 1250 3400 50  0001 C CNN
	1    1250 3400
	0    1    1    0   
$EndComp
$Comp
L zephyrus_iaq:GND #PWR0135
U 1 1 5DA06364
P 1250 3100
F 0 "#PWR0135" H 1250 2850 50  0001 C CNN
F 1 "GND" V 1255 2927 50  0000 C CNN
F 2 "" H 1250 3100 50  0001 C CNN
F 3 "" H 1250 3100 50  0001 C CNN
	1    1250 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 4300 2850 4300
Wire Wire Line
	1650 3700 1250 3700
Wire Wire Line
	1650 3400 1250 3400
Wire Wire Line
	1650 3100 1250 3100
$Comp
L zephyrus_iaq:SN74LV4T125PWR U8
U 1 1 5D9F68B4
P 2250 3600
F 0 "U8" H 2250 4567 50  0000 C CNN
F 1 "V-Shift" H 2250 4476 50  0000 C CNB
F 2 "zephyrus-iaq:SOP65P640X120-14N" H 2250 3600 50  0001 L BNN
F 3 "" H 2250 3600 50  0001 L BNN
	1    2250 3600
	1    0    0    -1  
$EndComp
Text HLabel 1250 3800 0    50   Input ~ 0
MUL_C
Text HLabel 1250 3500 0    50   Input ~ 0
MUL_B
Text HLabel 1250 3200 0    50   Input ~ 0
MUL_A
Wire Wire Line
	1650 3800 1250 3800
Wire Wire Line
	1650 3500 1250 3500
Wire Wire Line
	1650 3200 1250 3200
Wire Wire Line
	3500 2350 3500 2450
Wire Wire Line
	9750 3000 9650 3000
Wire Wire Line
	10050 2650 10050 2600
Connection ~ 10050 2600
Wire Wire Line
	10050 2600 10400 2600
Wire Wire Line
	10050 2950 10050 3000
Wire Wire Line
	10050 3000 9750 3000
Connection ~ 9750 3000
Wire Wire Line
	8250 2800 6700 2800
Wire Wire Line
	5500 3400 4100 3400
Wire Wire Line
	4100 3200 2850 3200
Wire Wire Line
	5500 3600 4000 3600
Wire Wire Line
	4000 3500 2850 3500
Wire Wire Line
	4100 3200 4100 3400
Wire Wire Line
	4000 3500 4000 3600
Wire Wire Line
	3500 2450 2850 2450
Wire Wire Line
	2850 2450 2850 2900
Connection ~ 3500 2450
Wire Wire Line
	5500 3800 2850 3800
$EndSCHEMATC
