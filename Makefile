all:
	find . -name ".DS_Store" -depth -exec rm {} \;
	find . -name Makefile -mindepth 2 -execdir make all \;
	find env.d -maxdepth 1 -type f -name "*.env" | sort | xargs cat > stow/home/.bash_env
