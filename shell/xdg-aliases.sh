#!/bin/sh

# Alias supported allications
alias ag="ag -p $XDG_CONFIG_HOME/ag/agignore"
alias emacs="emacs -q --load $XDG_CONFIG_HOME/emacs/init"
alias scp="scp -F $XDG_CONFIG_HOME/ssh/config"
alias ssh="ssh -F $XDG_CONFIG_HOME/ssh/config"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
