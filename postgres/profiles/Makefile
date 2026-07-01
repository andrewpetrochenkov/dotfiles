POSTGRES_ROOT:= /Volumes/HDD/var/postgres

all:
	cp default/postgresql.conf $(POSTGRES_ROOT)/default/postgresql.conf
	cp github_raw/postgresql.conf $(POSTGRES_ROOT)/github_raw/postgresql.conf
	cp github_graphql_nodes/postgresql.conf $(POSTGRES_ROOT)/github_graphql_nodes/postgresql.conf
	cp github_starred_gists_buffer/postgresql.conf $(POSTGRES_ROOT)/github_starred_gists_buffer/postgresql.conf

	# psql -p 5434 -U $(whoami) -d template1 -c "CREATE ROLE postgres WITH SUPERUSER LOGIN;"
	# psql -p 5434 -U $(whoami) -d postgres -c "ALTER ROLE postgres WITH PASSWORD NULL;"

	# rsync -av --include='*.conf' --exclude='Makefile' . /Volumes/HDD/var/postgres/
	# sudo /usr/sbin/chown -R 999:999 /Volumes/HDD/var/postgres/
	# sudo chmod -R 0700 /Volumes/HDD/var/postgres/
