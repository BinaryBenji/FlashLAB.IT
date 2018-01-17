#!/bin/sh
iptables -t nat -A PREROUTING -i ens160 -p tcp -d 10.10.10.205 --dport 1180 -j DNAT --to-destination 192.168.0.3:80 ## HTTP WEB
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -i ens160 -p tcp -d 10.10.10.205 --dport 1232 -j DNAT --to-destination 192.168.0.2:22 ## SSH SMTP
iptables -t nat -A PREROUTING -i ens160 -p tcp -d 10.10.10.205 --dport 1345 -j DNAT --to-destination 192.168.0.2:21 ## FTP SMTP
iptables -I FORWARD -p tcp -d 10.10.10.205 --dport 1345 -j ACCEPT ## FTP
iptables -t nat -I PREROUTING -p tcp --dport 49152:65534 -j DNAT --to 192.168.0.2:49152-65534 ## FTP PASSIV PORT SMTP
iptables -I FORWARD -p tcp -d 192.168.0.2 --dport 49152:65534 -j ACCEPT ## IDEM
iptables -t nat -A PREROUTING -i ens160 -p tcp -d 10.10.10.205 --dport 4444 -j DNAT --to-destination 192.168.0.3:22 ## SSH WEB
iptables -t nat -A PREROUTING -i ens160 -p tcp -d 10.10.10.205 --dport 3333 -j DNAT --to-destination 192.168.1.2:3389 #RDP PT1 "Office1-Office"
iptables -t nat -A PREROUTING -i ens160 -p tcp -d 10.10.10.205 --dport 5678 -j DNAT --to-destination 192.168.1.3:3389 #RDP PT2 "Office2-Office"
iptables -t nat -A PREROUTING -i ens160 -p tcp -d 10.10.10.205 --dport 9875 -j DNAT --to-destination 192.168.1.5:3389 #RDP LDAP "Administrateur Azerty&123"
modprobe nf_conntrack_ftp
modprobe nf_nat_ftp
iptables-save -c
