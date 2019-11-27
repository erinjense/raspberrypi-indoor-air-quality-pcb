import Tkinter as tk
import ScrolledText as tkst
import time
import csv
from enum import Enum
import datetime
from itertools import cycle

class GUI(tk.Tk):
    ############################################
    # Graphics
    ############################################
    #######################
    # Root
    #######################
    BACKGROUND_CLR   = 'LightSteelBlue3'
    #######################
    # StartPage.TopBar
    #######################
    TOP_SCRN_CLR     = 'light steel blue'
    #######################
    # StartPage.SensorGrid
    #######################
    SENSOR_GRID_CLR  = 'RoyalBlue'
    #######################
    # StartPage.BottomBar
    #######################
    SENSOR_BUTN_CLR  = 'PaleGreen4'

    ############################################
    # Toggle Button Status Options
    ############################################
    #######################
    # StartPage.BottomBar
    #######################
    LOG_ON  = 'Start Logging'
    LOG_OFF = 'Stop Logging'

    USB_EJECT = "Eject USB"
    USB_MOUNT = "Mount USB"
    USB_NONE  = "No USB"

    ############################################
    # Callback Status Flags
    ############################################
    # Logger Status Flag Options
    # True:  Logging
    # False: Not Logging
    _logger_status_flag = False

    # USB Status Flag Options
    # True:  USB is mounted
    # False: USB is unmounted
    # None:  No USB attached
    _usb_status_flag    = None

    frames     = {}
    portStatus = {}

    def __init__(self, sensorConfigDict, *args, **kwargs):
        self.portStatus = sensorConfigDict
        tk.Tk.__init__(self, *args, **kwargs)

        ############################################
        #           Root Properties
        ############################################
        self.geometry('800x480')
        self.title('Indoor Air Quality Logger')
        self.resizable(0, 0)
        self.configure(bg=self.BACKGROUND_CLR)

        ############################################
        #           StartPage
        ############################################
        frame = StartPage(parent=self, controller=self)
        self.frames["StartPage"] = frame
        frame.pack(expand=True, fill='both')
        frame.configure(bg=self.BACKGROUND_CLR)

        self.show_frame("StartPage")

    ###########################################################################
    # External API: Used by IAQ_Logger 
    # The GUI keeps track of user input with status flags in Internal Callbacks
    # TODO: Use binds instead of polling
    ###########################################################################

    def updateUsbStatus(self, usb_status):
        self._usb_status_flag = usb_status
        try:
            startpage = self.frames["StartPage"]
            bottomBar = startpage.frames["BottomBar"]
            if self._usb_status_flag == True:
                bottomBar.usb_txt.set(self.USB_EJECT)
                bottomBar.usb_btn['state'] = 'normal'
            elif self._usb_status_flag == False:
                bottomBar.usb_txt.set(self.USB_MOUNT)
                bottomBar.usb_btn['state'] = 'normal'
            elif self._usb_status_flag == None:
                bottomBar.usb_txt.set(self.USB_NONE)
                bottomBar.usb_btn['state'] = 'disabled'
        except KeyError:
            raise KeyError('StartPage does not exist')

    def updateLoggerStatus(self, logger_status):
        self._logger_status_flag = logger_status
        try:
            startpage = self.frames["StartPage"]
            bottomBar = startpage.frames["BottomBar"]
            if self._logger_status_flag == True:
                bottomBar.logger_txt.set(self.LOG_OFF)
            elif self._logger_status_flag == False:
                bottomBar.logger_txt.set(self.LOG_ON)
        except KeyError:
            raise KeyError('StartPage does not exist')

    def updateTime(self):
        startpage = self.frames.get("StartPage")
        topbar = startpage.frames.get("TopBar")
        topbar.updateTime()

    def getUsbStatus(self):
        return self._usb_status_flag

    def getLoggerStatus(self):
        return self._logger_status_flag

    ###########################################################################
    # Internal Callbacks
    ###########################################################################

    def show_frame(self, page_name=None):
        frame = self.frames[page_name]
        frame.tkraise()
    
    def update_logger(self, startpage):
        state = startpage.logger_txt.get()
        if state == self.LOG_ON:
            startpage.logger_txt.set(self.LOG_OFF)
            self._logger_status_flag = True
        elif state == self.LOG_OFF:
            startpage.logger_txt.set(self.LOG_ON)
            self._logger_status_flag = False
        else:
            pass

    def update_usb(self, startpage):
        state = startpage.usb_txt.get()
        if state == "Mount USB":
            startpage.usb_txt.set("Eject USB")
            self._usb_status_flag = True
        elif state == "Eject USB":
            startpage.usb_txt.set("Mount USB")
            self._usb_status_flag = False
        else:
            pass

       
