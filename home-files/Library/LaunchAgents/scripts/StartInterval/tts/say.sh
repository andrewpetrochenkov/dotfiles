#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 1
# ThrottleInterval: 1

dbname="tts"

pg_isready | grep -q "accepting" || exit 0

r="$(psql -At -c "SELECT id,v,f FROM say ORDER BY created_at LIMIT 1" "$dbname")" || { echo "psql select error" 1>&2; exit 1; }
[[ -z "$r" ]] && exit

id="$(IFS='|';set $r; echo $1)"
v="$(IFS='|';set $r; echo $2)"
f="$(IFS='|';set $r; echo $3)"

psql -At -c "DELETE FROM say WHERE id=$id" "$dbname" 1> /dev/null || { echo "psql delete error" 1>&2; exit 1; }

sound="$(detect-sound)" || { echo "detect-sound error" 1>&2; exit 1; }
[[ -n "$sound" ]] && echo "SKIP: $sound" && exit

aiff="$(speech-cache -f "$f" -v "$v")" || { echo "speech-cache error" 1>&2; exit 1; }

afplay "$aiff" || { echo "afplay error" 1>&2; exit 1; }
sleep 3 # make some pause

