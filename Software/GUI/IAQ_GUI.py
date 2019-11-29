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

import Tkinter as tk
import ScrolledText as tkst
import datetime
import os
from   IAQ_Config         import SensorConfig
from   IAQ_Config         import LoggerConfig
from   enum               import Enum
from   itertools          import cycle
from   PIL                import ImageTk, Image

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
        self.title('Zephyrus IAQ')
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

    #######################
    # Root
    #######################

    def getUsbStatus(self):
        return self._usb_status_flag

    def getLoggerStatus(self):
        return self._logger_status_flag

    #######################
    # StartPage.TopBar
    #######################

    def updateTime(self):
        topbar    = self.frames.get("TopBar")
        topbar.updateTime()

    def updateTemp(self, temp):
        if temp == None or temp == "": return
        topbar    = self.frames.get("TopBar")
        topbar.updateTemp(temp)

    def updateHumidity(self, humidity):
        if humidity == None or humidity == "": return
        topbar    = self.frames.get("TopBar")
        topbar.updateHumidity(humidity)

    def updatePressure(self, pressure):
        if pressure == None or pressure == "": return
        topbar    = self.frames.get("TopBar")
        topbar.updatePressure(pressure)

    def updateLocation(self, location):
        if location == None or location == "": return
        topbar    = self.frames.get("TopBar")
        topbar.updateLocation(location)

    ##################################
    # StartPage.SensorGrid.SensorTile
    ##################################

    def updateData(self, data, sensor_name):
        if data == None or data == "": return
        sensorgrid = self.frames.get("SensorGrid")
        sensortile = sensorgrid.frames.get(sensor_name)
        sensortile.updateData(data)

    #######################
    # StartPage.BottomBar
    #######################
    def updateUsbStatus(self, usb_status):
        self._usb_status_flag = usb_status
        try:
            bottomBar = self.frames["BottomBar"]
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
            raise KeyError('BottomBar does not exist')

    def updateLoggerStatus(self, logger_status):
        self._logger_status_flag = logger_status
        try:
            bottomBar = self.frames["BottomBar"]
            if self._logger_status_flag == True:
                bottomBar.logger_txt.set(self.LOG_OFF)
            elif self._logger_status_flag == False:
                bottomBar.logger_txt.set(self.LOG_ON)
        except KeyError:
            raise KeyError('BottomBar does not exist')

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

    def toggle_settings(self, topbar):
        # Toggle View
        if topbar.current_view == topbar.SETTINGS_VIEW:
            topbar.current_view = topbar.SENSORGRID_VIEW
            topbar.settings.configure(image = topbar.settings_img)
            topbar.settings.image = topbar.settings_img
        elif topbar.current_view == topbar.SENSORGRID_VIEW:
            topbar.current_view = topbar.SETTINGS_VIEW
            topbar.settings.configure(image = topbar.back_img)
            topbar.settings.image = topbar.back_img
        # Show New View
        self.show_frame(topbar.current_view)
       
class StartPage(tk.Frame):
    ctrl = None
    frames = {}
    buttons = {}
    MAX_SENSORS = 6

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller
    
        #######################################################################
        #   TopBar
        #######################################################################
        topBar = TopBar(parent=self, controller = self.ctrl)
        topBar.grid(row=0, column=0, sticky="nsew")
        topBar.configure(bg=self.ctrl.BACKGROUND_CLR)
        self.ctrl.frames["TopBar"] = topBar

        #######################################################################
        # Mid-Section
        #######################################################################
        #####################
        #    Settings
        #####################
        settings = Settings(parent=self, controller=self.ctrl)
        settings.configure(bg=self.ctrl.BACKGROUND_CLR)
        settings.grid(row=1, column=0, stick = "nsew")
        self.ctrl.frames["Settings"] = settings

        #####################
        #   SensorGrid
        #####################
        sensorGrid = SensorGrid(parent=self, controller=self.ctrl)
        sensorGrid.configure(bg=self.ctrl.BACKGROUND_CLR)
        sensorGrid.grid(row=1, column=0, sticky="nsew")
        self.ctrl.frames["SensorGrid"] = sensorGrid
        #######################################################################
        #   BottomBar
        #######################################################################
        bottomBar = BottomBar(parent=self, controller = self.ctrl)
        bottomBar.grid(row=2, column=0, sticky="nsew")
        bottomBar.configure(bg=self.ctrl.BACKGROUND_CLR)
        self.ctrl.frames["BottomBar"] = bottomBar