class StartPage(tk.Frame):
    ctrl = None
    frames = {}
    buttons = {}
    MAX_SENSORS = 6

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller
    
        #######################################################################
        #   TOP ROW BUTTONS
        #######################################################################
        topBar = TopBar(parent=self, controller = self.ctrl)
        topBar.pack(expand=True,fill='x')
        topBar.configure(bg=self.ctrl.BACKGROUND_CLR)
        self.frames["TopBar"] = topBar

        #######################################################################
        #   Sensor Rows
        #######################################################################
        sensorView = SensorGrid(parent=self, controller=self.ctrl)
        sensorView.configure(bg=self.ctrl.BACKGROUND_CLR)
        sensorView.pack(expand=True,fill='x')

        #######################################################################
        # BOTTOM ROW BUTTONS
        #######################################################################
        bottomBar = BottomBar(parent=self, controller = self.ctrl)
        bottomBar.pack(expand=True,fill='x')
        bottomBar.configure(bg=self.ctrl.BACKGROUND_CLR)
        self.frames["BottomBar"] = bottomBar

class SensorGrid(tk.Frame):
    ctrl = None
    frames = {}

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller

        #######################################################################
        # MQ Gas Sensors (MQ2,MQ4,MQ5,MQ6,MQ7,MQ135)
        #######################################################################
        MQ2 = SensorTile(parent=self, controller=self.ctrl)
        MQ2.grid(row=0, column=0,sticky="nsew")
        self.frames["MQ2"] = MQ2

        MQ4 = SensorTile(parent=self, controller=self.ctrl)
        MQ4.grid(row=1, column=0,sticky="nsew")
        self.frames["MQ4"] = MQ4

        MQ5 = SensorTile(parent=self, controller=self.ctrl)
        MQ5.grid(row=2, column=0,sticky="nsew")
        self.frames["MQ5"] = MQ5

        MQ6 = SensorTile(parent=self, controller=self.ctrl)
        MQ6.grid(row=0, column=1,sticky="nsew")
        self.frames["MQ6"] = MQ6

        MQ7 = SensorTile(parent=self, controller=self.ctrl)
        MQ7.grid(row=1, column=1,sticky="nsew")
        self.frames["MQ7"] = MQ7

        MQ135 = SensorTile(parent=self, controller=self.ctrl)
        MQ135.grid(row=2, column=1,sticky="nsew")
        self.frames["MQ135"] = MQ135

        #######################################################################
        # CO2
        #######################################################################
        scd30 = SensorTile(parent=self, controller=self.ctrl)
        scd30.grid(row=0, column=2,sticky="nsew")
        self.frames["SCD30"] = scd30

        #######################################################################
        # Particulate
        #######################################################################
        sds011 = SensorTile(parent=self, controller=self.ctrl)
        sds011.grid(row=1, column=2,sticky="nsew")
        self.frames["SDS011"] = sds011

        #######################################################################
        # BME860 VOC
        #######################################################################
        bme680_voc = SensorTile(parent=self, controller=self.ctrl)
        bme680_voc.grid(row=2, column=2,sticky="nsew")
        self.frames["VOC"] = bme680_voc


class SensorTile(tk.Frame):
    ctrl = None

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller
        self.configure(highlightbackground = self.ctrl.SENSOR_GRID_CLR)
        self.configure(highlightcolor = self.ctrl.SENSOR_GRID_CLR)
        self.configure(highlightthickness = 3)
        self.configure(bd = 0, width = 270, height = 108)
        self.configure(bg=self.ctrl.BACKGROUND_CLR)

class BottomBar(tk.Frame):
    ctrl = None
    logger_txt = None
    usb_txt    = None
    usb_btn    = None

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller

        #######################################################################
        # Start/Stop Data Recording
        #######################################################################
        self.logger_txt = tk.StringVar()
        self.logger_txt.set(self.ctrl.LOG_ON)
        StSp = tk.Button(self, textvariable=self.logger_txt,height=5,width=15,
                command=lambda : self.ctrl.update_logger(self))
        StSp.configure(bg=self.ctrl.TOP_SCRN_CLR)
        StSp.grid(row=0,column=0)

        #######################################################################
        # Mount/Eject USB
        #######################################################################
        self.usb_txt = tk.StringVar()
        self.usb_txt.set("Mount USB")
        self.usb_btn = tk.Button(self, textvariable=self.usb_txt,height=5,
                width=15,command=lambda : self.ctrl.update_usb(self))
        self.usb_btn.configure(bg=self.ctrl.TOP_SCRN_CLR)
        self.usb_btn.grid(row=0,column=1)


class TopBar(tk.Frame):
    ctrl = None
    time = None
    date = None

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller

        #######################################################################
        # Date
        #######################################################################
        self.date = tk.StringVar()
        self.updateDate()
        dateLabel = tk.Label(self, textvariable=self.date,height=5,width=15)
        dateLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        dateLabel.grid(row=0,column=0)

        #######################################################################
        # Time
        #######################################################################
        self.time = tk.StringVar()
        self.updateTime()
        timeLabel = tk.Label(self, textvariable=self.time,height=5,width=15)
        timeLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        timeLabel.grid(row=0,column=1)

        #######################################################################
        # Temperature (BME680)
        #######################################################################

        #######################################################################
        # Humidity (BME680)
        #######################################################################

        #######################################################################
        # Barometric Pressure (BME680)
        #######################################################################

    def updateDate(self):
        date = datetime.datetime.now().date()
        self.date.set(str(date.strftime('%b %d, %Y')))

    def updateTime(self):
        time = datetime.datetime.now().time()
        self.time.set(str(time.strftime('%-I:%M:%S %p')))
