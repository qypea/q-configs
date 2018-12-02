#!/bin/bash

set -e
set -u
set -x

/home/q/bin/title.sh backup

remoteHost="leviathan.local"
remoteDir="/home/q/backups/sphinx"
backupCount="2"
localDir="/home/q"

rsync -av --delete --delete-after ${localDir} ${remoteHost}:${remoteDir}/current

ssh ${remoteHost} <<EOF
cd ${remoteDir}
if test -e backup.${backupCount}; then
    rm -rf backup.${backupCount}
fi
i=${backupCount}
while [[ \$i -gt 1 ]]; do
    if test -e backup.\$(( \$i - 1 )); then
        mv backup.\$(( \$i - 1 )) backup.\$i
    fi
    i=\$(( \$i - 1 ))
done

# TODO: --link if possible with encfs by disabling "External IV Chaining"
cp -ra current backup.1
EOF
