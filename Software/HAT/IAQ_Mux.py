#!/usr/bin/python

# Driver for the SN74LV4051A Multiplexer

#################################################################################
# MIT License
#
# Copyright (c) 2019 Aaron Jense, Amy Heidner, Dennis Heidner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#################################################################################

import RPi.GPIO as GPIO
from enum import Enum

class Mux:
    pinA = 17
    pinB = 27
    pinC = 22

    class Channel(Enum):
        A0 = 0
        A1 = 1
        A2 = 2
        A3 = 3
        A4 = 4
        A5 = 5

    def __init__(self):
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.pinA,GPIO.OUT)
        GPIO.setup(self.pinB,GPIO.OUT)
        GPIO.setup(self.pinC,GPIO.OUT)
        self.setMuxOutput(False,False,False)

    def setMuxOutput(self,C=False,B=False,A=False):
        GPIO.output(self.pinA,A)
        GPIO.output(self.pinB,B)
        GPIO.output(self.pinC,C)

    def switchChannel(self,channel):
        try:
            if not hasattr(self.Channel,channel):
                print('channel must have atrribute of Channel Enum')
                return
        except TypeError:
            print('channel must be of type Channel Enum')

        if (channel == self.Channel.A0.name):
            self.setMuxOutput(False,False,False)
        elif (channel == self.Channel.A1.name):
            self.setMuxOutput(False,False,True)
        elif (channel == self.Channel.A2.name):
            self.setMuxOutput(False,True,False)
        elif (channel == self.Channel.A3.name):
            self.setMuxOutput(False,True,True)
        elif (channel == self.Channel.A4.name):
            self.setMuxOutput(True,False,False)
        elif (channel == self.Channel.A5.name):
            self.setMuxOutput(True,False,True)
        else:
            print('Invalid Channel')
