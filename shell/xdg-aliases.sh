#!/bin/sh

alias ag="ag -p $XDG_CONFIG_HOME/ag/agignore"
alias scp="scp -F $XDG_DATA_HOME/ssh/config"
alias ssh="ssh -F $XDG_DATA_HOME/ssh/config"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget/hsts"
alias ack="ack --ackrc $XDG_CONFIG_HOME/ack/ackrc"
