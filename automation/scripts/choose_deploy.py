#!/usr/bin/python3

import subprocess
import sys

choice = 12

while True:
    print("[0] = Firewall \n [1] = Web \n [2] = SMTP \n [3] = PT1 \n [4] = PT2 \n [5] = LDAP \n [6] = QUIT \n")
    choice = input("Choice : ")
    if (choice == "0"):
        subprocess.call("ansible-playbook firewall.yml", shell=True)
    elif (choice == "1"):
        subprocess.call("ansible-playbook web.yml", shell=True)
    elif (choice == "2"):
        subprocess.call("ansible-playbook smtp.yml", shell=True)
    elif (choice == "3"):
        subprocess.call("ansible-playbook pt1.yml", shell=True)
    elif (choice == "4"):
        subprocess.call("ansible-playbook pt2.yml", shell=True)
    elif (choice == "5"):
        subprocess.call("ansible-playbook ldap.yml", shell=True)
    elif (choice == "6"):
        sys.exit()
    else :
        print ("BAD INPUT")
    choice = 12
