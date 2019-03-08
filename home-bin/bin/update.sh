#!/bin/bash

set -e
set -u
set -x

/home/q/bin/title.sh update

sudo apt autoclean
sudo apt autoremove
sudo apt update
sudo apt dist-upgrade

npm update -g ssb-server ssb-client scuttle-shell
npm update --registry=http://localhost:8043/ -g git-ssb ssb-npm

pushd ~/.ssb/node_modules/patchfoo
git pull
rm -f package-lock.json
npm install --registry=http://localhost:8043/
popd
