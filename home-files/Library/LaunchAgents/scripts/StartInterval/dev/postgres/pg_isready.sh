#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 5
# ThrottleInterval: 5

# /tmp:5432 - no response
# /tmp:5432 - rejecting connections
# /tmp:5432 - accepting connections

out="$(pg_isready)"
[[ "$out" == *"accepting connections"* ]] && exit

growlnotify -t pg_isready -m "$out" --image=error.png
/usr/bin/afplay /System/Library/Sounds/Funk.aiff

