#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; pg_resetwal -f "$PGDATA" )
