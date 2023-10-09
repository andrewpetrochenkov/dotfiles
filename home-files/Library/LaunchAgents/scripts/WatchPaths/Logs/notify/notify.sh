#!/usr/bin/env bash

# WatchPaths: ~/Library/Logs
# ThrottleInterval: 10

path=~/Library/Logs

files="$(find "$path" -type f -name "*err*.log" ! -name ".*" -mtime -10s -size +0 -not -exec grep -q 'Killed: 9' {} \; -not -exec grep -q 'Terminated: 15' {} \; -print 2> /dev/null)" || exit
[[ -z "$files" ]] && exit

. "${BASH_SOURCE[0]%/*}"/.sh/sound.sh || exit
. "${BASH_SOURCE[0]%/*}"/.sh/growlnotify.sh || exit
. "${BASH_SOURCE[0]%/*}"/.sh/Discord/webhook.sh || exit
