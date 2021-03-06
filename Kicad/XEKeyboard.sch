EESchema Schematic File Version 2
LIBS:XEKeyboard-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Parts
LIBS:XEKeyboard-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Atari 8-bit USB keyboard interface"
Date "2018-02-07"
Rev ""
Comp "Bob Green"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Crystal Y1
U 1 1 5A76F417
P 2050 3150
F 0 "Y1" H 2050 3300 50  0000 C CNN
F 1 "12MHz" H 2050 3000 50  0000 C CNN
F 2 "Crystals:Crystal_SMD_5032-2pin_5.0x3.2mm_HandSoldering" H 2050 3150 50  0001 C CNN
F 3 "" H 2050 3150 50  0001 C CNN
	1    2050 3150
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5A76F462
P 1850 3500
F 0 "C2" H 1875 3600 50  0000 L CNN
F 1 "18pF" H 1875 3400 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 1888 3350 50  0001 C CNN
F 3 "" H 1850 3500 50  0001 C CNN
	1    1850 3500
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 5A76F497
P 2250 3500
F 0 "C4" H 2275 3600 50  0000 L CNN
F 1 "18pF" H 2275 3400 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 2288 3350 50  0001 C CNN
F 3 "" H 2250 3500 50  0001 C CNN
	1    2250 3500
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5A76F4C8
P 4900 7200
F 0 "C3" H 4925 7300 50  0000 L CNN
F 1 "0.1uF" H 4925 7100 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 4938 7050 50  0001 C CNN
F 3 "" H 4900 7200 50  0001 C CNN
	1    4900 7200
	1    0    0    -1  
$EndComp
$Comp
L CP C7
U 1 1 5A76FD36
P 5250 7200
F 0 "C7" H 5275 7300 50  0000 L CNN
F 1 "10uF" H 5275 7100 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D8.0mm_P5.00mm" H 5288 7050 50  0001 C CNN
F 3 "" H 5250 7200 50  0001 C CNN
	1    5250 7200
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328-AU U1
U 1 1 5A78642C
P 2350 5800
F 0 "U1" H 1600 7050 50  0000 L BNN
F 1 "ATMEGA328-AU" H 2750 4400 50  0000 L BNN
F 2 "Housings_SSOP:TSOP-II-32_21.0x10.2mm_Pitch1.27mm" H 2350 5800 50  0001 C CIN
F 3 "" H 2350 5800 50  0001 C CNN
	1    2350 5800
	1    0    0    -1  
$EndComp
$Comp
L 7805 U3
U 1 1 5A7874D0
P 5800 7000
F 0 "U3" H 5950 6804 50  0000 C CNN
F 1 "AMS1117" H 5800 7200 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70_Handsoldering" H 5800 7000 50  0001 C CNN
F 3 "" H 5800 7000 50  0001 C CNN
	1    5800 7000
	1    0    0    -1  
$EndComp
$Comp
L max3421e U2
U 1 1 5A7B1264
P 3200 2550
F 0 "U2" H 2550 3600 60  0000 C CNN
F 1 "max3421e" H 3650 1400 60  0000 C CNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 5100 1800 60  0001 C CNN
F 3 "" H 5100 1800 60  0001 C CNN
	1    3200 2550
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X05 J1
U 1 1 5A7B14DD
P 1350 2750
F 0 "J1" H 1350 3050 50  0000 C CNN
F 1 "USB" H 1350 2450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 1350 1550 50  0001 C CNN
F 3 "" H 1350 1550 50  0001 C CNN
	1    1350 2750
	1    0    0    -1  
$EndComp
NoConn ~ 1600 2550
NoConn ~ 1600 2650
NoConn ~ 1600 2750
NoConn ~ 1600 2850
NoConn ~ 1600 2950
NoConn ~ 1100 2950
$Comp
L R R1
U 1 1 5A7B2176
P 600 2400
F 0 "R1" V 680 2400 50  0000 C CNN
F 1 "33R" V 600 2400 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 530 2400 50  0001 C CNN
F 3 "" H 600 2400 50  0001 C CNN
	1    600  2400
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5A7B21B1
P 800 2300
F 0 "R2" V 880 2300 50  0000 C CNN
F 1 "33R" V 800 2300 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 730 2300 50  0001 C CNN
F 3 "" H 800 2300 50  0001 C CNN
	1    800  2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5A7B33E1
P 2050 3800
F 0 "#PWR01" H 2050 3550 50  0001 C CNN
F 1 "GND" H 2050 3650 50  0000 C CNN
F 2 "" H 2050 3800 50  0001 C CNN
F 3 "" H 2050 3800 50  0001 C CNN
	1    2050 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5A7B3A93
P 3200 3950
F 0 "#PWR02" H 3200 3700 50  0001 C CNN
F 1 "GND" H 3200 3800 50  0000 C CNN
F 2 "" H 3200 3950 50  0001 C CNN
F 3 "" H 3200 3950 50  0001 C CNN
	1    3200 3950
	1    0    0    -1  
