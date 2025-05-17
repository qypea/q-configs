#!/bin/sh

set -e
set -u

clear
title.sh Journal

cd ~/notes

datestamp="$(date +%Y-%m-%d_%A)"
filename="journal/${datestamp}.md"
if ! test -e "${filename}"; then
    cp ~/.config/nvim/templates/md/journal.md "${filename}"
fi

nvim "${filename}"
