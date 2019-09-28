#!/bin/sh

[ -f "$XDG_CONFIG_HOME/shell/xdg-aliases.sh" ] && . "$XDG_CONFIG_HOME/shell/xdg-aliases.sh"

edit() { $EDITOR $@ ; }
clip() { $CLIPBOARD $@ ; }
pager() { $PAGER $@ ; }

LS_BIN='ls'
LS_FLAGS='-h'
if command -v gls >/dev/null 2>&1 ; then
    LS_FLAVOR='gnu'
    LS_BIN='gls'
elif command -v ls --color >/dev/null 2>&1 ; then
    LS_FLAVOR='gnu'
else
    LS_FLAVOR='bsd'
fi

case $LS_FLAVOR in
    gnu)
	LS_FLAGS="$LS_FLAGS --color"
	LS_CMD="command $LS_BIN $LS_FLAGS"
	;;
    bsd)
	LS_FLAGS="$LS_FLAGS -G"
	LS_CMD="command $LS_BIN $LS_FLAGS"
	;;
esac

alias ls="$LS_CMD"

alias l="$LS_CMD -lAh"
alias la="$LS_CMD -AF"
alias ll="$LS_CMD -lFh"
alias lk="$LS_CMD -lSr"
alias lt="$LS_CMD -ltr"
alias lm="$LS_CMD -l | pager"
alias lsd="$LS_CMD -lAh | grep --color=never '/$'"

alias more='less'
alias tree='tree -Csuh'

alias c='composer'
alias e='edit'
alias f='find'
alias g='git'
alias h='history'
alias j='jobs'
alias k='kill'
alias s='ssh'
alias t='tail -f'

alias tm='tmux'
alias tsb='tmux showb'
alias tsp='tmux showb | clip'
alias md='mkdir -pv'
