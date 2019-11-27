import serial, time

class IAQ_sds011():
    sid = None
    serial = None

    def __init__(self, sensor_id=None, serial_port=None):
        self.sid = sensor_id
        self.serial = serial.Serial('/dev/ttyUSB0')

        #ser = serial.Serial(
        #    port='/dev/ttyS0',
        #    baudrate = 9600,
        #    parity = serial.PARITY_NONE,
        #    stopbits=serial.STOPBITS_ONE,
        #    bytesize=serial.EIGHTBITS,
        #    timeout=1)

    def getData(self):
        data = []
        for index in range(0,10):
            datum = self.serial.read()
            data.append(datum)

        pmtwofive = int(''.join(data[2:4]).encode('hex'), 16)/10
        pmten = int(''.join(data[4:6]).encode('hex'), 16)/10
        return [pmtwofive, pmten]
