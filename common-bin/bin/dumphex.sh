#!/bin/sh

for f in $*; do
    hexdump -C $f > $f.hex
done
