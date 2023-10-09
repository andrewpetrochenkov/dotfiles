#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 10

files="$(mdfind 'kMDItemContentType==com.apple.terminal.shell-script && kMDItemFSContentChangeDate>=$time.now(-60)')" || exit
[[ -n "$files" ]] && while IFS= read f; do
    [ -e "$f" ] && { ! [ -x "$f" ] && { chmod +x "$f" || exit; } }
done <<< "$files";:
