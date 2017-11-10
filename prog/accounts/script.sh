#!/bin/bash
#CREATION USER MACHINE POSEIDON
useradd poseidon -d /home/poseidon -m
passwd poseidon <<EOF
dieudelamer
dieudelamer
EOF

#CREATION USER FTP
useradd zeus -d /home/zeus -m
passwd zeus <<EOF
admin10
admin10
EOF
chown -R zeus:zeus /home/zeus
