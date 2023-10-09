XDG_CONFIG_HOME:= $(or $(XDG_CONFIG_HOME),~/.config)

all:
    # make dotfiles
    make initdb
    make chmod
    make conf
    # make install
    make createuser
    #make clean_logs
    make fix
    make restart
    make status

dotfiles:
    find $(CURDIR) -type f -name ".*" -exec cp {} $(XDG_CONFIG_HOME) \;

conf:
    find $(CURDIR) -type f -name "*.conf" -exec cp {} /usr/local/var/postgres \;

chmod:
    chmod 0600 $(PGPASSFILE)
    chmod 0750 /usr/local/var/postgres

fix:
    # PANIC:  could not locate a valid checkpoint record
    rm -fr /usr/local/var/postgres/postmaster.pid
    which -s pg_resetxlog && pg_resetxlog -f $(PGDATA);: # Postgres < 10.0
    which pg_resetwal && pg_resetwal -f $(PGDATA);: # Postgres >= 10.0
    # pg_resetwal -f /usr/local/var/postgres

clean_logs:
    find $(PGDATA)/pg_log -type f -name '*.log' -exec rm {} \;

install:
    which -s brew && make brew_install

initdb:
    # https://www.postgresql.org/docs/current/app-initdb.html
    # lc_collate values for database "postgres" do not match:  old "ru_RU.UTF-8", new "en_US.UTF-8"
    # rm -fr /usr/local/var/postgres
    # initdb /usr/local/var/postgres -E 'UTF-8' --locale='en_US.UTF-8'
    # fix: update pg_database set datcollate='en_US.UTF-8', datctype='en_US.UTF-8'
    # pg_dumpall -U postgres > pg_dumpall.sql
    # psql -U username -f pg_dumpall.sql postgres

createdb:
    psql -l | grep -q ^$(USER) || createdb $(USER)  # default database

createuser:
    createuser --no-password -s postgres 2> /dev/null;:
    # ALTER USER postgres WITH SUPERUSER;

status:
    which -s lunchy && lunchy status "postgres";:
    ps -ax | grep -v grep | grep postgres;:

# pg_resetwal DATADIR
brew_install:
    # brew update
    # brew install postgresql
    # brew update && brew upgrade postgresql
    # brew install postgres@10 - install postgres specific version
    # rm -fr /usr/local/var/postgres
    # mkdir /usr/local/var/postgres
    # postgres -D /usr/local/var/postgres
    # /usr/local/Cellar/postgresql/11.1_1/bin/postgres -D /usr/local/var/postgres
    # /usr/local/Cellar/postgresql/X.Y/bin/postgres -D /usr/local/var/postgres
    # brew uninstall postgres
    brew list postgres &>/dev/null || brew install postgres
    brew list lunchy &>/dev/null || brew install lunchy

brew_upgrade:
    # psql -c 'SELECT version()'
    brew upgrade postgresql
    brew postgresql-upgrade-database
