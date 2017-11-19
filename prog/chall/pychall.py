#!/usr/bin/python2
 
import sys
 
def youLose():
    print "Wrong password."
    sys.exit(1)
 
 
try:
    p = input("Please enter password : ")
except:
    youLose()
 
 
with open(".passwd") as f:
    passwd = f.readline().strip()
    try:
        if (p == int(passwd)):
            print "Well done ! You can validate with this password !"
    except:
        youLose()