from tkinter import *
from PIL import ImageTk

root = Tk()
# Parametres basiques
root.geometry("600x600")
root.resizable(width=False, height=False)
root.title("FlashLAB")
root.configure(background='#6abea7')
root.iconbitmap('img/logooooico.ico')

frame = Frame(root)
frame.pack()

# Image
canvas = Canvas(frame, bg='#6abea7', width=600, height=600)
canvas.pack()

photoimage = ImageTk.PhotoImage(file='img/logtrans.png')
canvas.create_image(300,300,image=photoimage)





# Décommenter pour rendre la fenetre fixe (taille)


#champ_label = Label(root, text="Salut les Zér0s !")

# On affiche le label dans la fenêtre
#champ_label.pack()

# On démarre la boucle Tkinter qui s'interompt quand on ferme la fenêtre
root.mainloop()
