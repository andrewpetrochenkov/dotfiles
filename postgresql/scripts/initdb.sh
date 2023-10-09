#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# https://www.postgresql.org/docs/current/app-initdb.html
# lc_collate values for database "postgres" do not match:  old "ru_RU.UTF-8", new "en_US.UTF-8"
# rm -fr /usr/local/var/postgres
# initdb /usr/local/var/postgres -E 'UTF-8' --locale='en_US.UTF-8'
# initdb /Volumes/HDD/var/postgres -E 'UTF-8' --locale='en_US.UTF-8'
# fix: update pg_database set datcollate='en_US.UTF-8', datctype='en_US.UTF-8'
# pg_dumpall -U postgres > pg_dumpall.sql
# psql -U username -f pg_dumpall.sql postgres