$EndComp
NoConn ~ 4100 1850
NoConn ~ 4100 1950
NoConn ~ 4100 2050
NoConn ~ 4100 2150
NoConn ~ 4100 2250
NoConn ~ 4100 2350
NoConn ~ 4100 2450
NoConn ~ 4100 2550
NoConn ~ 4100 2750
NoConn ~ 4100 2850
NoConn ~ 4100 2950
NoConn ~ 4100 3050
NoConn ~ 4100 3150
NoConn ~ 4100 3250
NoConn ~ 4100 3350
NoConn ~ 4100 3450
Text Label 3650 4900 2    60   ~ 0
~SS
Text Label 4450 4350 2    60   ~ 0
MOSI
Text Label 4100 4700 2    60   ~ 0
MISO
Text Label 4250 5200 2    60   ~ 0
SCLK
Text Label 3650 5550 2    60   ~ 0
K0
Text Label 3650 5650 2    60   ~ 0
K1
Text Label 3650 5750 2    60   ~ 0
K2
Text Label 3650 5850 2    60   ~ 0
K3
Text Label 3650 5950 2    60   ~ 0
K4
Text Label 3650 6050 2    60   ~ 0
K5
Text Label 3650 4800 2    60   ~ 0
USBINT
Text Label 3650 6300 2    60   ~ 0
RXD
Text Label 3650 6400 2    60   ~ 0
TXD
Text Label 3650 6500 2    60   ~ 0
~KR1
Text Label 3650 6600 2    60   ~ 0
~KR2
Text Label 3900 6700 2    60   ~ 0
~START
Text Label 3900 6800 2    60   ~ 0
~SELECT
Text Label 3900 6900 2    60   ~ 0
~OPTION
Text Label 3700 7000 2    60   ~ 0
~A8RES
Text Label 7400 2000 2    60   ~ 0
K0
Text Label 7400 2100 2    60   ~ 0
K1
Text Label 7400 2200 2    60   ~ 0
K2
Text Label 7400 2300 2    60   ~ 0
K3
Text Label 7400 2400 2    60   ~ 0
K4
Text Label 7400 2500 2    60   ~ 0
K5
Text Label 7400 2700 2    60   ~ 0
~KR1
Text Label 7400 2800 2    60   ~ 0
~KR2
$Comp
L CP C8
U 1 1 5A7B8FE3
P 6350 7200
F 0 "C8" H 6375 7300 50  0000 L CNN
F 1 "10uF" H 6375 7100 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D8.0mm_P5.00mm" H 6388 7050 50  0001 C CNN
F 3 "" H 6350 7200 50  0001 C CNN
	1    6350 7200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR03
U 1 1 5A7B914D
P 5100 6850
F 0 "#PWR03" H 5100 6700 50  0001 C CNN
F 1 "+5V" H 5100 6990 50  0000 C CNN
F 2 "" H 5100 6850 50  0001 C CNN
F 3 "" H 5100 6850 50  0001 C CNN
	1    5100 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5A7B917B
P 5100 7500
F 0 "#PWR04" H 5100 7250 50  0001 C CNN
F 1 "GND" H 5100 7350 50  0000 C CNN
F 2 "" H 5100 7500 50  0001 C CNN
F 3 "" H 5100 7500 50  0001 C CNN
	1    5100 7500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR05
U 1 1 5A7B9307
P 6500 6850
F 0 "#PWR05" H 6500 6700 50  0001 C CNN
F 1 "+3.3V" H 6500 6990 50  0000 C CNN
F 2 "" H 6500 6850 50  0001 C CNN
F 3 "" H 6500 6850 50  0001 C CNN
	1    6500 6850
	1    0    0    -1  
$EndComp
$Comp
L POKEY U4
U 1 1 5A7BBC7C
P 6350 2250
F 0 "U4" H 5950 3550 60  0000 C CNN
F 1 "POKEY" H 6650 950 60  0000 C CNN
F 2 "Housings_DIP:DIP-40_W15.24mm_Socket_LongPads" H 6250 2750 60  0001 C CNN
F 3 "" H 6250 2750 60  0001 C CNN
	1    6350 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5A7BBF68
P 6250 3800
F 0 "#PWR06" H 6250 3550 50  0001 C CNN
F 1 "GND" H 6250 3650 50  0000 C CNN
F 2 "" H 6250 3800 50  0001 C CNN
F 3 "" H 6250 3800 50  0001 C CNN
	1    6250 3800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR07
U 1 1 5A7BC112
P 6250 700
F 0 "#PWR07" H 6250 550 50  0001 C CNN
F 1 "+5V" H 6250 840 50  0000 C CNN
F 2 "" H 6250 700 50  0001 C CNN
F 3 "" H 6250 700 50  0001 C CNN
	1    6250 700 
	1    0    0    -1  
$EndComp
Text Label 10450 1100 2    60   ~ 0
P0
Text Label 10450 1200 2    60   ~ 0
P1
Text Label 10450 1300 2    60   ~ 0
P2
Text Label 10450 1400 2    60   ~ 0
P3
Text Label 10450 1500 2    60   ~ 0
P4
Text Label 10450 1600 2    60   ~ 0
P5
Text Label 10450 1700 2    60   ~ 0
P6
Text Label 10450 1800 2    60   ~ 0
P7
Text Label 7400 1100 2    60   ~ 0
P0
Text Label 7400 1200 2    60   ~ 0
P1
Text Label 7400 1300 2    60   ~ 0
P2
Text Label 7400 1400 2    60   ~ 0
P3
Text Label 7400 1500 2    60   ~ 0
P4
Text Label 7400 1600 2    60   ~ 0
P5
Text Label 7400 1700 2    60   ~ 0
P6
Text Label 7400 1800 2    60   ~ 0
P7
Text Label 10450 2000 2    60   ~ 0
K0
Text Label 10450 2100 2    60   ~ 0
K1
Text Label 10450 2200 2    60   ~ 0
K2
Text Label 10450 2300 2    60   ~ 0
K3
Text Label 10450 2400 2    60   ~ 0
K4
Text Label 10450 2500 2    60   ~ 0
K5
Text Label 10450 3000 2    60   ~ 0
AUD
Text Label 10450 3100 2    60   ~ 0
SOD
Text Label 10450 3200 2    60   ~ 0
OCLK
Text Label 10450 3300 2    60   ~ 0
BCLK
Text Label 10450 3400 2    60   ~ 0
SID
$Comp
L GND #PWR08
U 1 1 5A7BE500
P 9300 3800
F 0 "#PWR08" H 9300 3550 50  0001 C CNN
F 1 "GND" H 9300 3650 50  0000 C CNN
F 2 "" H 9300 3800 50  0001 C CNN
F 3 "" H 9300 3800 50  0001 C CNN
	1    9300 3800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR09
