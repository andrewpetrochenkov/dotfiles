#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# arch -arm64 /opt/homebrew/bin/brew update
# arch -arm64 /opt/homebrew/bin/brew upgrade postgresql
arch -arm64 /opt/homebrew/bin/brew install postgresql
# brew install postgresql@15
