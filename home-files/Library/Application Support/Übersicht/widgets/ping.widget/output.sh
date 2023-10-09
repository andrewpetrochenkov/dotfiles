#!/usr/bin/env bash
{ set +x; } 2>/dev/null

cd "${BASH_SOURCE[0]%/*}" || exit

LINES=60
PLIST="$PWD"/uebersicht.ping.plist
OUT=/tmp/uebersicht.ping.out.log
ERR=/tmp/uebersicht.ping.err.log

[[ "${PWD%/*}" != ~/Library/Application\ Support/Übersicht/widgets ]] && {
    echo "ERROR: $PWD" && exit 1
}

grep -q WorkingDirectory "$PLIST" || {
    /usr/libexec/PlistBuddy -c "Add WorkingDirectory string '$PWD'" "$PLIST" 1> /dev/null || exit
}
grep -q StandardOutPath "$PLIST" || {
    /usr/libexec/PlistBuddy -c "Add StandardOutPath string '$OUT'" "$PLIST" 1> /dev/null || exit
}
grep -q StandardErrorPath "$PLIST" || {
    /usr/libexec/PlistBuddy -c "Add StandardErrorPath string '$ERR'" "$PLIST" 1> /dev/null || exit
}
# launchctl unload "$PLIST"
launchctl load -w "$PLIST" 2> /dev/null || exit
! [ -s "$OUT" ] && exit
echo "<div style='color:white'>ping google.com</div>"
count="$(wc -l < "$OUT" | tr -d ' ')"
[[ $count -gt 1000 ]] && {
    tail -$LINES "$OUT" > "$OUT".bak || exit
    mv "$OUT".bak "$OUT" || exit
}
tail -$LINES "$OUT" | sed 's#$#<br />#g'
