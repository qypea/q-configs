#!/bin/sh

timelimit=$1
shift

$* &
pid=$!

sleep $timelimit
kill $pid
