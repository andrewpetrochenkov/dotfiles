all:
	sudo cp *.sh /Library/LaunchDaemons
	sudo cp *.plist /Library/LaunchDaemons
	find /Library/LaunchDaemons -name "*.plist" | xargs sudo launchctl load
