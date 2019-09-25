#!/bin/sh

SYSTEM_LOCAL_HOME=${SYSTEM_LOCAL_HOME:-$HOME/.local}

export XDG_BIN_HOME="$HOME/.bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_LIB_HOME="$SYSTEM_LOCAL_HOME/lib"

if [ "$(uname -s)" = "Darwin" ]; then
    export XDG_CACHE_HOME="$HOME/Library/Caches/XDG"
    export XDG_DATA_HOME="$HOME/Library/XDG"
else
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_DATA_HOME="$SYSTEM_LOCAL_HOME/share"
fi

for d in $XDG_BIN_HOME $XDG_CONFIG_HOME $XDG_LIB_HOME $XDG_CACHE_HOME $XDG_DATA_HOME ; do
    mkdir -p $d
done
