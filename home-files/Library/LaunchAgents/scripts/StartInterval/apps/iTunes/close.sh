#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 60

pid="$(itunes-pid)" || exit
[[ -z "$pid" ]] && exit
itunes-frontmost | grep -q 1 && exit

# id="$(tell application "iTunes" to id of current track)"
state="$(osascript -e 'tell application "iTunes" to player state')" || exit
[[ $state != *"playing"* ]] && kill "$pid";:
