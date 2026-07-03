#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

( set -x; sudo rsync -r --exclude "${BASH_SOURCE[0]}" "${BASH_SOURCE[0]%/*}"/ / )

