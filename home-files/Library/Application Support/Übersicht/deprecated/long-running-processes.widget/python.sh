#!/usr/bin/env bash
{ set +x; } 2>/dev/null

MIN=5
processes="$(ps -ax -o pid,etime,command | grep -v "grep" | grep python)"
processes="$([[ -n "$processes" ]] && while IFS= read l; do
    pid="$(echo $l | awk '{print $1}')"
    seconds="$(pid-elapsed "$pid")"
    [[ "$seconds" -gt $MIN ]] && echo "$l"
done <<< "$processes")"
[[ -z "$processes" ]] && exit

count="$(echo "$processes" | wc -l | tr -d ' ')"
echo "<div style='text-align:center;color:white'>python ($count)</div>"
[[ -z "$processes" ]] && exit
echo "<table>"
while IFS= read l; do
    pid="$(echo $l | awk '{print $1}')"
    etime="$(echo $l | awk '{print $2}')"
    command="$(IFS=' ';set $l;shift 2; echo "$@")"
    echo "<tr><td>$pid</td><td>$etime</td><td>$command</td></tr>"
done <<< "$processes"
echo "</table>"
