all:
	# osascript -e 'tell application id "tracesOf.Uebersicht" to refresh'
	# killall Übersicht not works (not ascii)
	ps -ax | grep -v grep | grep Übersicht.app | awk '{print $1}' | xargs kill -9 2> /dev/null;:
	open -a Übersicht
