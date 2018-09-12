#!/bin/sh

STOWCMD="stow --target=$HOME"

$STOWCMD vim-configs
$STOWCMD git-configs

rm -rf ~/bin
ln -s `pwd`/bin ~/bin

mkdir -p ~/.config
rm -rf ~/.config/xfce4
ln -s `pwd`/config-xfce4 ~/.config/xfce4

rm ~/.screenrc
ln -s `pwd`/screenrc ~/.screenrc
