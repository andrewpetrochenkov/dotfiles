#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# RunAtLoad: true

files="$(mdfind 'kMDItemContentType==com.apple.web-internet-location')" || exit
[[ -n "$files" ]] && while IFS= read f; do
    [ -e "$f" ] && {
        url="$(/usr/libexec/PlistBuddy -c "Print URL" "$f")" || exit
        shell-cache "$url" "$f" || exit
    }
done <<< "$files";:
