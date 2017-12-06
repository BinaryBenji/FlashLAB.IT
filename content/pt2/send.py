from scapy.all import *
import time

data = 'HELLOOOO'
a = IP(dst='127.0.0.1') / TCP() / Raw(load=data)

while True:
    sendp(a)
    time.sleep(3)
