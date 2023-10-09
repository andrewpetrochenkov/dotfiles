#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# RunAtLoad: true
# StartInterval: 60

IFS=
paths="$(mdfind 'kMDItemUserTags == repo')" || exit
[[ -n "$paths" ]] && while IFS= read path; do
    [ -e "$path"/$'Icon\r' ] && continue
    [ -e "$path" ] && { cd "$path" || exit; repo:icon || exit; }
done <<< "$paths";:
