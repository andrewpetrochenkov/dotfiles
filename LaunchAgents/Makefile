all:
	# ~/Library/LaunchAgents overwritten by brew services
	find ~/Library/LaunchAgents -name "homebrew.*.plist" -exec launchctl unload {} \;
	find $(CURDIR) -type f -name "*.plist" -maxdepth 1 -exec cp {} ~/Library/LaunchAgents \;
	find ~/Library/LaunchAgents -name "homebrew.*.plist" -exec chmod 644 {} \;
	find ~/Library/LaunchAgents -name "homebrew.*.plist" -exec launchctl load {} \;
	find ~/Library/LaunchAgents -name "homebrew.*.plist" -exec chflags nouchg {} \; # unlock
	find ~/Library/LaunchAgents -name "homebrew.*.plist" -exec chflags uchg {} \; # lock
	launchctl list | grep homebrew

