#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 5

vlc-frontmost | grep -q 1 && exit
vlc-playing | grep -q 1 || exit 0

cache_key="VLC_path"
path="$(vlc-path)" || exit
cached="$(shell-cache "$cache_key")" || exit
[[ "$path" == "$cached" ]] && exit
vlc-fullscreen-enter || exit
shell-cache "$cache_key" "$path"
