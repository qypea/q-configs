#!/bin/sh

/home/q/bin/title.sh update-debs

ssh -t leviathan "./bin/update.sh"
