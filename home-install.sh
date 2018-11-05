#!/bin/sh

STOWCMD="stow --target=$HOME"

$STOWCMD common-bin
$STOWCMD common-screen
$STOWCMD common-vim

$STOWCMD home-atom
$STOWCMD home-bin
$STOWCMD home-desktop
$STOWCMD home-git
