#!/bin/sh

alias ag="ag -p $XDG_CONFIG_HOME/ag/agignore"
[ -f "$XDG_DATA_HOME/ssh/config" ] && alias scp="scp -F $XDG_DATA_HOME/ssh/config"
[ -f "$XDG_DATA_HOME/ssh/config" ] && alias ssh="ssh -F $XDG_DATA_HOME/ssh/config"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget/hsts"
alias ack="ack --ackrc $XDG_CONFIG_HOME/ack/ackrc"

export TMUX_VERSION=$(tmux -V | sed -En 's/^tmux ([0-9]+(\.[0-9]+)?).*/\1/p')
if [ "$(echo "$TMUX_VERSION < 2.1" | bc)" = 1 ] ; then
    export TMUX_CONF="$XDG_CONFIG_HOME/tmux/tmux-legacy.conf"
else
    export TMUX_CONF="$XDG_CONFIG_HOME/tmux/tmux.conf"
fi
alias tmux="tmux -f $TMUX_CONF"
