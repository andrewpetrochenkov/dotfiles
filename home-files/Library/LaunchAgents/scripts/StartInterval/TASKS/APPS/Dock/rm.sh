#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 10
# RunAtLoad: true
# Exclude@array: games
# Exclude@array: sport

export EXEC_CACHE=~/.cache/exec-cache/tasks

dbname="tasks"
DOCK=~/Library/Dock/TODO

pg_isready | grep -q "accepting" || exit 0

class_names="$(psql -At -c "SELECT slug FROM task WHERE todo=false AND class_name IS NOT NULL" "$dbname")" || exit
[[ -n "$class_names" ]] && while IFS= read slug; do
    task_name="$(exec-cache psql -At -c "SELECT name FROM task WHERE slug='$slug'" "$dbname")" || exit
    [[ -z "$task_name" ]] && echo "ERROR: task with slug '$slug' NOT FOUND" 1>&2 && exit 1

    category_id="$(exec-cache psql -At -c "SELECT category_id FROM task WHERE slug='$slug'" "$dbname")" || exit
    [[ -z "$category_id" ]] && echo "ERROR: unknown category_id for task with slug='$slug'" 1>&2 && exit 1

    category_name="$(exec-cache psql -At -c "SELECT name FROM category WHERE id='$category_id'" "$dbname")" || exit
    [[ -z "$category_name" ]] && echo "ERROR: category with id '$category_id' NOT FOUND" 1>&2 && exit 1

    dst="$DOCK/$category_name/$task_name"
    [ -e "$dst" ] && { rm "$dst" || exit; }
done <<< "$class_names";:
