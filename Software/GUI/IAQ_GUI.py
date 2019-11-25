import Tkinter as tk
import ScrolledText as tkst
import time
import csv
from enum import Enum
import datetime
from itertools import cycle

class GUI(tk.Tk):
    MAX_PORTS = 6
    BACKGROUND_COLOR = 'LightSteelBlue3'
    SENSOR_BUTN_CLR  = 'PaleGreen4'
    TOP_SCRN_CLR     = 'light steel blue'
    LOG_ON  = 'Start Logging'
    LOG_OFF = 'Stop Logging'

    AnalogFrames = ["A0", "A1", "A2", "A3","A4", "A5"]
    SensorFrames = AnalogFrames + ["SDC30", "SDS011"]
    FramesList   = SensorFrames

    _sensor_update_flag = False
    _logger_status_flag = False
    _usb_status_flag    = None
    sensorList = None
    portStatus = {}
    container = None
    frames = {}

    def __init__(self, sensorConfigDict, *args, **kwargs):
        self.portStatus = sensorConfigDict
        tk.Tk.__init__(self, *args, **kwargs)
        geometry = ('800x480')
        self.geometry(geometry)
        self.title('Indoor Air Quality Logger')
        self.resizable(0, 0)
        self.configure(bg=self.BACKGROUND_COLOR)

        self.container = tk.Frame(self)
        self.container.grid(row=0,column=0)
        self._init_frames()
        self.updatePortStatus()
        self.show_frame("StartPage")

    def _init_frames(self):
        # StartPage frame
        frame = StartPage(parent=self.container,controller=self)
        self.frames["StartPage"] = frame
        frame.grid(row=0, column=0, sticky="nsew")
        frame.configure(bg=self.BACKGROUND_COLOR)
        # SensorView frames
        for port in self.SensorFrames:
            sframe = SensorView(parent=self.container, controller=self, port=port)
            sframe.configure(bg=self.BACKGROUND_COLOR)
            self.frames[port] = sframe
            sframe.grid(row=0, column=0, sticky="nsew")
        # SensorSetupView frame
        frame = SensorSetupView(parent=self.container,controller=self)
        frame.configure(bg=self.BACKGROUND_COLOR)
        self.frames["SensorSetupView"] = frame
        frame.grid(row=0, column=0, sticky="nsew")

    def _output(self,msg=None,frame=None):
        # TODO: Handle Error
        if frame not in self.frames.keys(): return
        if (msg == None): msg = "Output Error: Invalid message"
        frame = self.frames[frame]
        frame.printScrolledText(msg)

    #################################################################################
    # External API: Used by IAQ_Logger 
    # The GUI keeps track of user input with status flags in Internal Callbacks
    # The Logger needs to perform actions and synchronize itself with the below functions
    #################################################################################

    def displayData(self,port,data):
        self._output(data,port)

    # TODO: Optimize update to only iterate through out of date items
    def updatePortStatus(self):
        for sensorName,sensorConfig in self.portStatus.items():
            configDict = dict(sensorConfig)
            self.u_StartPage_SensorView_Button(configDict)
            port = dict(sensorConfig)["port"]
        self.u_SensorSetupView()

    def updateUsbStatus(self, usb_status):
        self._usb_status_flag = usb_status
        try:
            startpage = self.frames["StartPage"]
            if self._usb_status_flag == True:
                startpage.usb_txt.set("Eject USB")
                startpage.usb_btn['state'] = 'normal'
            elif self._usb_status_flag == False:
                startpage.usb_txt.set("Mount USB")
                startpage.usb_btn['state'] = 'normal'
            elif self._usb_status_flag == None:
                startpage.usb_txt.set("No USB")
                startpage.usb_btn['state'] = 'disabled'
        except KeyError:
            raise KeyError('StartPage does not exist')

    def updateLoggerStatus(self, logger_status):
        self._logger_status_flag = logger_status
        try:
            startpage = self.frames["StartPage"]
            if self._logger_status_flag == True:
                startpage.logger_txt.set(self.LOG_OFF)
            elif self._logger_status_flag == False:
                startpage.logger_txt.set(self.LOG_ON)
        except KeyError:
            raise KeyError('StartPage does not exist')

    def checkUserUpdates(self):
        flag = self._sensor_update_flag
        self._sensor_update_flag = False
        return flag

    def get_portStatus(self):
        return self.portStatus

    def getUsbStatus(self):
        return self._usb_status_flag

    def getLoggerStatus(self):
        return self._logger_status_flag

    #################################################################################
    # Internal Callbacks
    #################################################################################

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
        
    #################################################################################
    # Internal API: Database, User Input and GUI Synchronization
    #################################################################################
    # Update the SensorView Buttons on StartPage
    # The update is based off of the configuration dictionary from setup database
    def u_StartPage_SensorView_Button(self,configDict):
        startpage = self.frames["StartPage"]
        port = configDict["port"]
        if port not in startpage.buttons.keys(): return
        status = configDict["status"]
        name   = configDict['type']
        name = name.replace(',','\n')
        if status == "OFF":
            color = "grey"
        elif status == "ON":
            color = self.SENSOR_BUTN_CLR
        startpage.buttons[port].config(text=name)
        startpage.buttons[port].config(bg=color)
        startpage.btn_names[port] = name

    def u_SensorSetupView(self):
        frame = self.frames["SensorSetupView"]
        frame.update_SensorSetupView()

    def update_All(self,configDict):
        self._sensor_update_flag = True
        self.u_StartPage_SensorView_Button(configDict)
        self.u_SensorSetupView()
    #################################################################################

