#!/bin/sh

source "$XDG_CONFIG_HOME/shell/xdg-aliases.sh"

alias grep='command grep --color=auto'
alias more='less'
alias tree='tree -Csuh'

edit() { $EDITOR $@ ; }
clip() { $CLIPBOARD $@ ; }
pager() { $PAGER $@ ; }

alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

if command -v gls >/dev/null 2>&1 ; then # GNU `ls'
    LS_CMD='command gls --color'
elif command -v ls --color >/dev/null 2>&1 ; then # GNU `ls'
    LS_CMD='command ls --color'
else # BSD ls
    LS_CMD='command ls -G'
fi
alias ls="$LS_CMD"

alias l="$LS_CMD -lAh"
alias la="$LS_CMD -AF"
alias ll="$LS_CMD -lFh"
alias lk="$LS_CMD -lSr"
alias lt="$LS_CMD -ltr"
alias lm="$LS_CMD -l | pager"
alias lsd="$LS_CMD -lAh | grep --color=never '/$'"

alias c='composer'
alias e='edit'
alias f='find'
alias g='git'
alias h='history'
alias j='jobs'
alias k='kill'
alias s='ssh'
alias t='tail -f'
alias v='vagrant'

alias tm='tmux'
alias md='mkdir -pv'
alias tsb='tmux showb'
alias tsp='tmux showb | clip'
