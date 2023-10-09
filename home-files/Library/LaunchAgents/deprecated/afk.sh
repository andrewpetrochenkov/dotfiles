#!/usr/bin/env bash

# StartInterval: 3
# ThrottleInterval: 1

function sqlite3() {
    executable="$(which sqlite3)" || exit
    out="$("$executable" "$@" 2>&1)" && echo "$out" && return || {
        [[ "$out" == *"locked"* ]] && exit; echo "$out" 1>&2 && exit 1
    }
}

db=~/Library/launchd.db
KEY="afk"
tmp="$(mktemp)" || exit

afk="$(afk)" || exit

files="$(sqlite3 "$db" "SELECT path FROM agents")" || exit

[[ -n "$files" ]] && while IFS= read f; do
    ! [ -e "$f" ] && continue
    grep -q "<key>Afk_max</key>\|<key>Afk_min</key>" "$f" || continue
    Afk_max="$(/usr/libexec/PlistBuddy -c "Print Afk_max" "$f" 2> /dev/null)"
    Afk_min="$(/usr/libexec/PlistBuddy -c "Print Afk_min" "$f" 2> /dev/null)"
    [[ $afk -lt $Afk_min ]] || [[ $afk -gt $Afk_min ]] && {
        sql="INSERT OR IGNORE INTO locks VALUES ('$f','$KEY');"
    } || { sql="DELETE FROM locks WHERE path='$f' AND key='$KEY';"; }
    echo "$sql" >> "$tmp" || exit
done <<< "$files"
[ -s "$tmp" ] && { sqlite3 "$db" < "$tmp"; exit; };:

