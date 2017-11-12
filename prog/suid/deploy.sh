#!/bin/bash

cd /home/ubuntu
echo "
#include <stdlib.h>
    #include <stdio.h>
     
    int main(void)
    {
            system("ls /home/ubuntu/.passwd");
            return 0;
    }
" > key.c

gcc key.c
echo "fs6d7fsd41vcx4vxcvdfsgf" > .passwd

passwd ubuntu << EOF
admin10
admin10

chmod 440 key.c
chmod 4550 a.out
chmod 440 .passwd

chown ubuntu:ubuntu key.c
chown root:root .passwd
chown root:ubuntu a.out