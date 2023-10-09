all:
	rsync -a --no-links --exclude .git $(CURDIR)/.[^.]* ~
