#!/bin/bash

set -e
set -u

localDir="/home/q"
remoteDir="sftp://hydra.lan//home/q/backups/firebug/"
common="--no-encryption --verbosity=warning"

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
    --exclude /home/q/.steam \
    --exclude /home/q/.dbus \
    --exclude /home/q/builds \
    ${localDir} ${remoteDir}

duplicity remove-older-than 45D ${common} --force ${remoteDir}

duplicity collection-status ${common} ${remoteDir}
