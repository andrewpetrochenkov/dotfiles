#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 30

MAX=60

processes="$(ps -ax | grep anaconda_server | grep -v grep | awk '{print $1}')"
[[ -n "$processes" ]] && while IFS= read pid; do
    seconds="$(pid-elapsed "$pid")" || exit
    [[ -n "$seconds" ]] && [[ "$seconds" -gt $MAX ]] && kill "$pid" 2> /dev/null;:
done <<< "$processes";:
