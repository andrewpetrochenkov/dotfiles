# ~/Library/Application Support/Cursor	MacOS
# %APPDATA%\Cursor     					Windows
# ~/.config/Cursor 						Linux

# https://packagecontrol.io/ 		Package Control

UNAME_S:=$(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	USER_DIR:=/Users/$(USER)/Library/Application\ Support/Cursor/User
else
	USER_DIR:=/Users/$(USER)/.config/Cursor/User
endif

all:
	rsync -a extensions/ ~/.cursor/extensions/
	cp User/*.json $(USER_DIR)
	find $(USER_DIR) -name "*.json" -maxdepth 1
