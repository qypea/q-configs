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
export export PROMPT_DIRTRIM=2

export JAVA_HOME=/usr/java/jdk1.8.0_45

export NPM_PACKAGES="$HOME/.npm"
export PATH="$NPM_PACKAGES/bin:$PATH"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

export PATH="$PATH:$HOME/bin"

ssh-add .ssh/id_rsa 2>>/dev/null

export ssbMyId='@PZjQKGbh9KrWHAp1lo9nH/WXqGLp5rpqpVYLccJLkE4=.ed25519'
export ssbPubId2018='@1sw77BWBwCzMlQuPG0YkZw8uiHRpEeBe5uLjzXGY36w=.ed25519'
export ssbPubId='@6lOh+rLq4MQubPQoKenbB9ipq75NVc2FAjy30MTc08o=.ed25519'
