#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 2
# ThrottleInterval: 1

pg_isready | grep -q "accepting" || exit 0

afk="$(afk)" || exit
[[ -z "$afk" ]] && echo "ERROR: unknown afk" 1>&2 && exit 1
psql -c "INSERT INTO afk(t,afk) VALUES(extract(epoch from NOW())::int,$afk)" afk
