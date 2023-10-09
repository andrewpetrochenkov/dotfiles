#!/usr/bin/env bash
{ set +x; } 2>/dev/null

psql -l | grep -q ^"$USER" || ( set -x; createdb "$USER" )
