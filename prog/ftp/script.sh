#!/bin/bash
apt-get update
apt-get --assume-yes install proftpd
/etc/init.d/proftpd reload
