#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$(dirname ${${(%):-%N}:a:h})"
. "$XDG_CONFIG_HOME/shell/env.sh"

export WORDCHARS='*?_[]~=&;!#$%^(){}'
# default: "*?_-.[]~=/&;!#$%^(){}<>"
# other:   "*?_-.[]~=&;!#$%^(){}<>\\"
export WORDCHARS=${WORDCHARS:s,/,,}

export HISTFILE="$XDG_DATA_HOME/zsh/history"

## Sourcing OS-specific things
if [[ -f $ZDOTDIR/${OS}.env ]] ; then
    if [[ ! -z $ZSHDEBUG ]] ; then
        echo +++ $ZDOTDIR/${OS}.env
    fi
    source $ZDOTDIR/${OS}.env
fi

## Sourcing machine -specific things
if [[ -f $ZDOTDIR/${HOSTPREFIX}.env ]] ; then
    if [[ ! -z $ZSHDEBUG ]] ; then
        echo +++ $ZDOTDIR/${HOSTPREFIX}.env
    fi
    source $ZDOTDIR/${HOSTPREFIX}.env
fi

export ZCOMPDUMPFILE="$XDG_DATA_HOME/zsh/zcompdump"

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '
