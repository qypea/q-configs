#!/bin/bash

set -e
set -u

/home/q/bin/title.sh backup

localDir="/home/q"
remoteDir="sftp://leviathan//home/q/backups/firebug/"
common="--no-encryption --verbosity=info"

duplicity cleanup ${common} ${remoteDir}

duplicity ${common} --full-if-older-than=30D \
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
