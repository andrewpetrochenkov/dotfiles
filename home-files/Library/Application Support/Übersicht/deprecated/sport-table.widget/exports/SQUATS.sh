#!/usr/bin/env bash
{ set +x; } 2>/dev/null

IFS=
database="gtd"
sql="SELECT count FROM workout.log WHERE exercise='squats' AND started::date=now()::date"
( set -x; psql -A -t -c "$sql" "$database" )
