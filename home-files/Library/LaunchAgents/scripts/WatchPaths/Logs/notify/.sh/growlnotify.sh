#!/usr/bin/env bash

path=~/Library/Logs

files="$(find "$path" -type f -name "*err*.log" ! -name ".*" -mtime -10s -size +0 -not -exec grep -q 'Killed: 9' {} \; -not -exec grep -q 'Terminated: 15' {} \; -print 2> /dev/null)" || exit
[[ -z "$files" ]] && exit

time="$(date +'%H:%M:%S')" || exit
growlnotify -t "~/Library/Logs $time" -m "${files//$HOME/\~}" --image errors.png
