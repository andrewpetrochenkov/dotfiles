#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; find ~/Library/LaunchAgents/scripts -name "*.plist" | xargs launchctl unload );:
( set -x; launchctl list | grep scripts_ | awk '{print $3}' | xargs -I '{}' launchctl remove {} )
