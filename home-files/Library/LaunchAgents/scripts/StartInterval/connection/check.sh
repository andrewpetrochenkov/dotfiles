#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 5

URL="https://www.google.com/"
TIMEOUT=4

/usr/sbin/networksetup -getairportpower en1 | grep -iq "Off" && exit

ps -ax | grep -v grep | grep -q "Transmission.app" && exit # torrent :)

curl -fIs --max-time $TIMEOUT -o /dev/null "$URL" 2> /dev/null && { ! [ -e ~/.offline ] && exit; rm ~/.offline; } || { [ -e ~/.offline ] && exit; touch ~/.offline; }


! [ -e ~/.offline ] && set -- -t "connected! :)" -m "$(date +"%H:%M:%S")" --image online.png
[ -e ~/.offline ] && set -- -t "offline :(" -m "$(date +"%H:%M:%S")" --image offline.png
growlnotify "$@" || exit

! [ -e ~/.offline ] && set "default_wallpaper.png" || set "disconnect.png"
path="$(image "$1")" || exit
wallpaper "$path" || exit

! [ -e ~/.offline ] && say:file :launchd:connection:online || say:file :launchd:connection:offline
:
