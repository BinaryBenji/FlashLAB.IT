#!/bin/bash
apt-get update
apt-get --assume-yes install djbdns daemontools ucspi-tcp
useradd -s /bin/false tinydns
useradd -s /bin/false dnslog
tinydns-conf tinydns dnslog /etc/tinydns 127.0.0.1
ln -s /etc/tinydns /etc/service
cd /etc/tinydns/root
./add-ns flashlab.itinet.fr 127.0.0.1
./add-mx flashlab.itinet.fr 127.0.0.1
make
svc -h /etc/service/tinydns
cd -
/etc/init.d/networking restart
sleep 5