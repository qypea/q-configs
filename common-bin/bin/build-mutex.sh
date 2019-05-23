#!/bin/sh

flock /tmp/build.lock time -p $* || exit 1
