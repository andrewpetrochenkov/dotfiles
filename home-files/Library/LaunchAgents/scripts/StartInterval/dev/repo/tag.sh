#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# RunAtLoad: true
# StartInterval: 60

afk="$(afk)" || exits
[[ $afk -lt 5 ]] && exit

find ~/git -type d -mindepth 2 -maxdepth 2 -print0 | xargs -0 tag-sync "repo" || exit
find ~/git -type d -name scripts -mindepth 3 -maxdepth 3 | sed 's#/[^/]*$##' | xargs tag-sync "cli" || exit
find ~/git -type d \( -name "examples" -o -name "*-examples" \) -mindepth 2 -maxdepth 2 -print0 | xargs -0 tag-sync "examples" || exit
find ~/git/gists -type d -mindepth 1 -maxdepth 1 -print0 | xargs -0 tag-sync "gists" || exit
find ~/git -type d -name "*.py" -mindepth 2 -maxdepth 2 -print0 | xargs -0 tag-sync "py" || exit
find ~/git -type d -name "sublime-*" -mindepth 2 -maxdepth 2 -print0 | xargs -0 tag-sync "sublime" || exit