class SensorGrid(tk.Frame):
    ctrl = None
    frames = {}

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller

        #######################################################################
        # MQ Gas Sensors (MQ2,MQ4,MQ5,MQ6,MQ7,MQ135)
        #######################################################################
        MQ2 = SensorTile(parent=self, controller=self.ctrl, name="MQ2")
        MQ2.grid(row=0, column=0,sticky="nsew")
        MQ2.grid_propagate(False)
        self.frames["MQ2"] = MQ2

        MQ4 = SensorTile(parent=self, controller=self.ctrl, name="MQ4")
        MQ4.grid(row=1, column=0,sticky="nsew")
        MQ4.grid_propagate(False)
        self.frames["MQ4"] = MQ4

        MQ5 = SensorTile(parent=self, controller=self.ctrl, name="MQ5")
        MQ5.grid(row=2, column=0,sticky="nsew")
        MQ5.grid_propagate(False)
        self.frames["MQ5"] = MQ5

        MQ6 = SensorTile(parent=self, controller=self.ctrl, name="MQ6")
        MQ6.grid(row=0, column=1,sticky="nsew")
        MQ6.grid_propagate(False)
        self.frames["MQ6"] = MQ6

        MQ7 = SensorTile(parent=self, controller=self.ctrl, name="MQ7")
        MQ7.grid(row=1, column=1,sticky="nsew")
        MQ7.grid_propagate(False)
        self.frames["MQ7"] = MQ7

        MQ135 = SensorTile(parent=self, controller=self.ctrl, name="MQ135")
        MQ135.grid(row=2, column=1,sticky="nsew")
        MQ135.grid_propagate(False)
        self.frames["MQ135"] = MQ135

        #######################################################################
        # CO2
        #######################################################################
        scd30 = SensorTile(parent=self, controller=self.ctrl, name="SCD30")
        scd30.grid(row=0, column=2,sticky="nsew")
        scd30.grid_propagate(False)
        self.frames["SCD30"] = scd30

        #######################################################################
        # Particulate
        #######################################################################
        sds011 = SensorTile(parent=self, controller=self.ctrl, name="SDS011")
        sds011.grid(row=1, column=2,sticky="nsew")
        sds011.grid_propagate(False)
        self.frames["SDS011"] = sds011

        #######################################################################
        # BME860 VOC
        #######################################################################
        bme680_voc = SensorTile(parent=self, controller=self.ctrl,name="BME680")
        bme680_voc.grid(row=2, column=2,sticky="nsew")
        bme680_voc.grid_propagate(False)
        self.frames["BME680"] = bme680_voc

class Settings(tk.Frame):
    ctrl = None
    frames = {}
    HEIGHT = 5
    WIDTH = 5

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller
        self.configure(highlightbackground = self.ctrl.SENSOR_GRID_CLR)
        self.configure(highlightcolor      = self.ctrl.SENSOR_GRID_CLR)
        self.configure(highlightthickness = 2)
        self.rowconfigure(0,    weight=1)
        self.rowconfigure(1,    weight=1)
        self.rowconfigure(2,    weight=1)
        self.columnconfigure(0, weight=1)
        self.columnconfigure(1, weight=1)
        self.columnconfigure(2, weight=1)

        version = "Software Version: {0}".format(LoggerConfig.SOFTWARE_VERSION)
        loggerId   = "Logger ID #: {0}".format(LoggerConfig.LOGGER_ID)
        repository = "GitHub: {0}".format(LoggerConfig.GITHUB)
        text       = "{0}\n{1}\n{2}\n".format(loggerId, version, repository)

        configLabel = tk.Label(self,text = text)
        configLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        configLabel.configure(font = "Times 15 bold")
        configLabel.grid(row=0, column=0, sticky="nsew", rowspan=3)

        update = tk.Button(self, text="Update")
        update.configure(bg=self.ctrl.TOP_SCRN_CLR)
        update.configure(font = "Times 15 bold")
        update.grid(row=0, column=1, sticky="nsew", columnspan=2)

        shutdown = tk.Button(self, text="Shutdown")
        shutdown.configure(bg=self.ctrl.TOP_SCRN_CLR)
        shutdown.configure(font = "Times 15 bold")
        shutdown.grid(row=1, column=1, sticky="nsew", columnspan=2)

        reboot = tk.Button(self, text="Reboot")
        reboot.configure(bg=self.ctrl.TOP_SCRN_CLR)
        reboot.configure(font = "Times 15 bold")
        reboot.grid(row=2, column=1, sticky="nsew", columnspan=2)


