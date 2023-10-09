#!/usr/bin/env bash
{ set +x; } 2>/dev/null

usage() {
    echo "usage: $(basename $0)" 1>&2
    [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; exit
}

[[ $1 == "-h" ]] || [[ $1 == "--help" ]] && usage "$@"

[[ $OSTYPE != *"darwin"* ]] && echo "MacOS only" 1>&2 && exit

export LC_ALL=C # export required
/usr/sbin/ioreg -c IOHIDSystem | perl -ane 'if (/Idle/) {$idle=(pop @F)/1000000000; print $idle,"\n"; last}' | xargs printf "%1.f"