U 1 1 5A7BE798
P 9300 700
F 0 "#PWR09" H 9300 550 50  0001 C CNN
F 1 "+5V" H 9300 840 50  0000 C CNN
F 2 "" H 9300 700 50  0001 C CNN
F 3 "" H 9300 700 50  0001 C CNN
	1    9300 700 
	1    0    0    -1  
$EndComp
Text Label 8350 3350 0    60   ~ 0
PHI2
Text Label 8350 3200 0    60   ~ 0
~IRQ
Text Label 8350 3000 0    60   ~ 0
~CS0
Text Label 8350 2900 0    60   ~ 0
CS1
Text Label 8350 2800 0    60   ~ 0
R/~W
Text Label 8350 2600 0    60   ~ 0
A0
Text Label 8350 2500 0    60   ~ 0
A1
Text Label 8350 2400 0    60   ~ 0
A2
Text Label 8350 2300 0    60   ~ 0
A3
Text Label 8350 1400 0    60   ~ 0
D0
Text Label 8350 1500 0    60   ~ 0
D1
Text Label 8350 1600 0    60   ~ 0
D2
Text Label 8350 1700 0    60   ~ 0
D3
Text Label 8350 1800 0    60   ~ 0
D4
Text Label 8350 1900 0    60   ~ 0
D5
Text Label 8350 2000 0    60   ~ 0
D6
Text Label 8350 2100 0    60   ~ 0
D7
Text Label 5300 1400 0    60   ~ 0
D0
Text Label 5300 1500 0    60   ~ 0
D1
Text Label 5300 1600 0    60   ~ 0
D2
Text Label 5300 1700 0    60   ~ 0
D3
Text Label 5300 1800 0    60   ~ 0
D4
Text Label 5300 1900 0    60   ~ 0
D5
Text Label 5300 2000 0    60   ~ 0
D6
Text Label 5300 2100 0    60   ~ 0
D7
Text Label 5300 2300 0    60   ~ 0
A3
Text Label 5300 2400 0    60   ~ 0
A2
Text Label 5300 2500 0    60   ~ 0
A1
Text Label 5300 2600 0    60   ~ 0
A0
Text Label 5300 2800 0    60   ~ 0
R/~W
Text Label 5300 2900 0    60   ~ 0
CS1
Text Label 5300 3000 0    60   ~ 0
~CS0
Text Label 5300 3200 0    60   ~ 0
~IRQ
Text Label 5300 3350 0    60   ~ 0
PHI2
Text Label 4250 900  2    60   ~ 0
INT_3v3
Text Label 4250 1000 2    60   ~ 0
MOSI_3v3
Text Label 4250 1100 2    60   ~ 0
MISO_3v3
Text Label 4250 1200 2    60   ~ 0
SCLK_3v3
Text Label 4250 1300 2    60   ~ 0
~SS_3v3
Text Label 4250 700  2    60   ~ 0
~RES_3v3
$Comp
L 74LVC125 U6
U 1 1 5A7C1E0E
P 9900 4700
F 0 "U6" H 9900 4800 50  0000 L BNN
F 1 "74LVC125" H 9950 4550 50  0000 L TNN
F 2 "SMD_Packages:SSOP-14" H 9900 4700 50  0001 C CNN
F 3 "" H 9900 4700 50  0001 C CNN
	1    9900 4700
	1    0    0    -1  
$EndComp
$Comp
L 74LVC125 U5
U 2 1 5A7C1F25
P 7500 4700
F 0 "U5" H 7500 4800 50  0000 L BNN
F 1 "74LVC125" H 7550 4550 50  0000 L TNN
F 2 "Housings_SOIC:SOIC-14W_7.5x9.0mm_Pitch1.27mm" H 7500 4700 50  0001 C CNN
F 3 "" H 7500 4700 50  0001 C CNN
	2    7500 4700
	-1   0    0    -1  
$EndComp
$Comp
L 74LVC125 U5
U 3 1 5A7C202A
P 7500 5250
F 0 "U5" H 7500 5350 50  0000 L BNN
F 1 "74LVC125" H 7550 5100 50  0000 L TNN
F 2 "Housings_SOIC:SOIC-14W_7.5x9.0mm_Pitch1.27mm" H 7500 5250 50  0001 C CNN
F 3 "" H 7500 5250 50  0001 C CNN
	3    7500 5250
	-1   0    0    -1  
$EndComp
$Comp
L 74LVC125 U5
U 4 1 5A7C207B
P 7500 5800
F 0 "U5" H 7500 5900 50  0000 L BNN
F 1 "74LVC125" H 7550 5650 50  0000 L TNN
F 2 "Housings_SOIC:SOIC-14W_7.5x9.0mm_Pitch1.27mm" H 7500 5800 50  0001 C CNN
F 3 "" H 7500 5800 50  0001 C CNN
	4    7500 5800
	1    0    0    -1  
