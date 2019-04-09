#!/bin/sh

set -e
set -u

input="$1"

if test -d "$input"; then
   # Find mp3s, call self on them
   find "$input" -type f -iname \*.mp3 -exec $0 \{\} \;
else if test -e "$input"; then
   # Recompress input
   echo "Recompressing: $input"
   tmp=`mktemp --suffix=.mp3`
   lame --quiet "$input" -b 128 "$tmp"
   mv "$tmp" "$input"

   echo "Setting gain level"
   mp3gain -q -c -r "$input"
else
   echo "Invalid input $input. Please specify a directory or file"
   exit 1
fi
fi
