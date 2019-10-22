import Tkinter as tk
import time
import csv


class Main(tk.Tk):

    def __init__(self, *args, **kwargs):
        tk.Tk.__init__(self, *args, **kwargs)
        self.geometry('800x480')
        self.title('TESTER')
        self.resizable(0, 0)

        localtime = time.asctime(time.localtime(time.time()))
        labelt = tk.Label(self, text=localtime).pack()

        container = tk.Frame(self)
        container.pack(side="top", fill="both", expand=True)

        self.frames = {}
        for F in (StartPage, Button1, Button2, Button3, Button4, Button5, Button6, Button7, Button8, Button9, Button10,
                  ButtonInfo):
            page_name = F.__name__
            frame = F(parent=container, controller=self)
            self.frames[page_name] = frame

            frame.grid(row=0, column=0, sticky="nsew")

        self.show_frame("StartPage")

    def show_frame(self, page_name):
        frame = self.frames[page_name]
        frame.tkraise()


class StartPage(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is the start page").grid(row=0, column=5)

        button1 = tk.Button(self, text="Button 1", height=2, width=10,
                            command=lambda: controller.show_frame("Button1")).grid(row=1, column=0)
        button2 = tk.Button(self, text="Button 2", height=2, width=10,
                            command=lambda: controller.show_frame("Button2")).grid(row=1, column=1)
        button3 = tk.Button(self, text="Button 3", height=2, width=10,
                            command=lambda: controller.show_frame("Button3")).grid(row=2, column=0)
        button4 = tk.Button(self, text="Button 4", height=2, width=10,
                            command=lambda: controller.show_frame("Button4")).grid(row=2, column=1)
        button5 = tk.Button(self, text="Button 5", height=2, width=10,
                            command=lambda: controller.show_frame("Button5")).grid(row=3, column=0)
        button6 = tk.Button(self, text="Button 6", height=2, width=10,
                            command=lambda: controller.show_frame("Button6")).grid(row=3, column=1)
        button7 = tk.Button(self, text="Button 7", height=2, width=10,
                            command=lambda: controller.show_frame("Button7")).grid(row=4, column=0)
        button8 = tk.Button(self, text="Button 8", height=2, width=10,
                            command=lambda: controller.show_frame("Button8")).grid(row=4, column=1)
        button9 = tk.Button(self, text="Button 9", height=2, width=10,
                            command=lambda: controller.show_frame("Button9")).grid(row=5, column=0)
        button10 = tk.Button(self, text="Button 10", height=2, width=10,
                             command=lambda: controller.show_frame("Button10")).grid(row=5, column=1)
        button10 = tk.Button(self, text="Button Info", height=2, width=15,
                             command=lambda: controller.show_frame("ButtonInfo")).grid(row=0, column=0)


class Button1(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 1").pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class Button2(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 2").pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class Button3(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 3").pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class Button4(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 4").pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class Button5(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 5").pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class Button6(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 6").pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class Button7(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 7").pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class Button8(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 8").pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class Button9(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 9")
        label.pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class Button10(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button 10").pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).pack()


class ButtonInfo(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="This is Button Info").grid(row=0, column=0)
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage")).grid(
            row=6, column=0)

        label1 = tk.Label(self, text="Enter Information").grid(row=2, column=0)
        input1 = tk.StringVar()
        entry1 = tk.Entry(self, textvar=input1).grid(row=2, column=1)
        button1 = tk.Button(self, text="Enter").grid(row=2, column=2)

        label2 = tk.Label(self, text="Enter Information").grid(row=3, column=0)
        input2 = tk.StringVar()
        entry2 = tk.Entry(self, textvar=input2).grid(row=3, column=1)
        button2 = tk.Button(self, text="Enter").grid(row=3, column=2)

        label3 = tk.Label(self, text="Enter Information").grid(row=4, column=0)
        input3 = tk.StringVar()
        entry3 = tk.Entry(self, textvar=input3).grid(row=4, column=1)
        button3 = tk.Button(self, text="Enter").grid(row=4, column=2)

        label4 = tk.Label(self, text="Enter Information").grid(row=5, column=0)
        input4 = tk.StringVar()
        entry4 = tk.Entry(self, textvar=input4).grid(row=5, column=1)
        button4 = tk.Button(self, text="Enter").grid(row=5, column=2)


if __name__ == "__main__":
    app = Main()
    app.mainloop()
