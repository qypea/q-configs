#!/bin/sh

find music -iname *.mp3 -exec mp3gain -r \{\} \;

rsync -avzP --delete-after -e ssh music pics leviathan:media/
