#!/usr/bin/env bash

# WatchPaths: ~/Downloads
# ThrottleInterval: 1

IFS=
files="$(find ~/Downloads -type f ! -name ".*" ! -name "*.part" -maxdepth 1 -ctime -5s)" || exit
[[ -z "$new_files" ]] && exit

growlnotify -t "~/Downloads" -m "${new_files//$HOME/\~}" -a Finder

