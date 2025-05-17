#!/bin/sh

set -e
set -u
set -x

convert "$1" -colorspace Gray -depth 8 -average converted.pnm
unpaper converted.pnm unpapered.pnm
rm converted.pnm

convert unpapered.pnm -normalize -density 300 prepared.tif
rm unpapered.pnm

tesseract prepared.tif "$1" -l eng
rm prepared.tif
