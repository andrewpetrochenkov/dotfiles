#!/usr/bin/env bash

# WatchPaths: ~/Library/Logs
# ThrottleInterval: 1

path=~/Library/Logs

files="$(find "$path" -type f -name "*err*.log" -size +0)" || exit
[[ -n "$files" ]] && while IFS= read f; do
    [ -e "$f" ] && grep -q "Terminated: 15" "$f" && {
        sed -i.bak '/Terminated: 15/d' "$f" || exit;
    }
done <<< "$files"

[[ -n "$files" ]] && while IFS= read f; do
    [ -e "$f" ] && grep -q "Killed: 9" "$f" && {
        sed -i.bak '/Killed: 9/d' "$f" || exit;
    }
done <<< "$files"

find "$path" -type f -name "*.bak" -exec rm {} \;
