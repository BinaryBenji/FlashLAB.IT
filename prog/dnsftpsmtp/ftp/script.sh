#!/bin/bash
apt-get update
apt-get --assume-yes install proftpd
cp proftpd.conf /etc/proftpd
/etc/init.d/proftpd reload
