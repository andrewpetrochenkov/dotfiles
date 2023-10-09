#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# RunAtLoad: true

db=~/Library/launchd.db
f="${BASH_SOURCE[0]%/*}"/db.sql
sqlite3 "$db" < "$f" || exit

files="$(find ~/Library/LaunchAgents -type f -mindepth 2 -name "*.plist")" || exit
[[ -n "$files" ]] && while IFS= read f; do
    Label="$(/usr/libexec/PlistBuddy -c "Print Label" "$f" 2> /dev/null)"
    sqlite3 "$db" "INSERT OR IGNORE INTO agents(path,label) VALUES ('$f','$Label');"
done <<< "$files";:

