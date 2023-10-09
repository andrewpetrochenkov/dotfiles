#!/usr/bin/env bash
{ set +x; } 2>/dev/null

launchctl list | grep postgres
