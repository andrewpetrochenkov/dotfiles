#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# StartInterval: 600

pg_isready | grep -q "accepting" || exit 0

psql -c "DELETE FROM afk WHERE to_timestamp(t)<NOW()-interval '1 day'" afk
