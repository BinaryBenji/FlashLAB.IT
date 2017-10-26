import tkinter
from tkinter import *
from tkinter.ttk import Progressbar
import time
import threading

class App_Build():
    def __init__(self, master):
        self = tkinter.Tk()
        self.geometry("600x600")
        self.resizable(width=False, height=False)
        self.title("FlashLAB")
        self.configure(background='#6abea7')
        self.iconbitmap('img/logooooico.ico')
        self.Btn()


            # Text
        # T = Text(self, height=100, width=300)    
        # T.pack()
        # T.insert(END, "fhsdhfidshf")

        # Button, Launching progress bar
        # self.btn = Button(self, text='Deploy', command=self.traitement)
        # self.btn.grid(row=2,column=10)
        # self.progress = Progressbar(self, orient=HORIZONTAL,length=500, mode='indeterminate')

    def Btn(self):
        self.btn = Button(self, text='Deploy', command=self.traitement)
        self.btn.grid(row=2,column=10)
        self.progress = Progressbar(self, orient=HORIZONTAL,length=500, mode='indeterminate')



    def traitement(self):
        def real_traitement():
            self.progress.grid(row=0,column=0)
            self.progress.start()
            # Tps attente avant disparition de la barre
            time.sleep(10)
            self.progress.stop()
            self.progress.grid_forget()

            self.btn['state']='normal'

        self.btn['state']='disabled'
        threading.Thread(target=real_traitement).start()


# class MyImg(Tk):
#     def __init__(self):
#         super().__init__()
#         frame = Frame(self)
#         frame.pack()
#         canvas = Canvas(self, bg='#6abea7', width=600, height=600)
#         canvas.pack()
#         photoimage = ImageTk.PhotoImage(file='img/logtrans.png')
#         canvas.create_image(300,300,image=photoimage)


if __name__ == '__main__':
    root = Tk()
    app = App_Build(root)
    # root = MyImg()
    root.mainloop()