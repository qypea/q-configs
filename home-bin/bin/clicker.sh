#!/bin/sh

set -e
set -u

tmpfile=/tmp/clicker.flag

if test -e $tmpfile; then
    echo "Stopping"
    rm $tmpfile
else
    echo "Starting"
    touch $tmpfile
    while test -e $tmpfile; do
        xdotool click --repeat 10 1
        
    done
fi
echo "Done"
