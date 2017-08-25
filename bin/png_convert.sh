#!/bin/sh

set -e
set -u

input="$1"

if test -d "$input"; then
   # Find pngs, call self on them
   find "$input" -type f -iname \*.png -exec $0 \{\} \;

else if test -e "$input"; then
   # Convert to jpg
   output="`dirname \"$input\"`/`basename \"$input\" .png`".jpg
   echo "Converting: $input->$output"
   convert "$input" "$output"
   rm "$input"
else
   echo "Invalid input $input. Please specify a directory or file"
   exit 1
fi
fi
