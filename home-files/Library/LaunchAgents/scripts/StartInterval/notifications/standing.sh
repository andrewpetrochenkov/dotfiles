#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# StartInterval: 3600
# Exclude@array: games
# Exclude@array: workout


# напоминание о работе стоя/на коленях для смены положения

title="смена положения"
message="периодически работайте стоя или на коленях"
image="standing.png"

growlnotify -t "$title" -m "$message" --image "$image"
