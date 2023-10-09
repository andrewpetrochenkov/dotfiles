#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# ~/Library/LaunchAgents overwritten by brew services
# find ~/Library/LaunchAgents -name "homebrew.*.plist" -exec launchctl load {} \;
# arch -arm64 /opt/homebrew/bin/brew services restart postgresql

