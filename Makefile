all:
	rsync -a --no-links --exclude .git $(CURDIR)/.[^.]* ~
	chmod 0600 $(HOME)/.pgpass

