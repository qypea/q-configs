#!/bin/bash

set -e
set -u
set -x

title.sh update

sudo apt autoclean
sudo apt autoremove
sudo apt update
sudo apt dist-upgrade
