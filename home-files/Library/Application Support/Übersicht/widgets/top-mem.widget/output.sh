#!/usr/bin/env bash
{ set +x; } 2>/dev/null

UEBERSICHT_TOP_MEM_COUNT="${UEBERSICHT_TOP_MEM_COUNT-10}"

echo "<div style='text-align:center;color:white'>top mem</div>"
echo "<table>"
out="$(top -l 1 -n $UEBERSICHT_TOP_MEM_COUNT -stats "pid,mem" -o mem | awk '!$0{i++;next;}i==1' | tail +2)"
while IFS= read l; do
    pid="$(echo $l | awk '{print $1}')"
    mem="$(echo $l | awk '{print $2}')"
    [[ $pid == 0 ]] && comm="kernel_task" || comm="$(ps -p $pid -o comm)"
    echo "<tr><td>${comm##*/}</td><td>$mem</td></tr>"
done <<< "$out"
echo "</table>"
