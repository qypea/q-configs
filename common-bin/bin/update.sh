#!/bin/bash

set -e
set -u

sudo apt autoclean
sudo apt autoremove
sudo apt update
sudo apt dist-upgrade

if [ -f /var/run/reboot-required ]; then
        cat /var/run/reboot-required
fi
uptime
