from tkinter import *
from PIL import ImageTk
from tkinter.ttk import *
import time
import threading


class init_root(Tk):
	def __init__(self):
		super().__init__()
		self.geometry("600x600")
		self.resizable(width=False, height=False)
		self.title("FlashLAB")
		self.configure(background='#6abea7')
		self.iconbitmap('img/logooooico.ico')
		self.Btn()

	def Btn(self):
        self.btn = Button(self, text='Deploy', command=self.traitement)
        self.btn.grid(row=2,column=10)
        self.progress = Progressbar(self, orient=HORIZONTAL,length=500, mode='indeterminate')
		# root = Tk()
# Parametres basiques


progress = Progressbar(root, orient=HORIZONTAL, length=400,mode='determinate')

def bar():
	progress['value']=20
	root.update_idletasks()
	time.sleep(1)
	progress['value']=50
	root.update_idletasks()
	time.sleep(1)
	progress['value']=80
	root.update_idletasks()
	time.sleep(1)
	progress['value']=100
	root.update_idletasks()
	time.sleep(1)

progress.pack()
Button(root, text='Click', command=bar).pack()



if __name__ == 'main':
	root = init_root()
	root.mainloop()