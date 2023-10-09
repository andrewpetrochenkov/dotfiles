#!/usr/bin/env bash
{ set +x; } 2>/dev/null

txt=~/.data/workout.txt
! [ -e "$txt" ] && exit 
( set -x; cat "$txt" )
