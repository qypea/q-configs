#!/bin/bash

set -x

#fluidsynth --server --no-shell \
#    --audio-driver=jack --connect-jack-outputs \
#    --reverb=0 --chorus=0 --gain=0.75 \
#    /usr/share/sounds/sf2/default.sf2 &
qsynth &
