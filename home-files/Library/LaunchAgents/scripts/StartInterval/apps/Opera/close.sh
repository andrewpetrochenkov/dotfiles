#!/usr/bin/env bash

# StartInterval: 1
# ThrottleInterval: 1

urls="$(opera-urls)" || exit
[[ -z "$urls" ]] && exit

[[ $urls == "chrome://settings/" ]] && exit
echo todo
exit

afk="$(afk)" || exit
[[ $afk -gt 5 ]] && exit

display sleep || exit
IFS=$'\n'; set $urls; opera close "$@" || exit
opera fullscreen-exit
display wake || exit
