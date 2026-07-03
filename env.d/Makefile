TARGET_ENV := $(CURDIR)/../stow/home/.bash_env

.PHONY: all
all:
	find . -maxdepth 1 -type f -name "*.env" | sort | xargs cat > $(TARGET_ENV)
