#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$(dirname ${${(%):-%N}:a:h})"
. "$XDG_CONFIG_HOME/shell/rc.sh"

# initialize the completion system
autoload -U +X compinit
if [[ -z "$ZCOMPDUMPFILE" ]] ; then
    compinit
else
    compinit -d "$ZCOMPDUMPFILE"
fi

autoload -U +X bashcompinit && bashcompinit

setopt PROMPT_SUBST

for config in $(find $ZDOTDIR -name '*.zsh' -type f) ; do
    if [[ -x $config ]] ; then
        if [[ ! -z $ZSHDEBUG ]] ; then
            echo +++ $config
        fi
        . $config
    fi
done

fpath=(/usr/local/share/zsh-completions $fpath)