$EndComp
$Comp
L 74LVC125 U5
U 1 1 5A7C20B4
P 7450 4150
F 0 "U5" H 7450 4250 50  0000 L BNN
F 1 "74LVC125" H 7500 4000 50  0000 L TNN
F 2 "Housings_SOIC:SOIC-14W_7.5x9.0mm_Pitch1.27mm" H 7450 4150 50  0001 C CNN
F 3 "" H 7450 4150 50  0001 C CNN
	1    7450 4150
	-1   0    0    -1  
$EndComp
Text Label 10700 4700 2    60   ~ 0
USBINT
Text Label 9050 4700 0    60   ~ 0
INT_3v3
Text Label 8300 4700 2    60   ~ 0
SCLK
Text Label 6650 4700 0    60   ~ 0
SCLK_3v3
Text Label 6650 5250 0    60   ~ 0
MOSI_3v3
Text Label 8300 5250 2    60   ~ 0
MOSI
Text Label 6650 5800 0    60   ~ 0
MISO_3v3
Text Label 8350 5800 2    60   ~ 0
MISO
Text Label 8350 4150 2    60   ~ 0
~SS
Text Label 6650 4150 0    60   ~ 0
~SS_3v3
NoConn ~ 3400 1350
$Comp
L +5V #PWR010
U 1 1 5A7C7E77
P 1350 4600
F 0 "#PWR010" H 1350 4450 50  0001 C CNN
F 1 "+5V" H 1350 4740 50  0000 C CNN
F 2 "" H 1350 4600 50  0001 C CNN
F 3 "" H 1350 4600 50  0001 C CNN
	1    1350 4600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5A7C86AB
P 1350 7100
F 0 "#PWR011" H 1350 6850 50  0001 C CNN
F 1 "GND" H 1350 6950 50  0000 C CNN
F 2 "" H 1350 7100 50  0001 C CNN
F 3 "" H 1350 7100 50  0001 C CNN
	1    1350 7100
	1    0    0    -1  
$EndComp
Text Label 10450 2700 2    60   ~ 0
~A8KR1
Text Label 10450 2800 2    60   ~ 0
~A8KR2
Text Label 1150 6050 0    60   ~ 0
~A8KR1
Text Label 1150 6150 0    60   ~ 0
~A8KR2
$Comp
L Crystal Y2
U 1 1 5A7CB14B
P 4400 5500
F 0 "Y2" H 4400 5650 50  0000 C CNN
F 1 "16MHz" H 4400 5350 50  0000 C CNN
F 2 "Crystals:Crystal_SMD_5032-2pin_5.0x3.2mm_HandSoldering" H 4400 5500 50  0001 C CNN
F 3 "" H 4400 5500 50  0001 C CNN
	1    4400 5500
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 5A7CB273
P 4650 5850
F 0 "C6" H 4675 5950 50  0000 L CNN
F 1 "22pF" H 4675 5750 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 4688 5700 50  0001 C CNN
F 3 "" H 4650 5850 50  0001 C CNN
	1    4650 5850
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 5A7CB36A
P 4150 5850
F 0 "C5" H 4175 5950 50  0000 L CNN
F 1 "22pF" H 4175 5750 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 4188 5700 50  0001 C CNN
F 3 "" H 4150 5850 50  0001 C CNN
	1    4150 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5A7CC93F
P 4400 6150
F 0 "#PWR012" H 4400 5900 50  0001 C CNN
F 1 "GND" H 4400 6000 50  0000 C CNN
F 2 "" H 4400 6150 50  0001 C CNN
F 3 "" H 4400 6150 50  0001 C CNN
	1    4400 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 5A7CD449
P 1000 3350
F 0 "#PWR013" H 1000 3100 50  0001 C CNN
F 1 "GND" H 1000 3200 50  0000 C CNN
F 2 "" H 1000 3350 50  0001 C CNN
F 3 "" H 1000 3350 50  0001 C CNN
	1    1000 3350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR014
U 1 1 5A7CDBA8
P 1000 2450
F 0 "#PWR014" H 1000 2300 50  0001 C CNN
F 1 "+5V" H 1000 2590 50  0000 C CNN
F 2 "" H 1000 2450 50  0001 C CNN
F 3 "" H 1000 2450 50  0001 C CNN
	1    1000 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 5A7CF595
P 8600 6200
F 0 "#PWR015" H 8600 5950 50  0001 C CNN
F 1 "GND" H 8600 6050 50  0000 C CNN
F 2 "" H 8600 6200 50  0001 C CNN
F 3 "" H 8600 6200 50  0001 C CNN
	1    8600 6200
	1    0    0    -1  
$EndComp
$Comp
L 74LVC125 U6
U 2 1 5A7CFC91
P 9900 5250
F 0 "U6" H 9900 5350 50  0000 L BNN
F 1 "74LVC125" H 9950 5100 50  0000 L TNN
F 2 "SMD_Packages:SSOP-14" H 9900 5250 50  0001 C CNN
F 3 "" H 9900 5250 50  0001 C CNN
	2    9900 5250
	-1   0    0    -1  
