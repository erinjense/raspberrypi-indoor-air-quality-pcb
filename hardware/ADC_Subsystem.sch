EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L zephyrus_iaq:SN74LV4T125PWR U?
U 1 1 5D9C2151
P 4200 3350
AR Path="/5D9C2151" Ref="U?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2151" Ref="U7"  Part="1" 
F 0 "U7" H 4200 4317 50  0000 C CNN
F 1 "SN74LV4T125PWR" H 4200 4226 50  0000 C CNN
F 2 "SN74LV4T125PWR:SOP65P640X120-14N" H 4200 3350 50  0001 L BNN
F 3 "" H 4200 3350 50  0001 L BNN
	1    4200 3350
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5D9C2158
P 3150 3900
AR Path="/5D9C2158" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2158" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 3150 3650 50  0001 C CNN
F 1 "GND" H 3155 3727 50  0000 C CNN
F 2 "" H 3150 3900 50  0001 C CNN
F 3 "" H 3150 3900 50  0001 C CNN
	1    3150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2850 3600 2850
Wire Wire Line
	3600 3150 3150 3150
Connection ~ 3150 3150
Wire Wire Line
	3150 3150 3150 2850
Wire Wire Line
	3600 3450 3150 3450
Connection ~ 3150 3450
Wire Wire Line
	3150 3450 3150 3150
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5D9C216A
P 4800 4050
AR Path="/5D9C216A" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5D9C216A" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 4800 3800 50  0001 C CNN
F 1 "GND" H 4805 3877 50  0000 C CNN
F 2 "" H 4800 4050 50  0001 C CNN
F 3 "" H 4800 4050 50  0001 C CNN
	1    4800 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3450 3150 3750
Wire Wire Line
	3600 3750 3150 3750
Connection ~ 3150 3750
Wire Wire Line
	3150 3750 3150 3900
Text Notes 3700 2300 0    50   ~ 10
3.3V to 5V Logic Conversion
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5D9C2175
P 5550 2600
AR Path="/5D9C2175" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2175" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 5550 2450 50  0001 C CNN
F 1 "+5V" H 5565 2773 50  0000 C CNN
F 2 "" H 5550 2600 50  0001 C CNN
F 3 "" H 5550 2600 50  0001 C CNN
	1    5550 2600
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5D9C217B
P 5550 3050
AR Path="/5D9C217B" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5D9C217B" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 5550 2800 50  0001 C CNN
F 1 "GND" H 5650 2950 50  0000 C CNN
F 2 "" H 5550 3050 50  0001 C CNN
F 3 "" H 5550 3050 50  0001 C CNN
	1    5550 3050
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5D9C2181
P 5400 2850
AR Path="/5D9C2181" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2181" Ref="C9"  Part="1" 
F 0 "C9" H 5150 2950 50  0000 L CNN
F 1 "100nF" H 5050 2850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5438 2700 50  0001 C CNN
F 3 "~" H 5400 2850 50  0001 C CNN
	1    5400 2850
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5D9C2188
P 5700 2850
AR Path="/5D9C2188" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2188" Ref="C10"  Part="1" 
F 0 "C10" H 5900 2950 50  0000 L CNN
F 1 "10uF" H 5850 2850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5738 2700 50  0001 C CNN
F 3 "~" H 5700 2850 50  0001 C CNN
	1    5700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3000 5400 3050
Wire Wire Line
	5700 3050 5700 3000
Wire Wire Line
	5400 2700 5400 2650
Wire Wire Line
	5400 2650 5550 2650
Wire Wire Line
	5700 2650 5700 2700
Wire Wire Line
	5550 2650 5550 2600
Wire Wire Line
	5400 2650 4800 2650
Connection ~ 5550 2650
Wire Wire Line
	5550 2650 5700 2650
$Comp
L zephyrus_iaq:R_US R?
U 1 1 5D9C25F7
P 8150 3550
AR Path="/5D9C25F7" Ref="R?"  Part="1" 
AR Path="/5D9BB3B6/5D9C25F7" Ref="R15"  Part="1" 
F 0 "R15" H 8218 3596 50  0000 L CNN
F 1 "270" H 8218 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8190 3540 50  0001 C CNN
F 3 "~" H 8150 3550 50  0001 C CNN
	1    8150 3550
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:+5V #PWR?
U 1 1 5D9C2605
P 6050 3550
AR Path="/5D9C2605" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2605" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 6050 3400 50  0001 C CNN
F 1 "+5V" H 6050 3700 50  0000 C CNN
F 2 "" H 6050 3550 50  0001 C CNN
F 3 "" H 6050 3550 50  0001 C CNN
	1    6050 3550
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:MCP3008T-I_SL U?
U 1 1 5D9C260B
P 7350 3100
AR Path="/5D9C260B" Ref="U?"  Part="1" 
AR Path="/5D9BB3B6/5D9C260B" Ref="U6"  Part="1" 
F 0 "U6" H 7350 3970 50  0000 C CNN
F 1 "MCP3008T-I_SL" H 7350 3879 50  0000 C CNN
F 2 "MCP3008T-I_SL:SOIC127P600X175-16N" H 7350 3100 50  0001 L BNN
F 3 "" H 7350 3100 50  0001 L BNN
	1    7350 3100
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5D9C2612
P 6550 4000
AR Path="/5D9C2612" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2612" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 6550 3750 50  0001 C CNN
F 1 "GND" H 6555 3827 50  0000 C CNN
F 2 "" H 6550 4000 50  0001 C CNN
F 3 "" H 6550 4000 50  0001 C CNN
	1    6550 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3800 6550 3900
