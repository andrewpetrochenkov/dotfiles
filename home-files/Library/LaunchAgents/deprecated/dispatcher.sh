#!/usr/bin/env bash

# StartInterval: 2
# ThrottleInterval: 1

function sqlite3() {
    executable="$(which sqlite3)" || exit
    out="$("$executable" "$@" 2>&1)" && echo "$out" && return || {
        [[ "$out" == *"locked"* ]] && exit; echo "$out" 1>&2 && exit 1
    }
}

db=~/Library/launchd.db
list="$(launchctl list)"
locked_labels="$(sqlite3 "$db" "SELECT a.label
FROM agents as a
JOIN locks as l ON l.path=a.path
GROUP BY l.path
HAVING COUNT(l.path)>0")"
[[ -n "$locked_labels" ]] && { IFS=$'\n'; set $locked_labels; launchctl remove "$@"; }

out="$(sqlite3 "$db" "SELECT a.label, a.path
FROM agents as a
LEFT JOIN locks as l ON l.path=a.path
WHERE l.path IS NULL")"

while IFS= read l; do
    IFS='|';set $l;label="$1"; f="$2"
    [ -e "$f" ] || continue
    grep -q "Disabled" "$f" && continue
    echo "$list" | grep -q "$label"$ || { /bin/launchctl load "$f" || exit; }
done <<< "$out";:
