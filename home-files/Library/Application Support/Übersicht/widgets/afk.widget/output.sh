#!/usr/bin/env bash
{ set +x; } 2>/dev/null

UEBERSICHT_AFK_MIN="${UEBERSICHT_AFK_MIN-30}"

afk="$(. "${BASH_SOURCE[0]%/*}"/afk.sh)" || exit
[[ -z "$afk" ]] && exit

[[ $afk -lt $UEBERSICHT_AFK_MIN ]] && exit

image="$(. "${BASH_SOURCE[0]%/*}"/image.sh)" || exit

now="$(date +%s)" || exit
t=$((now-s))
t="$(date -u -r $afk '+%H:%M:%S')" || exit

while [[ $t == 00* ]]; do t="${t:3}"; done

cat <<EOF
<div>
<nobr>
<img src="afk.widget/images/${image##*/}" style="vertical-align:middle" />$t
</nobr>
</div>
EOF
