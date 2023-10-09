#!/usr/bin/env bash
{ set +x; } 2>/dev/null

images="$(find "${BASH_SOURCE[0]%/*}"/images -type f -name "*.png")" || exit
count="$(echo "$images" | wc -l | tr -d ' ')"
m="$(date +%M)"
n=$(($m%count+1))
echo $images | sed "${n}q;d"

