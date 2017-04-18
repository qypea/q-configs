#!/bin/sh

rm -rf ~/bin
ln -s `pwd`/bin ~/bin

mkdir -p ~/.config
rm -rf ~/.config/xfce4
ln -s `pwd`/config-xfce4 ~/.config/xfce4

rm ~/.screenrc
ln -s `pwd`/screenrc ~/.screenrc

rm ~/.vimrc
ln -s `pwd`/vimrc ~/.vimrc

rm -rf ~/.vim
ln -s `pwd`/vim ~/.vim
