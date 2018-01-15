#!/usr/bin/python3
import os
import subprocess

# Firewall  / Web / SMTP

subprocess.call("ansible-playbook /home/flashlab/ansible/ok-playbooks/firewall.yml", shell=True)
subprocess.call("ansible-playbook /home/flashlab/ansible/ok-playbooks/web.yml", shell=True)
subprocess.call("ansible-playbook /home/flashlab/ansible/ok-playbooks/smtp.yml", shell=True)
subprocess.call("ansible-playbook /home/flashlab/ansible/ok-playbooks/pt1.yml", shell=True)
subprocess.call("ansible-playbook /home/flashlab/ansible/ok-playbooks/pt2.yml", shell=True)
subprocess.call("ansible-playbook /home/flashlab/ansible/ok-playbooks/ldap.yml", shell=True)
