#!/bin/sh

STOWCMD="stow --target=$HOME"

$STOWCMD vim-configs
$STOWCMD git-configs
$STOWCMD screen-configs
$STOWCMD desktop-configs

rm -rf ~/bin
ln -s `pwd`/bin ~/bin
