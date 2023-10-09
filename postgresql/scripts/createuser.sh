#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; createuser --no-password -s postgres 2> /dev/null )
