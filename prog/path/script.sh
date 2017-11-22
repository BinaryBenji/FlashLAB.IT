#!/bin/bash

useradd god -d /home/god -m
passwd god <<EOF
dog
dog
EOF

cp .access /home/god
cp access /home/god
cp access.c /home/god
