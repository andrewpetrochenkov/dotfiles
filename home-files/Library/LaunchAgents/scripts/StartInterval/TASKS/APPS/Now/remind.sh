#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 60
# Exclude@array: games
# Exclude@array: workout

dbname="tasks"

pg_isready | grep -q "accepting" || exit 0

slugs="$(psql -At -c "SELECT slug FROM task WHERE todo=true AND class_name IS NOT NULL" tasks)" || exit
[[ -n "$slugs" ]] && while IFS= read slug; do
    task:remind "$slug" || exit
done <<< "$slugs";:
