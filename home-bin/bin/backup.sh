#!/bin/bash

set -e
set -u

/home/q/bin/title.sh backup

localDir="/home/q"
remoteDir="sftp://leviathan.local//home/q/backups/sphinx/"
common="--no-encryption --verbosity=info"

duplicity cleanup ${common} ${remoteDir}

duplicity ${common} --full-if-older-than=90D \
    --exclude /home/q/.ssb/flume --exclude /home/q/.ssb/blobs \
    --exclude /home/q/.cache --exclude /home/q/.ccache \
    --exclude /home/q/.atom/packages --exclude /home/q/.atom/.apm \
    --exclude /home/q/.config/\*/Cache \
    ${localDir} ${remoteDir}

duplicity remove-older-than 90D ${common} --force ${remoteDir}

duplicity collection-status ${common} ${remoteDir}
