#!/usr/bin/env bash

# StartInterval: 30
# Afk_max: 5

finder-frontmost | grep -q 1 && exit

finder-close-duplicates 2> /dev/null;:
