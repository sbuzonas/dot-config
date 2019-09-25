#!/usr/bin/env zsh

###
# XDG Setup
############
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
[ -f "$XDG_CONFIG_HOME/shell/env.sh" ] && . "$XDG_CONFIG_HOME/shell/env.sh"

###
# ZSH Setup
############
export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"
export ZCOMPDUMPFILE="${XDG_CACHE_HOME}/zsh/zcompdump"

# default: *?_-.[]~=/&;!#$%^(){}<>
export WORDCHARS='*?_[]~=&;!#$%^(){}'
export HISTFILE="$XDG_DATA_HOME/zsh/history"

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '
