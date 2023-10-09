#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 600
# Afk_max: 120

PLIST=~/Library/Containers/net.sourceforge.cruisecontrol.CCMenu/Data/Library/Preferences/net.sourceforge.cruisecontrol.CCMenu.plist
[ -e "$PLIST" ] && ! [ -s "$PLIST" ] && { rm "$PLIST" || exit; };: # delete broken file

old="$(mktemp)" || exit
new="$(mktemp)" || exit

travis sync &> /dev/null || exit 0

travis repos -a > "$new" || exit 0
python3 -m ccmenu.projects.names > "$old" || exit
diff "$new" "$old" &> /dev/null && exit
cat "$new" | xargs python3 -m ccmenu.travis.set || exit
[ -e "$PLIST" ] && ! [ -s "$PLIST" ] && { rm "$PLIST" || exit; };: # delete broken file
