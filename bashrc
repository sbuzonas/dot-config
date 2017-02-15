#!/usr/bin/env bash

shopt -s cdspell      # Spellcheck for cd
shopt -s checkhash    # Do a path scan if the executable in the hash table no longer exists
shopt -s checkwinsize # Adjust text to window size after each command
shopt -s cmdhist      # Save multi line entries as a single line in history
shopt -s dotglob      # Include files beginning with '.' in file expansion
shopt -s extglob      # Extended globbing
shopt -s histappend   # Append to history rather than overwriting
shopt -s histreedit   # Re-edit failed history substitutions
shopt -s nocaseglob   # Ignore cases for globbing filenames

# Bash 4 options
shopt -s autocd    2>/dev/null # Allow cd when typing a directory
shopt -s direxpand 2>/dev/null # Update readline history to match file expansion
shopt -s dirspell  2>/dev/null # Spelling correction for directories
shopt -s globstar  2>/dev/null # Glob recursively with **

export XDG_CONFIG_HOME="$(dirname ${BASH_SOURCE[0]})/.."
source "$XDG_CONFIG_HOME/shell/rc.sh"

