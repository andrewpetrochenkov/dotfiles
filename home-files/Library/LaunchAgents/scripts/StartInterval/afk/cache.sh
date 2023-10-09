#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 1
# ThrottleInterval: 1

exit

path="$CACHEDIR"/afk

export LC_ALL=C
afk="$(set -o pipefail; /usr/sbin/ioreg -c IOHIDSystem | perl -ane 'if (/Idle/) {$idle=(pop @F)/1000000000; print $idle,"\n"; last}' | xargs printf "%1.f")" || exit
[ "$afk" -gt 0 ] && { echo "$afk" > "$path" || exit; }
[ "$afk" == 0 ] && [ -e "$path" ] && { rm "$path" || exit; };:
