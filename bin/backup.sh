#!/bin/sh

/home/q/bin/title.sh backup

mkdir /tmp/backups
sshfs leviathan:backups/samba /tmp/backups/

rm -rf /home/q/.macromedia/Flash_Player
cp /home/q/.bashrc /home/q/bin/bashrc
kbackup --auto /home/q/.mybackup.kbp

fusermount -u /tmp/backups
rmdir /tmp/backups

/home/q/bin/sync_media.sh
