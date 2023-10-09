#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# RunAtLoad: true

ps -ax | grep -q mdimport && exit
mdimport ~/git 2> /dev/null &
