#!/bin/bash
apt-get --assume-yes install gcc
apt-get --assume-yes install libc6-dev-i386
useradd god -d /home/god -m
passwd god <<EOF
dog
dog
EOF

<<<<<<< HEAD
sudo cp .access /home/god
sudo cp access /home/god
sudo cp access.c /home/god
chown -R god:god /home/god
=======
cp .access /home/god
cp access /home/god
cp access.c /home/god
chown -R god:god /home/god
chmod 440 /home/god/.access
chmod 440 /home/god/access.c
>>>>>>> 5c6dc9ed42c924419632af0723c4cf07b260fc0e