$EndComp
Text Label 9050 5250 0    60   ~ 0
~RES_3v3
Text Label 4200 4900 2    60   ~ 0
~RESET
Text Label 10700 5250 2    60   ~ 0
~RESET
NoConn ~ 3350 4700
$Comp
L C C1
U 1 1 5A7D2B60
P 1750 2600
F 0 "C1" H 1775 2700 50  0000 L CNN
F 1 "0.1uF" H 1775 2500 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 1788 2450 50  0001 C CNN
F 3 "" H 1750 2600 50  0001 C CNN
	1    1750 2600
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A7D529F
P 2950 900
F 0 "R3" V 3030 900 50  0000 C CNN
F 1 "10K" V 2950 900 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2880 900 50  0001 C CNN
F 3 "" H 2950 900 50  0001 C CNN
	1    2950 900 
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR016
U 1 1 5A7D5A1F
P 2700 800
F 0 "#PWR016" H 2700 650 50  0001 C CNN
F 1 "+3.3V" H 2700 940 50  0000 C CNN
F 2 "" H 2700 800 50  0001 C CNN
F 3 "" H 2700 800 50  0001 C CNN
	1    2700 800 
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 J4
U 1 1 5A7D6AA9
P 4900 4800
F 0 "J4" H 4900 5000 50  0000 C CNN
F 1 "ICSP" H 4900 4600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 4900 3600 50  0001 C CNN
F 3 "" H 4900 3600 50  0001 C CNN
	1    4900 4800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR017
U 1 1 5A7B6B9B
P 5250 4600
F 0 "#PWR017" H 5250 4450 50  0001 C CNN
F 1 "+5V" H 5250 4740 50  0000 C CNN
F 2 "" H 5250 4600 50  0001 C CNN
F 3 "" H 5250 4600 50  0001 C CNN
	1    5250 4600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 5A7B6BE3
P 5250 5000
F 0 "#PWR018" H 5250 4750 50  0001 C CNN
F 1 "GND" H 5250 4850 50  0000 C CNN
F 2 "" H 5250 5000 50  0001 C CNN
F 3 "" H 5250 5000 50  0001 C CNN
	1    5250 5000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 J3
U 1 1 5A7B890F
P 4800 6550
F 0 "J3" H 4800 6700 50  0000 C CNN
F 1 "RESET" V 4900 6550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4800 6550 50  0001 C CNN
F 3 "" H 4800 6550 50  0001 C CNN
	1    4800 6550
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 J2
U 1 1 5A7B8A06
P 4450 7200
F 0 "J2" H 4450 7350 50  0000 C CNN
F 1 "POWER" V 4550 7200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4450 7200 50  0001 C CNN
F 3 "" H 4450 7200 50  0001 C CNN
	1    4450 7200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR019
U 1 1 5A7B8E69
P 4500 6700
F 0 "#PWR019" H 4500 6450 50  0001 C CNN
F 1 "GND" H 4500 6550 50  0000 C CNN
F 2 "" H 4500 6700 50  0001 C CNN
F 3 "" H 4500 6700 50  0001 C CNN
	1    4500 6700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 J5
U 1 1 5A7BA13A
P 750 4150
F 0 "J5" H 750 4500 50  0000 C CNN
F 1 "SERIAL" V 850 4150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 750 4150 50  0001 C CNN
F 3 "" H 750 4150 50  0001 C CNN
	1    750  4150
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR020
U 1 1 5A7BA81D
P 1050 4500
F 0 "#PWR020" H 1050 4250 50  0001 C CNN
F 1 "GND" H 1050 4350 50  0000 C CNN
F 2 "" H 1050 4500 50  0001 C CNN
F 3 "" H 1050 4500 50  0001 C CNN
	1    1050 4500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR021
U 1 1 5A7BADB0
P 1150 3800
F 0 "#PWR021" H 1150 3650 50  0001 C CNN
F 1 "+5V" H 1150 3940 50  0000 C CNN
F 2 "" H 1150 3800 50  0001 C CNN
F 3 "" H 1150 3800 50  0001 C CNN
	1    1150 3800
	1    0    0    -1  
$EndComp
Text Label 1350 4100 2    60   ~ 0
RXD
Text Label 1350 4000 2    60   ~ 0
TXD
$Comp
L Jumper_NC_Small JP1
U 1 1 5A7BB5C0
P 1550 3900
F 0 "JP1" H 1550 3980 50  0000 C CNN
F 1 "DTR" H 1560 3840 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 1550 3900 50  0001 C CNN
F 3 "" H 1550 3900 50  0001 C CNN
	1    1550 3900
	1    0    0    -1  
$EndComp
Text Label 2300 4150 2    60   ~ 0
~RESET
$Comp
L C C9
U 1 1 5A7BC5B3
P 6700 7200
F 0 "C9" H 6725 7300 50  0000 L CNN
F 1 "0.1uF" H 6725 7100 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 6738 7050 50  0001 C CNN
F 3 "" H 6700 7200 50  0001 C CNN
	1    6700 7200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 J6
U 1 1 5A7C403B
P 4150 6900
F 0 "J6" H 4150 7200 50  0000 C CNN
F 1 "MOBO" V 4250 6900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 4150 6900 50  0001 C CNN
F 3 "" H 4150 6900 50  0001 C CNN
	1    4150 6900
	1    0    0    -1  
$EndComp
NoConn ~ 3950 7000
$Comp
L POKEY_SOCKET U7
U 1 1 5A7C87B3
P 9400 2250
F 0 "U7" H 9000 3550 60  0000 C CNN
F 1 "POKEY_SOCKET" H 9700 950 60  0000 C CNN
F 2 "Housings_DIP:DIP-40_W15.24mm_Socket_LongPads" H 9300 2750 60  0001 C CNN
F 3 "" H 9300 2750 60  0001 C CNN
	1    9400 2250
	1    0    0    -1  
