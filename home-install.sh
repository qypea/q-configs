#!/bin/sh

STOWCMD="stow --target=$HOME"

$STOWCMD common-bin
$STOWCMD common-screen
$STOWCMD common-nvim

$STOWCMD home-atom
$STOWCMD home-bin
$STOWCMD home-git
