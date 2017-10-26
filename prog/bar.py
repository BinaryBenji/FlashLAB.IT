from tkinter import Button, Tk, HORIZONTAL

from tkinter.ttk import Progressbar
import time
import threading

class MonApp(Tk):
    def __init__(self):
        super().__init__()
        self.initWin()
        self.initBtn()
        
    def initWin(self):
        self.geometry("600x600")
        self.resizable(width=False, height=False)
        self.title("FlashLAB")
        self.configure(background='#6abea7')
        self.iconbitmap('img/logooooico.ico')
        
    def initBtn(self):
        self.btn = Button(self, text='Deploy', width=25,command=self.traitement, bg='#6abea7')
        self.btn.grid(row=5,column=5)
        self.progress = Progressbar(self, orient=HORIZONTAL,length=500,  mode='indeterminate')


    # Progress bar
    def traitement(self):
        def real_traitement():
            self.progress.grid(row=5,column=5)
            time.sleep(3)
            self.progress.start()
            time.sleep(3)
            self.progress.stop()
            self.progress.grid_forget()
            self.btn['state']='normal'

        self.btn['state']='disabled'
        threading.Thread(target=real_traitement).start()


if __name__ == '__main__':

    app = MonApp()
    app.mainloop()