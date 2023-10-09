#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 60

pid="$(vlc-pid)" || exit
[[ -z "$pid" ]] && exit

vlc-frontmost | grep -q 1 && exit

path="$(vlc-path)"
[[ -z "$path" ]] && kill "$pid";:
