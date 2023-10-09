#!/usr/bin/env bash
{ set +x; } 2>/dev/null

month="$(date '+%d %-B')"
day="$(date '+%A')"
hm="$(date '+%H:%M')"

cat <<EOF
<div class="month">$month</div>
<div class="day">$day</div>
<div class="hm">$hm</div>
EOF
