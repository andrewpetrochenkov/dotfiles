#!/usr/bin/env bash
{ set +x; } 2>/dev/null

cd "${BASH_SOURCE[0]%/*}" || exit

rm -fr widgets/afk.widget || exit
git clone https://github.com/looking-for-a-job/uebersicht-afk.widget.git widgets/afk.widget || exit

rm -fr widgets/ping.widget || exit
git clone https://github.com/looking-for-a-job/uebersicht-ping.widget.git widgets/ping.widget || exit

find . type d -name ".git" -exec rm -fr {} \;
