#!/usr/bin/env bash
{ set +x; } 2>/dev/null

find ~/Library/LaunchAgents -type f -mindepth 2 -name "*.plist" -wholename "*RunAtLoad*" ! -exec grep -q "Disabled" {} \; -print0 | xargs -0 launchctl load
sleep 10
find ~/Library/LaunchAgents -type f -mindepth 2 -name "*.plist" ! -wholename "*RunAtLoad*" ! -exec grep -q "Disabled" {} \; -print0 | xargs -0 launchctl load
