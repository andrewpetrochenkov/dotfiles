#!/usr/bin/env bash
{ set +x; } 2>/dev/null

lunchy status "postgres";:
# ps -ax | grep -v grep | grep -v bash | grep postgres;:
