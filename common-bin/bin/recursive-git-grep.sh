#!/bin/sh

search="$1"
echo "Search is: ($search)"

git grep "$search" || true
git submodule foreach --recursive "git grep $search || true"
