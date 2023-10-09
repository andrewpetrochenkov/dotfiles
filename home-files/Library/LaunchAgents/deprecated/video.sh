
#!/usr/bin/env bash

# StartInterval: 5
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

pid="$(vlc-pid)" || exit
[[ -n "$pid" ]] && vlc="$(osascript <<EOF
tell app "VLC"
    if playing is true and (current time>0) then
        return true
    end if
end tell
EOF
)"
# todo: youtube

files="$(sqlite3 "$db" "SELECT path FROM agents")" || exit

[[ -n "$files" ]] && while IFS= read f; do
    ! [ -e "$f" ] && continue
    grep -q "<key>Exclude</key>" "$f" || continue
    Exclude="$(/usr/libexec/PlistBuddy -c "Print Exclude" "$f" 2> /dev/null)"
    echo "$Exclude" | grep -q "video" || continue
    [[ -n "$vlc" ]] && {
        sql="INSERT OR IGNORE INTO locks VALUES ('$f','$KEY');"
    } || { sql="DELETE FROM locks WHERE path='$f' AND key='$KEY';"; }
    echo "$sql" >> "$tmp" || exit
done <<< "$files"
[ -s "$tmp" ] && { sqlite3 "$db" 1> /dev/null < "$tmp"; exit; };:

