#!/usr/bin/bash

sudo pacman -S ansible

ansible-galaxy install -r requirements.yml

ansible-playbook local-beast-archlinux.yml
