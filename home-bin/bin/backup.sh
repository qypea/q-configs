#!/bin/bash

set -e
set -u
set -x

/home/q/bin/title.sh backup

remoteHost="leviathan.local"
remoteDir="/home/q/backups/sphinx"
localDir="/home/q"

ssh ${remoteHost} "rsync -av --delete --delete-after ${remoteDir}/backup.1/* ${remoteDir}/backup.2"
ssh ${remoteHost} "rsync -av --delete --delete-after ${remoteDir}/backup.0/* ${remoteDir}/backup.1"
rsync -av --delete --delete-after ${localDir} ${remoteHost}:${remoteDir}/backup.0
