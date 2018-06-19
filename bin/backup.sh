#!/bin/sh

/home/q/bin/title.sh backup

rm -rf /home/q/.macromedia/Flash_Player
cp /home/q/.bashrc /home/q/bin/bashrc
kbackup --auto /home/q/.mybackup.kbp

/home/q/bin/sync_media.sh