$EndComp
Text Label 7400 3000 2    60   ~ 0
AUD
Text Label 7400 3100 2    60   ~ 0
SOD
Text Label 7400 3200 2    60   ~ 0
OCLK
Text Label 7400 3300 2    60   ~ 0
BCLK
Text Label 7400 3400 2    60   ~ 0
SID
Wire Wire Line
	800  2450 800  2650
Wire Wire Line
	600  2550 600  2750
Wire Wire Line
	800  2150 800  2050
Wire Wire Line
	800  2050 2300 2050
Wire Wire Line
	600  2250 600  1850
Wire Wire Line
	600  1850 2300 1850
Wire Wire Line
	2200 3150 2250 3150
Wire Wire Line
	2250 3050 2250 3350
Wire Wire Line
	2250 3050 2300 3050
Wire Wire Line
	1900 3150 1850 3150
Wire Wire Line
	1850 2850 1850 3350
Wire Wire Line
	1850 2850 2300 2850
Connection ~ 2250 3150
Connection ~ 1850 3150
Wire Wire Line
	1850 3650 1850 3750
Wire Wire Line
	2250 3750 2250 3650
Wire Wire Line
	2050 3800 2050 3750
Connection ~ 2050 3750
Wire Wire Line
	3100 3850 3100 3900
Wire Wire Line
	3100 3900 3300 3900
Wire Wire Line
	3300 3900 3300 3850
Wire Wire Line
	3200 3950 3200 3900
Connection ~ 3200 3900
Wire Wire Line
	3650 4900 3350 4900
Wire Wire Line
	3350 5100 3800 5100
Wire Wire Line
	3800 1350 3800 1300
Wire Wire Line
	3800 1300 4250 1300
Wire Wire Line
	3700 1350 3700 1200
Wire Wire Line
	3700 1200 4250 1200
Wire Wire Line
	3600 1350 3600 1100
Wire Wire Line
	3600 1100 4250 1100
Wire Wire Line
	3500 1350 3500 1000
Wire Wire Line
	3500 1000 4250 1000
Wire Wire Line
	3650 5550 3350 5550
Wire Wire Line
	3650 5650 3350 5650
Wire Wire Line
	3650 5750 3350 5750
Wire Wire Line
	3650 5850 3350 5850
Wire Wire Line
	3650 5950 3350 5950
Wire Wire Line
	3650 6050 3350 6050
Wire Wire Line
	3650 4800 3350 4800
Wire Wire Line
	3300 1350 3300 900 
Wire Wire Line
	3100 900  4250 900 
Wire Wire Line
	3650 6300 3350 6300
Wire Wire Line
	3650 6400 3350 6400
Wire Wire Line
	3650 6500 3350 6500
Wire Wire Line
	3650 6600 3350 6600
Wire Wire Line
	3950 6700 3350 6700
Wire Wire Line
	3950 6800 3350 6800
Wire Wire Line
	3950 6900 3350 6900
Wire Wire Line
	3700 7000 3350 7000
Wire Wire Line
	7400 2000 7050 2000
Wire Wire Line
	7400 2100 7050 2100
Wire Wire Line
	7400 2200 7050 2200
Wire Wire Line
	7400 2300 7050 2300
Wire Wire Line
	7400 2400 7050 2400
Wire Wire Line
	7400 2500 7050 2500
Wire Wire Line
	7400 2700 7050 2700
Wire Wire Line
	7400 2800 7050 2800
Wire Wire Line
	5250 6950 5250 7050
Wire Wire Line
	4700 6950 5400 6950
Connection ~ 5250 6950
Wire Wire Line
	5100 6850 5100 6950
Wire Wire Line
	5100 7450 5100 7500
Wire Wire Line
	4700 7450 6700 7450
Wire Wire Line
	6350 7450 6350 7350
Connection ~ 5800 7450
Wire Wire Line
	5250 7350 5250 7450
Connection ~ 5250 7450
Wire Wire Line
	6200 6950 6700 6950
Wire Wire Line
	6350 6950 6350 7050
Wire Wire Line
	6500 6950 6500 6850
Connection ~ 6350 6950
Wire Wire Line
	6250 3800 6250 3700
Wire Wire Line
	6250 700  6250 800 
Wire Wire Line
	10450 1100 10100 1100
Wire Wire Line
	10450 1200 10100 1200
Wire Wire Line
	10450 1300 10100 1300
Wire Wire Line
	10450 1400 10100 1400
Wire Wire Line
	10450 1500 10100 1500
Wire Wire Line
	10450 1600 10100 1600
Wire Wire Line
	10450 1700 10100 1700
Wire Wire Line
	10450 1800 10100 1800
Wire Wire Line
	7400 1100 7050 1100
Wire Wire Line
	7400 1200 7050 1200
Wire Wire Line
	7400 1300 7050 1300
Wire Wire Line
	7400 1400 7050 1400
Wire Wire Line
	7400 1500 7050 1500
Wire Wire Line
	7400 1600 7050 1600
Wire Wire Line
	7400 1700 7050 1700
Wire Wire Line
	7400 1800 7050 1800
Wire Wire Line
	10450 2000 10100 2000
Wire Wire Line
	10450 2100 10100 2100
Wire Wire Line
	10450 2200 10100 2200