class SensorTile(tk.Frame):
    WIDTH  = 265
    HEIGHT = 108
    ctrl   = None
    focus  = None
    sensorFocus = None
    widgets = {}
    fText = None

    def __init__(self, parent, controller, name):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller

        self.configure(highlightbackground = self.ctrl.SENSOR_GRID_CLR)
        self.configure(highlightcolor = self.ctrl.SENSOR_GRID_CLR)
        self.configure(highlightthickness = 2)
        self.configure(bd = 0, width = self.WIDTH, height = self.HEIGHT)
        self.rowconfigure(0,   weight=1)
        self.columnconfigure(0,weight=1)
        
        # Sensor Name
        titleText = tk.Label(self)
        titleText.configure(font = "Times 15 bold")
        titleText.configure(bg = self.ctrl.TOP_SCRN_CLR)
        titleText.config(text = name)
        titleText.grid(row=0, column=0, sticky="nswe")

        self.sensorFocus = SensorConfig.SENSOR_DICT[name]["Focus"]
        self.focus = tk.StringVar()

        focusText = tk.Label(self)
        focusText.configure(font="Times 15")
        focusText.configure(bg=self.ctrl.TOP_SCRN_CLR)
        focusText.config(textvariable=self.focus)
        focusText.grid(row=1, column=0, sticky="nswe")

    def updateData(self, data):
        ff= ""
        focus = self.sensorFocus
        if type(focus) is list and type(data) is list: 
            for f,d in zip(focus,data):
                ff = ff + '''{0} : {1}\n'''.format(f,d)
            focus = ff
        else:
            focus = '''{0} : {1}\n'''.format(focus,data)
        self.focus.set(focus)

class BottomBar(tk.Frame):
    HEIGHT = 4
    WIDTH  = 13
    LOGO   = "images/Zephyrus-IAQ-Logo.png"

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
        stSp = tk.Button(self, textvariable=self.logger_txt)
        stSp.configure(font="Times 13 bold")
        stSp.configure(command=lambda : self.ctrl.update_logger(self))
        stSp.configure(height=self.HEIGHT, width=self.WIDTH)
        
        stSp.configure(bg=self.ctrl.TOP_SCRN_CLR)
        stSp.grid(row=0,column=0, sticky="nsew")

        #######################################################################
        # Mount/Eject USB
        #######################################################################
        self.usb_txt = tk.StringVar()
        self.usb_txt.set(self.ctrl.USB_MOUNT)
        self.usb_btn = tk.Button(self, textvariable=self.usb_txt)
        self.usb_btn.configure(font="Times 13 bold")
        self.usb_btn.configure(command=lambda : self.ctrl.update_usb(self))
        self.usb_btn.configure(width=self.WIDTH, height=self.HEIGHT)
        self.usb_btn.configure(bg=self.ctrl.TOP_SCRN_CLR)
        self.usb_btn.grid(row=0,column=1, sticky="nsew")

        #######################################################################
        # Logo (Image)
        #######################################################################
        im = Image.open(self.LOGO)
        im = im.resize((506, 100), Image.ANTIALIAS)

        img = ImageTk.PhotoImage(image = im)
        logoLabel = tk.Label(self, image = img)
        logoLabel.image = img
        logoLabel.configure(bg = self.ctrl.TOP_SCRN_CLR)
        logoLabel.grid(row=0, column=2, sticky="nsew")


