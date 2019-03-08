#!/bin/bash

set -e
set -u

/home/q/bin/title.sh backup

localDir="/home/q"
remoteDir="sftp://leviathan.local//home/q/backups/sphinx/"
common="--no-encryption --verbosity=info"

duplicity cleanup ${common} ${remoteDir}

duplicity ${common} --full-if-older-than=30D \
    --include /home/q/.ssb/secret --include /home/q/.ssb/gossip.json \
    --exclude /home/q/.ssb \
    --exclude /home/q/.cache --exclude /home/q/.ccache \
    --exclude /home/q/.config/\*/Cache \
    --exclude /home/q/.thumbnails \
    --exclude /home/q/.atom --exclude /home/q/.config/Atom \
    --exclude /home/q/.adobe \
    --exclude /home/q/.npm \
    --exclude /home/q/temp \
    --exclude /home/q/.gkrellm2/data \
    ${localDir} ${remoteDir}

duplicity remove-older-than 90D ${common} --force ${remoteDir}

duplicity collection-status ${common} ${remoteDir}
