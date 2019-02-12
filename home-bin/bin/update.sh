#!/bin/bash

set -e
set -u

/home/q/bin/title.sh update

sudo apt autoclean
sudo apt autoremove
sudo apt update
sudo apt dist-upgrade

npm install -g ssb-server ssb-client
pushd ~/.ssb/node_modules/patchfoo
git pull
ssb-npm install
popd
