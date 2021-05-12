#!/bin/sh

set -e
set -u

file=$1
tmp=$(mktemp)

cat ${file} | jq . > ${tmp}
mv ${tmp} ${file}
