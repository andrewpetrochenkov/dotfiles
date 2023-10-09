#!/usr/bin/env bash
{ set +x; } 2>/dev/null

IFS=
list="$(launchctl list | grep scripts_)"
errors="$([[ -n "$list" ]] && while IFS= read l; do
    status="$(echo $l | awk '{print $2}')"
    [[ $status != 0 ]] && echo $l
done <<< "$list")"
[[ -z "$errors" ]] && exit

count="$(echo $errors | wc -l | tr -d ' ')"
echo "LaunchAgents ($count):<br />
${errors//$'\n'/<br />}"
