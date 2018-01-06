#!/bin/bash
#CREATION USER MACHINE POSEIDON
useradd poseidon -d /home/poseidon -m
passwd poseidon <<EOF
dieudelamer
dieudelamer
EOF

#CREATION USER FTP
adduser zeus <<EOF
admin10
admin10



EOF
mkdir /home/zeus/Docs
mkdir /home/zeus/Docs/Infra
mkdir /home/zeus/Duga
mkdir /home/zeus/Ressources
cp accounts/Infrastructure.png /home/zeus/Docs/Infra
chown -R zeus:zeus /home/zeus
chmod 0700 /home/zeus
