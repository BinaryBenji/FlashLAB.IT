#/bin/bash

##Flush iptables
iptables -F

##Suppression chaines utilisateurs
iptables -X

##Drop trafic entrant
iptables -P INPUT DROP

##Drop trafic sortant
iptables -P OUTPUT DROP

##Drop le forward
iptables -P FORWARD DROP

##Drop scans MAS et NULL
iptables -A INPUT -p tcp --tcp-flags FIN,URG,PSH FIN,URG,PSH -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

##Drop silencieusement les paquets broadcastés
iptables -A INPUT -m pkttype --pkt-type broadcast -j DROP

##Autorisation sur connexion ouverte du trafic en entrée
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT

##Autorisation sur connexion ouverte du trafic en sortie
iptables -A OUTPUT -m state ! --state INVALID -j ACCEPT

##Autorisation ping
iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT

##On accepte la boucle locale en entrée
iptables -I INPUT -i lo -j ACCEPT

## Ouverture des différents ports (INPUT)
iptables -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT 
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT 
iptables -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
iptables -A INPUT -p udp -m tcp --dport 25 -j ACCEPT 
iptables -A INPUT -p tcp -m tcp --dport 53 -j ACCEPT 
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT 
iptables -A INPUT -p tcp -m tcp --dport 3389 -j ACCEPT 

## Ouverture de tous les ports en OUTPUT
IPTABLES -A INPUT -p tcp --sport -j ACCEPT

## Redirection de port vers machine Web
iptables -t nat -A PREROUTING -j DNAT -i ___interface machine___ -p tcp --dport 8080 --to-destination ___ip machine web___:80

exit 0
