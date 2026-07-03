#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

( set -x; sudo cp -R ~/git/dotfiles/etc/. /etc )
( set -x; open -R /etc )
