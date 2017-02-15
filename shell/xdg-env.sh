#!/bin/sh

SYSTEM_LOCAL_HOME=${SYSTEM_LOCAL_HOME:-$HOME/.local}

# Define XDG dirs
export XDG_BIN_HOME="$SYSTEM_LOCAL_HOME/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$SYSTEM_LOCAL_HOME/share"
export XDG_LIB_HOME="$SYSTEM_LOCAL_HOME/lib"

# Environment variable supported applications (CONFIG_HOME)
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export GEMRC="$XDG_CONFIG_HOME/gem/gemrc"
export GIT_SSH_COMMAND="ssh -F $XDG_DATA_HOME/ssh/config "$@" 2>/dev/null"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export HTOPRC="$XDG_CONFIG_HOME/htop/htoprc"
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export TERMINFO="$XDG_CONFIG_HOME/terminfo"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Environment variable supported applications (DATA_HOME)
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql/history"
export PSQL_HISTORY="$XDG_DATA_HOME/psdl/history"
#export VAGRANT_DOTFILE_PATH="$XDG_DATA_HOME/vagrant"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"

# Environment variable supported applications (CACHE_HOME)
