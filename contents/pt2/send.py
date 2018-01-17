from scapy.all import *
import time

data = 'Identifiants escobar : cartel'
a = IP(dst='192.168.1.2') / TCP() / Raw(load=data)

while True:
    sendp(a)
    time.sleep(3)
