#!/bin/bash

set -e
set -u

title.sh Journal

datestamp="$(date +%Y-%m-%d_%A)"

cd ~/notes
nvim "journal/${datestamp}.norg"