Text Notes 6800 2150 0    50   ~ 10
Analog to Digital Converter
$Comp
L zephyrus_iaq:GND #PWR?
U 1 1 5D9C261B
P 8150 4050
AR Path="/5D9C261B" Ref="#PWR?"  Part="1" 
AR Path="/5D9BB3B6/5D9C261B" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 8150 3800 50  0001 C CNN
F 1 "GND" H 8155 3877 50  0000 C CNN
F 2 "" H 8150 4050 50  0001 C CNN
F 3 "" H 8150 4050 50  0001 C CNN
	1    8150 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4000 8150 4050
$Comp
L zephyrus_iaq:D_Zener D?
U 1 1 5D9C2622
P 8150 3850
AR Path="/5D9C2622" Ref="D?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2622" Ref="D11"  Part="1" 
F 0 "D11" V 8104 3929 50  0000 L CNN
F 1 "1N4728A_3.3V_100uA" V 8195 3929 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 8150 3850 50  0001 C CNN
F 3 "~" H 8150 3850 50  0001 C CNN
	1    8150 3850
	0    1    1    0   
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5D9C2629
P 5900 3800
AR Path="/5D9C2629" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2629" Ref="C11"  Part="1" 
F 0 "C11" H 5700 3850 50  0000 L CNN
F 1 "10uF" H 5650 3700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5938 3650 50  0001 C CNN
F 3 "~" H 5900 3800 50  0001 C CNN
	1    5900 3800
	1    0    0    -1  
$EndComp
$Comp
L zephyrus_iaq:C C?
U 1 1 5D9C2630
P 6200 3800
AR Path="/5D9C2630" Ref="C?"  Part="1" 
AR Path="/5D9BB3B6/5D9C2630" Ref="C12"  Part="1" 
F 0 "C12" H 6315 3846 50  0000 L CNN
F 1 "100nF" H 6315 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6238 3650 50  0001 C CNN
F 3 "~" H 6200 3800 50  0001 C CNN
	1    6200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3650 5900 3600
Wire Wire Line
	5900 3600 6050 3600
Wire Wire Line
	6200 3600 6200 3650
Wire Wire Line
	5900 3950 5900 4000
Wire Wire Line
	5900 4000 6200 4000
Wire Wire Line
	6200 4000 6200 3950
Wire Wire Line
	6550 3900 6550 4000
Connection ~ 6550 3900
Wire Wire Line
	6200 4000 6550 4000
Connection ~ 6200 4000
Wire Wire Line
	6050 3550 6050 3600
Connection ~ 6050 3600
Wire Wire Line
	6050 3600 6200 3600
Text HLabel 3600 2950 0    50   Input ~ 0
MOSI_3.3
Text HLabel 3600 3250 0    50   Input ~ 0
SCK_3.3
Text HLabel 8150 3700 2    50   Input ~ 0
MISO_3.3
Text Label 8150 3000 0    50   ~ 0
~CE~_5
Text Label 8150 2800 0    50   ~ 0
SCK_5
Text HLabel 6550 2700 0    50   Input ~ 0
ADC0
Text HLabel 6550 2800 0    50   Input ~ 0
ADC1
Text HLabel 6550 2900 0    50   Input ~ 0
ADC2
Text HLabel 6550 3000 0    50   Input ~ 0
ADC3
Text HLabel 6550 3100 0    50   Input ~ 0
ADC4
Text HLabel 6550 3200 0    50   Input ~ 0
ADC5
Text Label 6550 2600 2    50   ~ 0
MOSI_5
Text Label 4800 2950 0    50   ~ 0
MOSI_5
Text Label 4800 3250 0    50   ~ 0
SCK_5
Text Label 4800 3550 0    50   ~ 0
~CE~_5
Text HLabel 3600 3550 0    50   Input ~ 0
~CE~_3.3
NoConn ~ 6550 3300
NoConn ~ 6550 3400
Wire Wire Line
	6550 3600 6550 3700
Wire Wire Line
	6200 3600 6550 3600
Connection ~ 6200 3600
Connection ~ 6550 3600
Connection ~ 5400 2650
Wire Wire Line
	5400 3050 5700 3050
$EndSCHEMATC
