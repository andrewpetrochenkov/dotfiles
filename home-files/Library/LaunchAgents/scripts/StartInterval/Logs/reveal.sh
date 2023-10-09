#!/usr/bin/env bash

# WatchPaths: ~/Library/Logs
# ThrottleInterval: 10

path=~/Library/Logs

files="$(find "$path" -type f -name "*err*.log" ! -name ".*" -mtime -10s -size +0 -not -exec grep -q 'Killed: 9' {} \; -not -exec grep -q 'Terminated: 15' {} \; -print 2> /dev/null)" || exit
[[ -z "$files" ]] && exit

# todo: say
afk="$(afk)" || exit
[[ $afk -gt 300 ]] && exit

echo "$path"
[ -e "$files" ] && set -- "$files" || set -- "$path"
[[ $afk -gt 20 ]] && { finder-reveal "$@"; exit; };:
