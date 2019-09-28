#!/usr/bin/env zsh

[ -f "$XDG_CONFIG_HOME/shell/rc.sh" ] && . "$XDG_CONFIG_HOME/shell/rc.sh"

setopt INC_APPEND_HISTORY

autoload -U +X compinit
if [[ -z "$ZCOMPDUMPFILE" ]] ; then
    compinit
else
    compinit -d "$ZCOMPDUMPFILE"
fi

autoload -U +X bashcompinit && bashcompinit

setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

setopt PROMPT_SUBST

for config in $(find "$ZDOTDIR" -name '*.zsh' -type f) ; do
    [ -x "$config" ] && . $config
done

fpath=(/usr/local/share/zsh-completions $fpath)

autoload kubectl
compdef _kubectl kubectl

command -v direnv 2>&1 >/dev/null && eval "$(direnv hook zsh)"
command -v starship 2>&1 >/dev/null && eval "$(starship init zsh)"
