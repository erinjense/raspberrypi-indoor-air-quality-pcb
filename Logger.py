from Csv import *

loggerinfo = { 'loggertype'     :"IAQ",
               'id'             :"NUMBA0",
               'softwareversion': 0,
             }

moduleinfo = { 'calibration'    :"NA"
             }

csv = Csv("test.csv",loggerinfo,moduleinfo)

data = [9000,9001]
csv.writeData(data)

#while True:
   
    # If csv reached max limit, close
    # or if csv not reachable
        # create new csv

    # get gas measurement
    # get particulate
    # get BME680 {temp, humidity, IAQ, pressure}
    # Record all on one row of CSV
    # Pros: simplicity, cons: time inaccuracy 
