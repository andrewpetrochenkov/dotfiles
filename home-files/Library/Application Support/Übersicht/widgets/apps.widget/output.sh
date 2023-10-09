#!/usr/bin/env bash
{ set +x; } 2>/dev/null

IFS=
lines="$(ps -ax | grep .app/ | grep "bash" | grep "psn")"

[[ -n "$lines" ]] && while IFS= read l; do
    path="${l%/*/*/*}"
    basename="${path##*/}"
    name="$(IFS='.';set $basename;echo $1)"
    pid="$(echo "$l" | awk '{print $1}')"
    t="$(ps -p $pid -o etime | grep -v ELAPSED)"
    src="images/$name.png"
    cat <<EOF
<img src="$src" width="32px" height="32px" /> $name $t<br />
EOF
done <<< "$lines";:
