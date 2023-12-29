#!/bin/bash

set -e
set -u

datestamp="$(date +%Y-%m-%d_%A)"

cd ~/notes/journal
nvim ${datestamp}.norg
