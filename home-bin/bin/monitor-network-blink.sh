#!/bin/bash

set -e
set -u

blink="blink1-tool --quiet --brightness=128"

${blink} --off
last_color="off"
errors=0

while true; do
    # Try to ping, count errors
    ping -c 1 www.google.com -D -W 5 > /dev/null 2>&1 \
        || errors=$(( ${errors} + 2 ))

    # Decay errors over time if we're good
    errors=$(( ${errors} - 1 ))

    # Keep errors in 0..5 range
    if [[ ${errors} -lt 0 ]]; then
        errors=0
    fi
    if [[ ${errors} -gt 5 ]]; then
        errors=5
    fi

    # If 3/5 are bad we're broken
    if [[ ${errors} -ge 3 ]]; then
        color=red
    else
        color=green
    fi

    # Log, set color
    if [[ ${color} != ${last_color} ]]; then
        logger --tag monitor-network-blink ${color}
        last_color=${color}
    fi

    ${blink} --${color}
    sleep 1

    # Fade yellow over time if this script exits
    ${blink} --yellow --millis=60000
    sleep 2
done
