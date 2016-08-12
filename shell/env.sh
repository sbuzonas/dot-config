#!/bin/sh

source "$XDG_CONFIG_HOME/shell/xdg-env.sh"

[ -d /usr/local/opt/coreutils ] &&
    export PATH="/usr/local/opt/coreutile/libexec/gnubin:$PATH" &&
    export MANPATH="/usr/local/opt/coreutile/libexec/gnuman:$MANPATH"

export PATH="$HOME/.local/bin:$PATH"
