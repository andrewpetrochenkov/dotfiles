#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 30
# RunAtLoad: true
# Exclude@array: games
# Exclude@array: sport

export EXEC_CACHE=~/.cache/exec-cache/tasks

dbname="tasks"
DOCK=~/Library/Dock/TODO
reload_dock=false

pg_isready | grep -q "accepting" || exit 0

slugs="$(psql -At -c "SELECT slug FROM task WHERE todo=true" tasks)" || exit
[[ -n "$slugs" ]] && while IFS= read slug; do
    app_name="${slug/_/-}"
    src="$(exec-cache app-path "$app_name" | grep ~/Applications)"
    [[ -z "$src" ]] && echo "ERROR: app not found for $slug" && exit 1

    task_name="$(exec-cache psql -At -c "SELECT name FROM task WHERE slug='$slug'" "$dbname")" || exit
    [[ -z "$task_name" ]] && echo "ERROR: task with slug '$slug' NOT FOUND" 1>&2 && exit 1

    category_id="$(exec-cache psql -At -c "SELECT category_id FROM task WHERE slug='$slug'" "$dbname")" || exit
    [[ -z "$category_id" ]] && echo "ERROR: unknown category_id for task with slug='$slug'" 1>&2 && exit 1

    category_name="$(exec-cache psql -At -c "SELECT name FROM category WHERE id='$category_id'" "$dbname")" || exit
    [[ -z "$category_name" ]] && echo "ERROR: category with id '$category_id' NOT FOUND" 1>&2 && exit 1

    dst="$DOCK/$category_name/$task_name"
    ! [ -e "$dst" ] && { finder-alias "$src" "$dst" || exit; reload_dock=true; }
done <<< "$slugs"
# screensaver?
# add to Dock?
[[ "$reload_dock" == true ]] && { killall Dock; };:
