#!/usr/bin/env bash

# StartInterval: 5

IFS=
list="$(/bin/launchctl list | grep scripts_)"
errors="$([[ -n "$list" ]] && while IFS= read l; do
    status="$(echo $l | awk '{print $2}')"
    [[ $status -gt 0 ]] && echo $l
done <<< "$list")"
[[ -n "$errors" ]] && {
    message="$(echo "$errors" | column -t -s $'\t')"
    growlnotify -t "LaunchAgents" -m "$message" --image "errors.png"; exit;
}
path="$(/usr/libexec/PlistBuddy -c "Print StandardErrorPath" "$1" 2> /dev/null)"
[ -s "$path" ] && { echo "" > "$path" || exit; };:
