#!/usr/bin/env bash
{ set +x; } 2>/dev/null

bash="$(. "${BASH_SOURCE[0]%/*}"/bash.sh)" || exit
[[ -n "$bash" ]] && echo "$bash" && echo "<br />"

( . "${BASH_SOURCE[0]%/*}"/python.sh )