Wire Wire Line
	10450 2300 10100 2300
Wire Wire Line
	10100 2400 10450 2400
Wire Wire Line
	10450 2500 10100 2500
Wire Wire Line
	10100 2700 10450 2700
Wire Wire Line
	10450 2800 10100 2800
Wire Wire Line
	10450 3000 10100 3000
Wire Wire Line
	10450 3100 10100 3100
Wire Wire Line
	10450 3200 10100 3200
Wire Wire Line
	10450 3300 10100 3300
Wire Wire Line
	10450 3400 10100 3400
Wire Wire Line
	9300 3800 9300 3700
Wire Wire Line
	9300 700  9300 800 
Wire Wire Line
	8350 1400 8700 1400
Wire Wire Line
	8350 1500 8700 1500
Wire Wire Line
	8350 1600 8700 1600
Wire Wire Line
	8350 1700 8700 1700
Wire Wire Line
	8350 1800 8700 1800
Wire Wire Line
	8350 1900 8700 1900
Wire Wire Line
	8350 2000 8700 2000
Wire Wire Line
	8350 2100 8700 2100
Wire Wire Line
	8350 2300 8700 2300
Wire Wire Line
	8350 2400 8700 2400
Wire Wire Line
	8350 2500 8700 2500
Wire Wire Line
	8350 2600 8700 2600
Wire Wire Line
	8350 2800 8700 2800
Wire Wire Line
	8350 2900 8700 2900
Wire Wire Line
	8350 3000 8700 3000
Wire Wire Line
	8350 3200 8700 3200
Wire Wire Line
	8350 3350 8700 3350
Wire Wire Line
	5300 1400 5650 1400
Wire Wire Line
	5300 1500 5650 1500
Wire Wire Line
	5300 1600 5650 1600
Wire Wire Line
	5300 1700 5650 1700
Wire Wire Line
	5300 1800 5650 1800
Wire Wire Line
	5300 1900 5650 1900
Wire Wire Line
	5300 2000 5650 2000
Wire Wire Line
	5300 2100 5650 2100
Wire Wire Line
	5300 2300 5650 2300
Wire Wire Line
	5300 2400 5650 2400
Wire Wire Line
	5300 2500 5650 2500
Wire Wire Line
	5300 2600 5650 2600
Wire Wire Line
	5300 2800 5650 2800
Wire Wire Line
	5300 2900 5650 2900
Wire Wire Line
	5300 3000 5650 3000
Wire Wire Line
	5300 3200 5650 3200
Wire Wire Line
	5300 3350 5650 3350
Wire Wire Line
	3200 1350 3200 700 
Wire Wire Line
	3200 700  4250 700 
Wire Wire Line
	10700 4700 10350 4700
Wire Wire Line
	9050 4700 9450 4700
Wire Wire Line
	8300 4700 7950 4700
Wire Wire Line
	6650 4700 7050 4700
Wire Wire Line
	8300 5250 7950 5250
Wire Wire Line
	6650 5250 7050 5250
Wire Wire Line
	6650 5800 7050 5800
Wire Wire Line
	8350 5800 7950 5800
Wire Wire Line
	8350 4150 7900 4150
Wire Wire Line
	6650 4150 7000 4150
Wire Wire Line
	1350 4800 1450 4800
Wire Wire Line
	1450 4700 1350 4700
Wire Wire Line
	1350 5000 1450 5000
Wire Wire Line
	1350 6800 1350 7100
Wire Wire Line
	1350 6800 1450 6800
Wire Wire Line
	1450 6900 1350 6900
Connection ~ 1350 6900
Wire Wire Line
	1450 7000 1350 7000
Connection ~ 1350 7000
Wire Wire Line
	1150 6050 1450 6050
Wire Wire Line
	1150 6150 1450 6150
Wire Wire Line
	3350 5300 4650 5300
Wire Wire Line
	4650 5300 4650 5700
Wire Wire Line
	4550 5500 4650 5500
Connection ~ 4650 5500
Wire Wire Line
	4250 5500 4150 5500
Wire Wire Line
	4150 5400 4150 5700
Wire Wire Line
	4150 5400 3350 5400
Connection ~ 4150 5500
Wire Wire Line
	4150 6000 4150 6100
Wire Wire Line
	4150 6100 4650 6100
Wire Wire Line
	4650 6100 4650 6000
Wire Wire Line
	4400 6150 4400 6100
Connection ~ 4400 6100
Wire Wire Line
	1000 2850 1000 3350
Wire Wire Line
	1000 2450 1000 2550
Wire Wire Line
	7450 4450 8600 4450
Wire Wire Line
	8600 4450 8600 6200
Wire Wire Line
	7500 6100 8600 6100
Connection ~ 8600 6100
Wire Wire Line
	7500 5550 9900 5550
Connection ~ 8600 5550
Wire Wire Line
	7500 5000 9900 5000
Connection ~ 8600 5000
Wire Wire Line
	9050 5250 9450 5250
Wire Wire Line
	10700 5250 10350 5250
Wire Wire Line
	600  2750 1100 2750
Wire Wire Line
	800  2650 1100 2650
Wire Wire Line
	1000 2550 1100 2550
Wire Wire Line
	1000 2850 1100 2850
Wire Wire Line
	1850 3750 2250 3750
Wire Wire Line
	1750 2450 2300 2450
Wire Wire Line
	1750 2750 1750 3150
Wire Wire Line
	1750 3150 1000 3150
