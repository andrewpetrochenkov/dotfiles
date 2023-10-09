#!/usr/bin/env bash
{ set +x; } 2>/dev/null

ps -ax | grep -v grep | grep -v bash | grep postgres;:
