#!/bin/bash

set -e
set -u

clear
title.sh Journal

datestamp="$(date +%Y-%m-%d_%A)"

cd ~/notes
nvim "journal/${datestamp}.norg"