class TopBar(tk.Frame):
    HEIGHT = 1
    WIDTH  = 14

    TEMP_F    = " [F]"
    TEMP_C    = " [C]"
    TEMP_UNIT = TEMP_F
    HUM_UNIT  = " [RH]"
    PR_UNIT   = " [hPa]"

    SETTINGS_IMG    = "images/Settings-Logo.png"
    BACK_IMG        = "images/Back-Icon.png"
    SETTINGS_VIEW   = "Settings"
    SENSORGRID_VIEW = "SensorGrid"

    settings        = None
    settings_img    = None
    back_img        = None
    current_view    = None
    ctrl            = None
    time            = None
    date            = None
    location        = None

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller

        #######################################################################
        # Date
        #######################################################################

        self.date = tk.StringVar()
        self.updateDate()
        dateLabel = tk.Label(self, textvariable=self.date)
        dateLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        dateLabel.configure(font="Times 15")
        dateLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        dateLabel.grid(row=0,column=0)

        #######################################################################
        # Time
        #######################################################################
        self.time = tk.StringVar()
        self.updateTime()
        timeLabel = tk.Label(self, textvariable=self.time)
        timeLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        timeLabel.configure(font="Times 15")
        timeLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        timeLabel.grid(row=1,column=0)

        #######################################################################
        # Temperature (BME680)
        #######################################################################
        nameLabel = tk.Label(self, text = "Temp")
        nameLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        nameLabel.configure(font="Times 15")
        nameLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        nameLabel.grid(row=0,column=2)

        self.temp = tk.StringVar()
        tempLabel = tk.Label(self, textvariable=self.temp)
        tempLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        tempLabel.configure(font="Times 15")
        tempLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        tempLabel.grid(row=1,column=2)

        #######################################################################
        # Humidity (BME680)
        #######################################################################
        nameLabel = tk.Label(self, text = "Humidity")
        nameLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        nameLabel.configure(font="Times 15")
        nameLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        nameLabel.grid(row=0,column=3)


        self.humidity = tk.StringVar()
        humidityLabel = tk.Label(self,textvariable=self.humidity)
        humidityLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        humidityLabel.configure(font="Times 15")
        humidityLabel.configure(bg = self.ctrl.TOP_SCRN_CLR)
        humidityLabel.grid(row=1,column=3)

        #######################################################################
        # Barometric Pressure (BME680)
        #######################################################################
        nameLabel = tk.Label(self, text = "Pressure")
        nameLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        nameLabel.configure(font="Times 15")
        nameLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        nameLabel.grid(row=0,column=4)

        self.pressure = tk.StringVar()
        pressureLabel = tk.Label(self, textvariable = self.pressure)
        pressureLabel.configure(font="Times 15")
        pressureLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        pressureLabel.configure(bg = self.ctrl.TOP_SCRN_CLR)
        pressureLabel.grid(row=1,column=4)

        #######################################################################
        # Location (GPS)
        #######################################################################
        nameLabel = tk.Label(self, text = "Location")
        nameLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        nameLabel.configure(font="Times 15")
        nameLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        nameLabel.grid(row=0,column=5)

        self.location = tk.StringVar()
        locationLabel = tk.Label(self, textvariable = self.location)
        locationLabel.configure(font="Times 15")
        locationLabel.configure(height=self.HEIGHT,width=self.WIDTH)
        locationLabel.configure(bg = self.ctrl.TOP_SCRN_CLR)
        locationLabel.grid(row=1,column=5)


        #######################################################################
        # Settings (Button)
        #######################################################################
        self.current_view = self.SENSORGRID_VIEW
        settings_img = Image.open(self.SETTINGS_IMG)
        settings_img = settings_img.resize((40, 40), Image.ANTIALIAS)
        back_img     = Image.open(self.BACK_IMG)
        back_img     = back_img.resize((40, 40), Image.ANTIALIAS)

        self.settings_img = ImageTk.PhotoImage(image = settings_img)
        self.back_img     = ImageTk.PhotoImage(image = back_img)

        self.settings = tk.Button(self)
        self.settings.configure(image = self.settings_img)
        self.settings.image = self.settings_img
        self.settings.configure(command=lambda : self.ctrl.toggle_settings(self))
        self.settings.configure(bg = self.ctrl.TOP_SCRN_CLR)
        self.settings.grid(row=-0, column=6, rowspan=2, stick="nsew")


    def updateDate(self):
        date = datetime.datetime.now().date()
        self.date.set(str(date.strftime('%b %d, %Y')))

    def updateTime(self):
        time = datetime.datetime.now().time()
        self.time.set(str(time.strftime('%-I:%M:%S %p')))

    def updateTemp(self, temp):
        try:
            # Fahrenheit
            if self.TEMP_UNIT == self.TEMP_F:
                fahren   =  "{0:.3f}".format(round(float(temp*1.8 + 32),3))
                self.temp.set(fahren + self.TEMP_UNIT)
            # Celsius
            else:
                self.temp.set("{0:.3f}".format(temp))
        except TypeError:
            pass
        
    def updateHumidity(self, humidity):
        try:
            self.humidity.set(str(humidity) + self.HUM_UNIT)
        except TypeError:
            self.humidity.set("")

    def updatePressure(self, pressure):
        try:
            self.pressure.set(str(pressure) + self.PR_UNIT)
        except TypeError:
            self.pressure.set("")

    def updateLocation(self, location):
        pass
