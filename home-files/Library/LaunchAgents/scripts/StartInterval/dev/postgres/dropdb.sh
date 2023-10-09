#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# RunAtLoad: true
# StartInterval: 300

pg_isready | grep -q "accepting" || exit 0

psql -At -c "SELECT datname FROM pg_database
WHERE datname LIKE 'tmp_%' AND (pg_stat_file('base/'||oid||'/PG_VERSION')).modification<now()+interval '5 minutes'" | xargs -L 1 dropdb