Connection ~ 1000 3150
Wire Wire Line
	3000 1300 3000 1350
Connection ~ 3300 900 
Wire Wire Line
	2800 900  2700 900 
Wire Wire Line
	2700 800  2700 1300
Wire Wire Line
	2700 1300 3000 1300
Connection ~ 2700 900 
Wire Wire Line
	2800 1350 2800 1300
Connection ~ 2800 1300
Wire Wire Line
	5150 4900 5250 4900
Wire Wire Line
	5250 4900 5250 5000
Wire Wire Line
	5150 4700 5250 4700
Wire Wire Line
	5250 4700 5250 4600
Wire Wire Line
	3350 6150 3900 6150
Wire Wire Line
	3900 4900 3900 6500
Wire Wire Line
	3900 4900 4650 4900
Wire Wire Line
	3350 5200 4350 5200
Wire Wire Line
	4350 5200 4350 4800
Wire Wire Line
	4350 4800 4650 4800
Wire Wire Line
	3800 5100 3800 4700
Wire Wire Line
	3800 4700 4650 4700
Wire Wire Line
	3350 5000 3750 5000
Wire Wire Line
	3750 5000 3750 4350
Wire Wire Line
	3750 4350 5450 4350
Wire Wire Line
	5450 4350 5450 4800
Wire Wire Line
	5450 4800 5150 4800
Wire Wire Line
	3900 6500 4600 6500
Connection ~ 3900 6150
Wire Wire Line
	4500 6700 4500 6600
Wire Wire Line
	4500 6600 4600 6600
Wire Wire Line
	950  4300 1050 4300
Wire Wire Line
	1050 4300 1050 4500
Wire Wire Line
	950  4400 1050 4400
Connection ~ 1050 4400
Wire Wire Line
	950  4100 1350 4100
Wire Wire Line
	1350 4000 950  4000
Wire Wire Line
	1450 3900 950  3900
Wire Wire Line
	950  4200 1150 4200
Wire Wire Line
	1150 4200 1150 3800
Wire Wire Line
	1650 3900 1750 3900
Wire Wire Line
	1750 3900 1750 4150
Wire Wire Line
	1750 4150 2300 4150
Wire Wire Line
	4900 7050 4900 6950
Connection ~ 5100 6950
Wire Wire Line
	4900 7350 4900 7450
Connection ~ 5100 7450
Wire Wire Line
	6700 6950 6700 7050
Connection ~ 6500 6950
Wire Wire Line
	6700 7450 6700 7350
Connection ~ 6350 7450
Wire Wire Line
	4700 7150 4700 6950
Connection ~ 4900 6950
Wire Wire Line
	4700 7250 4700 7450
Connection ~ 4900 7450
Wire Wire Line
	3700 7000 3700 7100
Wire Wire Line
	3700 7100 3950 7100
Wire Wire Line
	4650 7150 4700 7150
Wire Wire Line
	4650 7250 4700 7250
Wire Wire Line
	7400 3000 7050 3000
Wire Wire Line
	7400 3100 7050 3100
Wire Wire Line
	7400 3200 7050 3200
Wire Wire Line
	7400 3300 7050 3300
Wire Wire Line
	7400 3400 7050 3400
Connection ~ 5350 6950
$Comp
L PWR_FLAG #FLG022
U 1 1 5A7CC99C
P 5350 7600
F 0 "#FLG022" H 5350 7675 50  0001 C CNN
F 1 "PWR_FLAG" H 5350 7750 50  0000 C CNN
F 2 "" H 5350 7600 50  0001 C CNN
F 3 "" H 5350 7600 50  0001 C CNN
	1    5350 7600
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 7600 5350 7450
Connection ~ 5350 7450
$Comp
L PWR_FLAG #FLG023
U 1 1 5A7CCB1D
P 5350 6750
F 0 "#FLG023" H 5350 6825 50  0001 C CNN
F 1 "PWR_FLAG" H 5350 6900 50  0000 C CNN
F 2 "" H 5350 6750 50  0001 C CNN
F 3 "" H 5350 6750 50  0001 C CNN
	1    5350 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 6750 5350 6950
Connection ~ 4950 6950
Wire Wire Line
	4950 6850 4950 6950
$Comp
L VCC #PWR024
U 1 1 5A7CAC25
P 4950 6850
F 0 "#PWR024" H 4950 6700 50  0001 C CNN
F 1 "VCC" H 4950 7000 50  0000 C CNN
F 2 "" H 4950 6850 50  0001 C CNN
F 3 "" H 4950 6850 50  0001 C CNN
	1    4950 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 4600 1350 5000
$Comp
L C C10
U 1 1 5A7CE380
P 900 5500
F 0 "C10" H 925 5600 50  0000 L CNN
F 1 "0.1uF" H 925 5400 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 938 5350 50  0001 C CNN
F 3 "" H 900 5500 50  0001 C CNN
	1    900  5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  5350 900  5300
Wire Wire Line
	900  5300 1450 5300
$Comp
L GND #PWR025
U 1 1 5A7CE6B0
P 900 5700
F 0 "#PWR025" H 900 5450 50  0001 C CNN
F 1 "GND" H 900 5550 50  0000 C CNN
F 2 "" H 900 5700 50  0001 C CNN
F 3 "" H 900 5700 50  0001 C CNN
	1    900  5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  5700 900  5650
Connection ~ 1350 4700
Connection ~ 1350 4800
Wire Wire Line
	5800 7450 5800 7250
$EndSCHEMATC
