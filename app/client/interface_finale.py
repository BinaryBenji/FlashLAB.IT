from tkinter import *
import tkinter as Tkinter
from PIL import ImageTk
#from progress.bar import Bar
import tkinter.ttk as ttk
import time
import requests
import threading

#Paramètre de la fenêtre
root = Tk()
root.geometry("550x700")
root.resizable(width=False, height=False)
root.title("FlashLAB")
root.configure(background='#6abea7')

root.iconbitmap('img/logooooico.ico')
#img = PhotoImage(file='img/logooooico.ico')
#root.tk.call('wm', 'iconphoto', root._w, img)

#Fenêtre pour les Canvas
frame = Frame(root, bg='#6abea7')
frame.pack(fill=BOTH)

#Fonction test

    

#Fonction du bouton
def nouvelle():
    
    #Fonction qui s'execute a la fin du timer
    def test():
        pb_hd.pack_forget()
        status.pack_forget()
        status2 = Label(root, text="Infrastructure deployed. Go to : 10.10.10.1:80", bd=1, relief=SUNKEN, anchor=W)
        status2.pack(side=BOTTOM, fill=X)
        

    req = requests.post("http://10.10.10.196:7777", data={'key' : '$2a$10$33USXSTL1p7WuPIah5TwX.shP3z6mRymUqFv1BOZgXm.pJhzoblsi'})  #requete au serveur
    print(req.status_code, req.reason)
    print(req.text[:300] + '...')

    pb_hd = ttk.Progressbar(orient='horizontal', mode='determinate', maximum=1800)  #progress bar
    pb_hd.pack(fill=X, side=TOP)
    pb_hd.start()
  
  
    status = Label(root, text="Preparing to deploy..", bd=1, relief=SUNKEN, anchor=W)  #label en bas de page
    status.pack(side=BOTTOM, fill=X)
    
    BoutonLancer.config(state="disabled") #desactiver le bouton après le clic
    BoutonLancer.configure(bg = "#7C9885")
    
    t = threading.Timer(90.0, test) #timer du deploiement
    t.start()
        
    root.mainloop()

if __name__ == '__nouvelle__':
  nouvelle()



#Canvas titre
titre = '   FLASHLAB'
rndfont = 15 #taille de la police
canvas_titre = Canvas(frame, bg='#6abea7', height=50, highlightthickness=0, relief='ridge')
canvas_titre.pack(side=TOP, fill=X)
canvas_titre.create_text(270, 30, font=("Purisa", rndfont), text=titre)

#Canvas du logo
canvas = Canvas(frame, bg='#6abea7', height=250, bd=0, highlightthickness=0, relief='ridge')
canvas.pack(side=TOP, fill=X)

#photoimage = ImageTk.PhotoImage(file='img/logopoto2.png')
photoimage = ImageTk.PhotoImage(file='img/logopoto2.png')
canvas.create_image(280,120,image=photoimage)

#Canvas du slogan
slogan = 'Deploy, research and hack'
rndfont = 18
canvas_slogan = Canvas(frame, height=100)
canvas_slogan.pack(side=TOP, fill=X)
canvas_slogan.create_text(275, 50, font=("Purisa", rndfont), text=slogan)

deploy = '\n Cliquez sur le bouton "Deploy" pour déployer l\'infrastructure. \n             Le déploiement prendra quelques minutes.'
rndfont = 10
canvas_explication = Canvas(frame, bg='#6abea7', height=150, bd=0, highlightthickness=0, relief='ridge')
canvas_explication.pack()
canvas_explication.create_text(200, 50, font=("Purisa", rndfont), text=deploy)



#canvas de la confirmation du deploiement
#canvas2 = Canvas(frame, bg='#6abea7', height=120, highlightthickness=0, bd=0, relief='ridge')
#canvas2.pack()

#photoimage2 = ImageTk.PhotoImage(file='img/non_deploy.png')
#canvas2.create_image(200,50,image=photoimage2)




##Bouton deploiement
BoutonLancer = Button(frame, text ='Deploy', command=nouvelle, height=5)
BoutonLancer.pack(fill=X)





root.mainloop()
