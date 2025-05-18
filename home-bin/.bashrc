#!/usr/bin/env bash

# User specific aliases and functions
alias vi=nvim
export EDITOR=nvim
export PROMPT_DIRTRIM=2

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export PATH="$PATH:$HOME/bin"

ssh-add .ssh/id_rsa 2>>/dev/null
