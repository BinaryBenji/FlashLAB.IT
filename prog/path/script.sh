#!/bin/bash

useradd god -d /home/god -m
passwd god <<EOF
dog
dog
EOF

sudo cp .access /home/god
sudo cp access /home/god
sudo cp access.c /home/god
chown -R god:god /home/god
