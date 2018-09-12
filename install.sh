#!/bin/sh

STOWCMD="stow --target=$HOME"

$STOWCMD vim-configs

rm -rf ~/bin
ln -s `pwd`/bin ~/bin

mkdir -p ~/.config
rm -rf ~/.config/xfce4
ln -s `pwd`/config-xfce4 ~/.config/xfce4

rm ~/.screenrc
ln -s `pwd`/screenrc ~/.screenrc

rm -rf ~/.git_template
ln -s `pwd`/git_template ~/.git_template

rm -rf ~/.gitconfig
ln -s `pwd`/gitconfig ~/.gitconfig
