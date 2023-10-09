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
KEY="apps"
tmp="$(mktemp)" || exit

app_name="$(lsappinfo info -only name `lsappinfo front`)" || exit
app_name="Finder"

files="$(sqlite3 "$db" "SELECT path FROM agents")" || exit

[[ -n "$files" ]] && while IFS= read f; do
    ! [ -e "$f" ] && continue
    grep -q "<key>Apps</key>" "$f" || continue
    Apps="$(/usr/libexec/PlistBuddy -c "Print Apps" "$f")" || exit
    echo "$Apps" | grep -q "$app_name" && {
        sql="INSERT OR IGNORE INTO locks VALUES ('$f','$KEY');"
    } || { sql="DELETE FROM locks WHERE path='$f' AND key='$KEY';"; }
    echo "$sql" >> "$tmp" || exit
done <<< "$files"
[ -s "$tmp" ] && { sqlite3 "$db" < "$tmp"; exit; };:
