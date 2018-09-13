#!/bin/sh

STOWCMD="stow --target=$HOME"

$STOWCMD vim-configs
$STOWCMD git-configs
$STOWCMD screen-configs
$STOWCMD desktop-configs
$STOWCMD home-bin
$STOWCMD common-bin
