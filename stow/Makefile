all:
	# brew install stow
	stow --adopt --ignore=daemon.json bin config docker home ssh -t $(HOME)
	find -L ~/.local/bin -type f -exec chmod +x {} \;
	# custom hacks
	rm -f $(HOME)/.docker/daemon.json
	cp -f docker/.docker/daemon.json $(HOME)/.docker/daemon.json
	chmod +x ~/.config/git/hooks/pre-commit
