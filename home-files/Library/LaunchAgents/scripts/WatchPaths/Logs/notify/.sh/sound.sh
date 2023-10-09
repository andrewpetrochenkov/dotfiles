#!/usr/bin/env bash

path=~/Library/Logs

files="$(find "$path" -type f -name "*err*.log" ! -name ".*" -mtime -10s -size +0 -not -exec grep -q 'Killed: 9' {} \; -not -exec grep -q 'Terminated: 15' {} \; -print 2> /dev/null)" || exit
[[ -z "$files" ]] && exit

/usr/bin/afplay /System/Library/Sounds/Basso.aiff
