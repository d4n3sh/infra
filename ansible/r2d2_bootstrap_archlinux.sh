#!/usr/bin/bash

sudo pacman -S ansible

ansible-galaxy install -r requirements.yml

ansible-playbook r2d2_archlinux_gnome.yml -K
