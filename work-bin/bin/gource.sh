#!/bin/sh

gource -1280x720 \
    --stop-at-end  \
    --seconds-per-day 2 \
    --start-date '2018-12-01' \
    --output-framerate 30 --output-ppm-stream - \
    | ffmpeg -y -r 30 -f image2pipe -vcodec ppm -i - \
        -pix_fmt yuv420p \
        -vcodec libvpx -b:v 1000K gource.webm
