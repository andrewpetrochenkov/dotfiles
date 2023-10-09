#!/usr/bin/env bash

tmutil status | grep Running | grep -q 1 && /usr/sbin/sysctl debug.lowpri_throttle_enabled=0 || /usr/sbin/sysctl debug.lowpri_throttle_enabled=1
