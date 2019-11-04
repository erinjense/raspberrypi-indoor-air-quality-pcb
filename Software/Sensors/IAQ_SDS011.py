import serial, time

#Use the following line to read from usb
ser = serial.Serial('/dev/ttyUSB0')

#Use the following lines to read from serial TX and RX pins on GPIO
#ser = serial.Serial(
#    port='/dev/ttyS0',
#    baudrate = 9600,
#    parity = serial.PARITY_NONE,
#    stopbits=serial.STOPBITS_ONE,
#    bytesize=serial.EIGHTBITS,
#    timeout=1)

while True:
    data = []
    for index in range(0,10):
        datum = ser.read()
        data.append(datum)

    pmtwofive = int.from_bytes(b''.join(data[2:4]), byteorder='little')/10
    print ('PM2.5: ',pmtwofive)

    pmten = int.from_bytes(b''.join(data[4:6]), byteorder='little')/10
    print ('PM10 : ',pmten)

    time.sleep(1)
    