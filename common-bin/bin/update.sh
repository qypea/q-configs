#!/bin/bash

set -e
set -u

sudo apt autoclean
sudo apt autoremove
sudo apt update
sudo apt dist-upgrade
sudo snap refresh --list
sudo snap refresh

if [ -f /var/run/reboot-required ]; then
        cat /var/run/reboot-required
fi
uptime
