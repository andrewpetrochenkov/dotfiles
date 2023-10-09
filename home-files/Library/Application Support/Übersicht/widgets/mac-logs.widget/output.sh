#!/usr/bin/env bash
{ set +x; } 2>/dev/null

cd ~/Library/Logs || exit

# err.log, error.log, errors.log, stderr.log
files="$(find "$PWD" -type f -name "*err*.log" -size +0 -print)" || exit
[[ -z "$files" ]] && exit

count="$(echo $errors | wc -l | tr -d ' ')"
echo "~/Library/Logs ($count):<br />"
echo $files | sed "s/${HOME//\//\\/}/\~/g" | sed 's#$#<br />#g'
