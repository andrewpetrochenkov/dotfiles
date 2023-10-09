#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# RunAtLoad: true

export EXEC_CACHE=~/.cache/exec-cache/tasks
rm -fr "$EXEC_CACHE"
