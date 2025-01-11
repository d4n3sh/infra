#!/usr/bin/bash

sudo pacman -S ansible

ansible-galaxy install -r requirements.yml

ansible-playbook local-r2d2-archlinux.yml
