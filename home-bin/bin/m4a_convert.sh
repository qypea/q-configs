#!/bin/sh

set -e
set -u

input="$1"

if test -d "$input"; then
   # Find m4as, call self on them
   find "$input" -type f -iname \*.m4a -exec $0 \{\} \;

else if test -e "$input"; then
   # Convert to mp3
   output="`dirname \"$input\"`/`basename \"$input\" .m4a`".mp3
   echo "Converting: $input->$output"
   ffmpeg -loglevel error -i "$input" -vsync 2\
      -acodec libmp3lame -ac 2 -ab 192k -ar 44100 "$output"

   mp3_compress.sh "$output"
else
   echo "Invalid input $input. Please specify a directory or file"
   exit 1
fi
fi
