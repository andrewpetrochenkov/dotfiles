#!/usr/bin/env bash
# -*- coding: utf-8 -*-

app="$(app-frontmost --name)" || exit
[[ "$app" != "Google Chrome" ]] && {
    /usr/bin/afplay /System/Library/Sounds/Frog.aiff
    /usr/local/bin/growlnotify -t "$app" -m "" -a "Safari"
    echo "SKIP: $app" && exit
}
