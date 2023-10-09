#!/usr/bin/env bash
{ set +x; } 2>/dev/null

path=~/"Library/Application Support/Sublime Text 3/Packages"
( set -x; open -R "$path" )