class StartPage(tk.Frame):
    scrolledText = None
    buttonList = []
    ctrl = None
    buttons = {}
    btn_names = {}
    MAX_SENSORS = 6
    logger_txt = None
    usb_txt = None
    usb_btn = None

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller

    #################################################################################
    # Date
    #################################################################################
        date = datetime.datetime.now().date()
        date = str(date.strftime('%b %d, %Y'))
        dateLabel = tk.Label(self, text=date,height=5,width=20)
        dateLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        dateLabel.grid(row=0,column=0)


    #################################################################################
    # Time
    #################################################################################
        time = datetime.datetime.now().time()
        time = str(time.strftime('%-I:%M:%S %p'))
        timeLabel = tk.Label(self, text=time,height=5,width=20)
        timeLabel.configure(bg=self.ctrl.TOP_SCRN_CLR)
        timeLabel.grid(row=0,column=1)

    #################################################################################
    # Start/Stop Data Recording
    #################################################################################
        self.logger_txt = tk.StringVar()
        self.logger_txt.set(self.ctrl.LOG_ON)
        StSp = tk.Button(self, textvariable=self.logger_txt,height=5,width=15,command=lambda : self.ctrl.update_logger(self))
        StSp.configure(bg=self.ctrl.TOP_SCRN_CLR)
        StSp.grid(row=9,column=0)

    #################################################################################
    # Mount/Eject USB
    #################################################################################
        self.usb_txt = tk.StringVar()
        self.usb_txt.set("Mount USB")
        self.usb_btn = tk.Button(self, textvariable=self.usb_txt,height=5,width=15,command=lambda : self.ctrl.update_usb(self))
        self.usb_btn.configure(bg=self.ctrl.TOP_SCRN_CLR)
        self.usb_btn.grid(row=9,column=1)
       
    #################################################################################
    # Temperature (BME680)
    #################################################################################

    #################################################################################
    # Humidity (BME680)
    #################################################################################

    #################################################################################
    # Barometric Pressure (BME680)
    #################################################################################

    #################################################################################
    # CO2
    #################################################################################


    #################################################################################
    # MQ Gas Sensors (x6)
    #################################################################################




   
    #################################################################################
    # Menu Bar
    #################################################################################

    #################################################################################
    # Setup Buttons for Sensors
    #################################################################################
        buttonCount = 0
        nRow = cycle(range(6,self.MAX_SENSORS+6))
        nCol = cycle(range(0,2))
        row = 2
        col = 0
        for frameName in controller.FramesList:

            if buttonCount == 2:
                buttonCount = 0
                row = nRow.next()
            col = nCol.next()
            buttonCount += 1
            buttonName = frameName
            for items in self.ctrl.portStatus.values():
                config = dict(items)
                if config['port'] == frameName:
                    buttonName = str(config['type'])
                    key = buttonName
                    buttonName = buttonName.replace(',','\n')
                    break
            self.btn_names[key] = buttonName
            button = tk.Button(self,text=self.btn_names[key],height=5,width=15,
                    command=lambda frame=frameName: controller.show_frame(frame))
            button.grid(row=row,column=col)
            button.configure(wraplength=200)
            self.buttons[frameName] = button
    #################################################################################


