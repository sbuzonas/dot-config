#!/bin/sh

source "$XDG_CONFIG_HOME/shell/xdg-env.sh"

[ -d /usr/local/opt/coreutils ] &&
    export PATH="/usr/local/opt/coreutils/bin:$PATH" &&
    export MANPATH="/usr/local/opt/coreutils/share/man:$MANPATH" &&
    export INFOPATH="/usr/local/opt/coreutils/share/info:$INFOPATH"

export PATH="$HOME/.local/bin:$HOME/.local/share/node/bin:$PATH"

export PYTHONDONTWRITEBYTECODE=1
