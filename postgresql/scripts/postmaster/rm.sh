#!/usr/bin/env bash
{ set +x; } 2>/dev/null

rm /opt/homebrew/var/postgres/postmaster.pid # default
rm /Volumes/HDD/var/postgres/postmaster.pid # my custom
