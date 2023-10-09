#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 1
# ThrottleInterval: 1

user-is-afk && exit
chrome-frontmost | grep -q 1 && exit

url="$(chrome-url)" || exit
[[ -z "$url" ]] && exit

path="$(shell-cache "$url")" || exit
[[ -z "$path" ]] && exit
! [ -e "$path" ] && exit

selection="$(finder-selection)" || exit
[ -f "$selection" ] && selection="${selection%/*}"
[[ "$selection" == "${path%/*}" ]] && exit

folder=${path%/*}
[[ -z "$folder" ]] && echo "ERROR: EMPTY folder" 1>&2 && exit 1

finder-reveal "$folder" || exit
/usr/bin/afplay /System/Library/Sounds/Pop.aiff || exit
/usr/local/bin/growlnotify -t "${folder##*/}" -m "${folder/$HOME/\~}" -a Finder || exit
finder close-bg
