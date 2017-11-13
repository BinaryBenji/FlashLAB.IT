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
