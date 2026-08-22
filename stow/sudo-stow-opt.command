#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

( set -x; sudo stow --adopt --no-folding -d stow -t /opt opt )
