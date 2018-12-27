# .bashrc

# Source global definitions
source /etc/bash.bashrc

force_color_prompt=yes
source /etc/skel/.bashrc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi=vim
export EDITOR=vim

export JAVA_HOME=/usr/java/jdk1.8.0_45

export NPM_PACKAGES="$HOME/.npm"
export PATH="$NPM_PACKAGES/bin:$PATH"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

export DEB_MACHS="leviathan.local ntp.local routepi.local"

export PATH="$PATH:$HOME/bin"

ssh-add .ssh/id_rsa 2>>/dev/null
