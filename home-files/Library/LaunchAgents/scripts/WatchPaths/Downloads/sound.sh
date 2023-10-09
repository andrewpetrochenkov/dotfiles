#!/usr/bin/env bash

# WatchPaths: ~/Downloads
# ThrottleInterval: 1

IFS=
files="$(find ~/Downloads -type f ! -name ".*" ! -name "*.part" -maxdepth 1 -ctime -5s)" || exit
[[ -z "$new_files" ]] && exit

/usr/bin/afplay /System/Library/Sounds/Glass.aiff
