# ~/Library/Application Support/Cursor/User	MacOS
# %APPDATA%\Cursor\User						Windows
# ~/.config/Cursor/User						Linux
# ~/.cursor/extensions						all platforms

UNAME_S:=$(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	USER_DIR:=$(HOME)/Library/Application\ Support/Cursor/User
else
	USER_DIR:=$(HOME)/.config/Cursor/User
endif

CURSOR_EXT_DIR:=$(HOME)/.cursor/extensions

EXT_dotfiles-runners:=dotfiles.dotfiles-runners-1.0.0
EXT_duplicate-file:=dotfiles.duplicate-file-1.0.0

all: settings extensions

settings:
	mkdir -p "$(USER_DIR)"
	cp User/*.json "$(USER_DIR)"
	find "$(USER_DIR)" -maxdepth 1 -name '*.json'

extensions:
	mkdir -p "$(CURSOR_EXT_DIR)"
	rm -rf "$(CURSOR_EXT_DIR)/$(EXT_dotfiles-runners)" "$(CURSOR_EXT_DIR)/$(EXT_duplicate-file)"
	cp -R extensions/dotfiles-runners "$(CURSOR_EXT_DIR)/$(EXT_dotfiles-runners)"
	cp -R extensions/duplicate-file "$(CURSOR_EXT_DIR)/$(EXT_duplicate-file)"
