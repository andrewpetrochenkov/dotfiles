#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# remove ~/Library/LaunchAgents/homebrew.mxcl.postgresql@N.plist
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

