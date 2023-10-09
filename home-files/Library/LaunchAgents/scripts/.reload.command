#!/usr/bin/env bash
{ set +x; } 2>/dev/null

bash "${BASH_SOURCE[0]%/*}"/.unload.command && bash "${BASH_SOURCE[0]%/*}"/.load.command
