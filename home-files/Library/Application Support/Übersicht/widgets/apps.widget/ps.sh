#!/usr/bin/env bash
{ set +x; } 2>/dev/null

ps -p 77910 -o etime | grep -v ELAPSED

