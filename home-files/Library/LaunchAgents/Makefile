all:
	make unload
	make cp
	make generate
	make env
	make logs
	make load
	make list

cp:
	rsync --delete -a scripts/ ~/Library/LaunchAgents/scripts
	rsync --delete -a bin/ ~/Library/LaunchAgents/.bin
	cp *.plist ~/Library/LaunchAgents
	find . -name "*.command" -exec chmod +x {} +
	find ~/Library/LaunchAgents/.bin -type f -exec chmod +x {} \;

generate:
	find ~/Library/LaunchAgents/scripts -type f ! -name ".*" \( -name "*.py" -o -name "*.sh" \) -print0 | xargs -0 launchd-generator

env:
	find ~/Library/LaunchAgents -name "*.plist" -mindepth 2 -print0 | xargs -0 python3 -m launchd_env .env

logs:
	find ~/Library/LaunchAgents/scripts -name "*.plist" -print0 | xargs -0 launchd-add-logs
	find ~/Library/LaunchAgents/scripts -name "*.plist" -print0 | xargs -0 launchd-mklogs

unload:
	bash scripts/.unload.command 2> /dev/null

load:
	bash scripts/.load.command

list:
	launchctl list | grep scripts;:
