all:
	make cp
	make env
	make bundleid
	make dock
	killall Dock

cp:
	cp -R Dock-apps/ ~/Applications/.Dock
	cp -R Finder-toolbar-apps/ ~/Applications/.Finder-toolbar
	mac-app-factory ~/Applications/.Dock ~/Applications/.Finder-toolbar

env:
	find ~/Applications/.Dock ~/Applications/.Finder-toolbar -name "*.app" -print0 | xargs -0 python3 -m mac_app_env .env

bundleid:
	find ~/Applications/.Finder-toolbar -name "*.app" -print0 | xargs -0 -I{} sh -c 'app-bundleid {} finder-toolbar."$$(basename "{}")"'

dock:
	finder-icon ~/Applications/.Dock/Хавчик ~/Applications/.Dock/Хавчик/.Icon.png
	python3 -m mac_dock.folders.add ~/Applications/.Dock/Хавчик
