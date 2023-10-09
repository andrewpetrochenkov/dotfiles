#!/usr/bin/env bash

# StartInterval: 5

finder-frontmost | grep -q 0 && exit

launchd-tag
