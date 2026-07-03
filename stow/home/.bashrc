#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# /etc/bashrc
# ~/.bashrc
# .bash_profile is executed for login shells
# .bashrc is executed for interactive non-login shells

XDG_CONFIG_HOME="${XDG_CONFIG_HOME-$HOME/.config}"


shopt -s expand_aliases # enable aliases in scripts
[ -f ~/.bash_aliases ] && { . ~/.bash_aliases || exit; }
[ -f ~/.bash_env ] && { set -a; . ~/.bash_env || exit; set +a; }
[ -f $XDG_CONFIG_HOME/.bash_aliases ] && . $XDG_CONFIG_HOME/.bash_aliases;:

# https://direnv.net/
# eval "$(direnv hook bash)"      # interactive
# eval "$(direnv export bash)"  # non-interactive, in script

## `export -f funcname` - export function
## (export functions to .command)
## known-issues:
## sh: error importing function definition for `name.xxx'
## sh names may consist only of alphanumeric characters and underscores
