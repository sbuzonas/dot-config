#!/bin/sh

__load_dircolors() {
    unset LS_COLORS
    if [ ! -z "$DIRCOLORS_FILE" ] && [ -r "$DIRCOLORS_FILE" ] ; then
	command -v dircolors 2>&1 >/dev/null && eval "$(dircolors -b $DIRCOLORS_FILE)"
	command -v gdircolors 2>&1 >/dev/null && eval "$(gdircolors -b $DIRCOLORS_FILE)"
    else
	command -v dircolors 2>&1 >/dev/null && eval "$(dircolors -b)"
	command -v gdircolors 2>&1 >/dev/null && eval "$(gdircolors -b)"
    fi
}
