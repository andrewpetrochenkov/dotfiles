#!/usr/bin/env bash
{ set +x; } 2>/dev/null

IFS=
{ set -x; cd "${BASH_SOURCE[0]%/*}"; { set +x; } 2>/dev/null; }
{ set -x; . "${BASH_SOURCE[0]%/*/*}"/exports.sh || exit; { set +x; } 2>/dev/null; }

( set -x; . "${BASH_SOURCE[0]%/*/*}"/jinja2stdout.sh )
