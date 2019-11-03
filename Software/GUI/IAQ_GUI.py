import Tkinter as tk
import ScrolledText as tkst
import time
import csv
from enum import Enum

class GUI(tk.Tk):

    SensorFrames = ["ViewCO2", "ViewCombustible", "ViewMethane", "ViewNaturalGas",
                    "ViewPropane", "ViewCO", "ViewAlcohol", "ViewParticulate"]

    FramesList = SensorFrames + ["ViewSystemInfo"]

    ButtonNames = ["Carbon Dioxide", "Combustible Gas", "Methane", "Natural Gas",
                   "Propane", "Carbon Monoxide", "Alcohol", "Particulate",
                   "System Info"]

    container = None

    frames = {}

    def __init__(self, *args, **kwargs):
        tk.Tk.__init__(self, *args, **kwargs)
        self.geometry('800x480')
        self.title('Indoor Air Quality Logger')
        self.resizable(0, 0)

        gmtime = time.asctime(time.gmtime(time.time()))
        tk.Label(self, text=gmtime).pack()

        self.container = tk.Frame(self)
        self.container.pack(side="top", fill="both", expand=True)
        self._init_frames()
        self.show_frame("StartPage")

    def _init_frames(self):
        frame = StartPage(parent=self.container,controller=self)
        self.frames["StartPage"] = frame
        frame.grid(row=0, column=0, sticky="nsew")
        for f,n in zip(self.SensorFrames,self.ButtonNames):
            frame = SensorView(parent=self.container, controller=self,name=n)
            self.frames[f] = frame
            frame.grid(row=0, column=0, sticky="nsew")
        frame = ViewSystemInfo(parent=self.container,controller=self)
        self.frames["ViewSystemInfo"] = frame
        frame.grid(row=0, column=0, sticky="nsew")

    def _output(self,msg=None,frame=None):
        if (msg == None):
            msg = "Output Error: Invalid message"
        if (frame == None):
            frame = "StartPage"
            msg = "Output Error: Invalid frame"
        frame = self.frames[frame]
        frame.printScrolledText(msg)

    def startpage_output(self,msg=None): return self._output(msg,"StartPage")
    def co2_output(self,msg=None): return self._output(msg,"ViewCO2")
    def combustible_output(self,msg=None): return self._output(msg,"ViewCombustible")
    def methane_output(self,msg=None): return self._output(msg,"ViewMethane")
    def naturalgas_output(self,msg=None): return self._output(msg,"ViewNaturalGas")
    def propane_output(self,msg=None): return self._output(msg,"ViewPropane")
    def co_output(self,msg=None): return self._output(msg,"ViewCO")
    def alcohol_output(self,msg=None): return self._output(msg,"ViewAlcohol")
    def particulate_output(self,msg=None): return self._output(msg,"ViewParticulate")

    def show_frame(self, page_name):
        frame = self.frames[page_name]
        frame.tkraise()

class StartPage(tk.Frame):
    scrolledText = None
    buttonList = []

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        buttonCount = 0
        row = 1
        col = 0
        # Add a button for each frame to StartPage
        for frame,name in zip(controller.FramesList,controller.ButtonNames):
            # increment row after previous row has two buttons
            if (buttonCount == 2):
                row += 1
                buttonCount = 0
            # Place Button
            button = tk.Button(self,text=name,height=2,width=15,command=lambda frame=frame: controller.show_frame(frame))
            button.grid(row=row,column=col)
            self.buttonList.append(button)
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

    scrolledText = None
    def __init__(self, parent, controller, name):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is the " + name + " Sensor")
        label.grid(row=0, column=0)
        button = tk.Button(self, text="Go to the Main Page", command=lambda: controller.show_frame("StartPage"))
        button.grid(row=1, column=0)

        if (self.scrolledText == None):
            self.scrolledText = tkst.ScrolledText(self)
            self.scrolledText.grid(row=1, column=3, rowspan=6)

        s = tk.Scrollbar(self)
        s.grid(row=1, column=4, rowspan=6)

    def printScrolledText(self,msg=None):
        if (msg != None):
            self.scrolledText.insert(tk.INSERT,msg + "\n")


class ViewSystemInfo(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="Sensor System Info")
        label.grid(row=0, column=0)
        button = tk.Button(self, text="Go to the Main Page", command=lambda: controller.show_frame("StartPage"))
        button.grid(row=1, column=0)

        def retrieve_input():
            data1w = open('dataBInfo.txt', 'w+')

            inputValue1 = entry1.get()
            inputValue2 = entry2.get()
            inputValue3 = entry3.get()
            inputValue4 = entry4.get()
            inputValue5 = entry5.get()

            data1w.write(inputValue1)
            data1w.write(',')
            data1w.write(inputValue2)
            data1w.write(',')
            data1w.write(inputValue3)
            data1w.write(',')
            data1w.write(inputValue4)
            data1w.write(',')
            data1w.write(inputValue5)
            data1w.write('')

            data1w.close()

            entry1.delete(0, tk.END)
            entry2.delete(0, tk.END)
            entry3.delete(0, tk.END)
            entry4.delete(0, tk.END)
            entry5.delete(0, tk.END)

        tk.Entry(self).grid(row=2, column=1)
        tk.Entry(self).grid(row=3, column=1)
        tk.Entry(self).grid(row=4, column=1)
        tk.Entry(self).grid(row=5, column=1)
        tk.Entry(self).grid(row=6, column=1)

        buttonEnter = tk.Button(self, text="Enter", command=lambda: retrieve_input())
        buttonEnter.grid(row=7, column=1)

        tk.Label(self, text="Logger Id: ").grid(row=2, column=0)
        tk.Label(self, text="Entry line 2").grid(row=3, column=0)
        tk.Label(self, text="Entry line 3").grid(row=4, column=0)
        tk.Label(self, text="Entry line 4").grid(row=5, column=0)
        tk.Label(self, text="Entry line 5").grid(row=6, column=0)

