#!/bin/bash

set -e
set -u

datestamp=$(date +%Y-%m-%d)

cd ~/notes/journal
nvim ${datestamp}.norg
