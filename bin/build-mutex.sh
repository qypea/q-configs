#!/bin/sh

flock /tmp/build.lock $* || exit 1
