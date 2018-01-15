#!/usr/bin/python3

import subprocess
import sys

choice = 12

while True:
    print("[0] = Firewall \n[1] = Web \n[2] = SMTP \n[3] = PT1 \n[4] = PT2 \n[5] = LDAP \n[6] = QUIT \n")
    choice = input("Choice : ")
    if (choice == "0"):
        subprocess.call("ansible-playbook delete_vm.yml --extra-vars target=\"IV-STUP-FLA_FIRE\"", shell=True)
    elif (choice == "1"):
        subprocess.call("ansible-playbook delete_vm.yml --extra-vars target=\"IV-STUP-FLA_WEB\"", shell=True)
    elif (choice == "2"):
        subprocess.call("ansible-playbook delete_vm.yml --extra-vars target=\"IV-STUP-FLA_SMTP\"", shell=True)
    elif (choice == "3"):
        subprocess.call("ansible-playbook delete_vm.yml --extra-vars target=\"IV-STWP-FLA_PT1\"", shell=True)
    elif (choice == "4"):
        subprocess.call("ansible-playbook delete_vm.yml --extra-vars target=\"IV-STWP-FLA_PT2\"", shell=True)
    elif (choice == "5"):
        subprocess.call("ansible-playbook delete_vm.yml --extra-vars target=\"IV-STWP-FLA_LDAP\"", shell=True)
    elif (choice == "6"):
        sys.exit()
    else :
        print ("BAD INPUT")
    choice = 12



    #ansible-playbook delete_vm.yml --extra-vars target=\"\"
