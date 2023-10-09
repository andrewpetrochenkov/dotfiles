#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 120

exit

URL="http://127.0.0.1:8000/"

vlc-playing | grep -q 1 && exit

afk="$(afk)" || exit
[[ $afk -lt 300 ]] && exit

urls="$(opera-urls)" || exit
[[ -n "$urls" ]] && exit

sleep 5
opera open "$URL" && opera fullscreen-enter
