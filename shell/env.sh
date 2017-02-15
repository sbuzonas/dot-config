#!/bin/sh

source "$XDG_CONFIG_HOME/shell/xdg-env.sh"

[ -d /usr/local/opt/coreutils ] &&
    export PATH="/usr/local/opt/coreutils/bin:$PATH" &&
    export MANPATH="/usr/local/opt/coreutils/share/man:$MANPATH" &&
    export INFOPATH="/usr/local/opt/coreutils/share/info:$INFOPATH"

# Add node tools to path
export PATH="$HOME/.local/share/node/bin:$PATH"

# Add rbenv to path
export PATH="$HOME/.rbenv/bin:$PATH"

# Add local scripts to path
export PATH="$HOME/.local/bin:$PATH"

export PYTHONDONTWRITEBYTECODE=1
