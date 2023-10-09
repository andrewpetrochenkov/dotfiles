#!/usr/bin/env bash

# WatchPaths: ~/Downloads
# ThrottleInterval: 1

IFS=
files="$(find ~/Downloads -type f ! -name ".*" ! -name "*.part" -maxdepth 1 -ctime -5s)" || exit
[[ -z "$new_files" ]] && exit

[ -e "$new_files" ] && set -- "$new_files" || set -- ~/Downloads
finder-reveal "$@"

