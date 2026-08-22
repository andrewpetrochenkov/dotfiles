#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

( set -x; stow --adopt --no-folding -d stow -t ~ macos )
