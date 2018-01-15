#!/usr/bin/python3

import os
import subprocess

machines = ["IV-STUP-FLA_FIRE", "IV-STUP-FLA_WEB", "IV-STUP-FLA_SMTP", "IV-STWP-FLA_PT1", "IV-STWP-FLA_PT2", "IV-STWP-FLA_LDAP"]

for machine in machines:
    subprocess.call("ansible-playbook delete_vm.yml --extra-vars target=" + machine, shell=True)
    
