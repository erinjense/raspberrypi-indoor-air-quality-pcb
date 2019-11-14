import Tkinter as tk
import ScrolledText as tkst
import time
import csv
from enum import Enum

class GUI(tk.Tk):
    MAX_PORTS = 6

    AnalogFrames = ["A0", "A1", "A2", "A3","A4", "A5"]
    SensorFrames = AnalogFrames + ["SDC30", "SDS011"]
    FramesList   = SensorFrames

    _sensor_update_flag = False
    sensorList = None
    portStatus = {}
    container = None
    frames = {}

    def __init__(self, sensorConfigDict, *args, **kwargs):
        self.portStatus = sensorConfigDict
        tk.Tk.__init__(self, *args, **kwargs)
        geometry = str(self.winfo_screenwidth()) + 'x'+str(self.winfo_screenheight())
        self.geometry(geometry)
        self.title('Indoor Air Quality Logger')
        self.resizable(0, 0)

        gmtime = time.asctime(time.gmtime(time.time()))
        tk.Label(self, text=gmtime).pack()

        self.container = tk.Frame(self)
        self.container.pack(side="top", fill="both", expand=True)
        self._init_frames()
        self.updatePortStatus()
        self.show_frame("StartPage")

    def _init_frames(self):
        # StartPage frame
        frame = StartPage(parent=self.container,controller=self)
        self.frames["StartPage"] = frame
        frame.grid(row=0, column=0, sticky="nsew")
        # SensorView frames
        for port in self.SensorFrames:
            sframe = SensorView(parent=self.container, controller=self, port=port)
            self.frames[port] = sframe
            sframe.grid(row=0, column=0, sticky="nsew")
        # SensorSetupView frame
        frame = SensorSetupView(parent=self.container,controller=self)
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

    def checkUserUpdates(self):
        flag = self._sensor_update_flag
        self._sensor_update_flag = False
        return flag

    def get_portStatus(self):
        return self.portStatus

    def startpage_output(self,msg=None): return self._output(msg,"StartPage")

    #################################################################################
    # Callbacks
    #################################################################################

    def show_frame(self, page_name=None):
        frame = self.frames[page_name]
        frame.tkraise()

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
        name   = configDict["name"]
        if status == "OFF":
            color = "grey"
        elif status == "ON":
            color = "green"
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

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.ctrl = controller
        buttonCount = 0
        row = 1
        col = 0
        for frameName in controller.FramesList:
            if (buttonCount == 2):
                row += 1
                buttonCount = 0

            self.btn_names[frameName] = frameName
            button = tk.Button(self,text=self.btn_names[frameName],height=2,width=15,
                    command=lambda frame=frameName: controller.show_frame(frame))
            button.grid(row=row,column=col)
            self.buttons[frameName] = button

            buttonCount += 1
            # toggle column position
            col = 1 if (col == 0) else 0

        if (self.scrolledText == None):
            self.scrolledText = tkst.ScrolledText(self)
            self.scrolledText.grid(row=1, column=3, rowspan=6)

        s = tk.Scrollbar(self)
        s.grid(row=1, column=4, rowspan=6)

    def printScrolledText(self,msg=None):
        if (msg != None):
            self.scrolledText.insert(tk.INSERT,msg + "\n")


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
        button.grid(row=1, column=0)

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
