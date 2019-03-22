#!/usr/bin/python

from Csv import *

csv = Csv("./config/logger_setup.csv")
csv.setupNewFile()

#while True:
    # If csv reached max limit, close
    # or if csv not reachable
        # create new csv

    # get gas measurement
    # get particulate
    # get BME680 {temp, humidity, IAQ, pressure}
    # Record all on one row of CSV
    # Pros: simplicity, cons: time inaccuracy 
