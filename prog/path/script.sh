#!/bin/bash
apt-get --assume-yes install gcc
apt-get --assume-yes install libc6-dev-i386
useradd god -d /home/god -m
passwd god <<EOF
dog
dog
EOF

cp .access /home/god
cp access /home/god
cp access.c /home/god
chown -R god:god /home/god
chmod 440 /home/god/.access
chmod 440 /home/god/access.c