class SensorView(tk.Frame):
    port = None
    scrolledText = None
    parent = None
    controller = None
    frames = {}
    buttons = {}

    def __init__(self, parent, controller, port):
        tk.Frame.__init__(self, parent)
        self.port = port
        button = tk.Button(self, text="Go to the Main Page", command=lambda: self.controller.show_frame("StartPage"))
        button.grid(row=0, column=0)

        self.parent = parent
        self.controller = controller
        self.btn_factory()

        # Scrolled Text
        self.scrolledText = tkst.ScrolledText(self)
        self.scrolledText.grid(row=1, column=3, rowspan=6)
        s = tk.Scrollbar(self)
        s.grid(row=1, column=4, rowspan=6)

    def btn_factory(self):
        button = tk.Button(self,text="On",height=2,width=15,
                command=lambda : self.turn_on())
        self.buttons["On"] = button
        button.grid(row=0,column=1)
        button = tk.Button(self,text="Off",height=2,width=15,
                command=lambda : self.turn_off())
        self.buttons["Off"] = button
        button.grid(row=1,column=1)
        button = tk.Button(self,text="Change Sensor",height=2,width=15,
                command=lambda : self.change_sensor())
        self.buttons["Change"] = button
        button.grid(row=1,column=2)

    #################################################################################
    # Callbacks
    #################################################################################
    def turn_on(self):
        self.toggle_status("ON")
    def turn_off(self):
        self.toggle_status("OFF")
    def change_sensor(self):
        self.turn_off()
        self.controller.u_SensorSetupView()
        self.controller.show_frame("SensorSetupView")

    #################################################################################
    # Callback Helpers
    #################################################################################
    def toggle_status(self,status):
        for sensorName,config in self.controller.portStatus.items():
            config = dict(config)
            if config["port"] == self.port:
                config["status"] = status
                self.controller.portStatus[sensorName] = config
                self.controller.update_All(config)

    #################################################################################
    # External API: Used by the GUI controller
    #################################################################################
    def printScrolledText(self,msg=None):
        if (msg != None):
            self.scrolledText.insert(tk.INSERT,msg + "\n")

class SensorSetupView(tk.Frame):
    buttons = {}
    controller = None
    DEFAULT_COLOR = "#d9d9d9"

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.parent = parent
        self.controller = controller
        button = tk.Button(self, text="Go to the Main Page", command=lambda: self.controller.show_frame("StartPage"))
        button.grid(row=1, column=0)
        self.createSensorOptions()

    def update_SensorSetupView(self):
        self.createSensorOptions()
        self.change_button_color()

    def createSensorOptions(self):
        portStatus = self.controller.portStatus
        row = 2
        col = 0
        buttonCount = 0
        for sensorName,portconfig in portStatus.items():
            portconfig = dict(portconfig)
            status = portconfig["status"]

            if (buttonCount == 2):
                row += 1
                buttonCount = 0

            button = tk.Button(self,text=sensorName,height=2,width=15,
                    command=lambda frame=sensorName: [self.show_frame(frame)])

            # Set color grey if sensor already assigned to a port
            if status == "ON":
                color = "grey"
                button.config(bg=color)

            button.grid(row=row,column=col)
            self.buttons[sensorName] = button

            buttonCount += 1
            # toggle column position
            col = 1 if (col == 0) else 0

    def change_button_color(self):
        for sensorName,portconfig in self.controller.portStatus.items():
            config = dict(portconfig)
            status = config["status"]
            if status == "ON":
                color = "grey"
                state = "disabled"
            elif status == "OFF":
                color = self.DEFAULT_COLOR
                state = "normal"
            self.buttons[sensorName].config(bg=color)
            self.buttons[sensorName].config(state=state)
