all:
	make cp
	make ln
	make logs
	which -s brew && make brew;: # macos

logs:
	mkdir -p /usr/local/var/log/nginx 2> /dev/null;:
	[ -s /usr/local/var/log/nginx/error.log ] && cat /usr/local/var/log/nginx/error.log;:
	# cat /usr/local/var/log/nginx/error.log
	# cat /usr/local/var/log/nginx/access.log

cp:
	# /etc/nginx not writable
	# /usr/local/etc/nginx/nginx.conf
	# /usr/local/etc/nginx/nginx.conf.default
	mkdir -p /etc/nginx /etc/nginx/sites-available
	cp ~/git/dotfiles/nginx/nginx.conf /etc/nginx/nginx.conf
	rsync --delete -a ~/git/dotfiles/nginx/sites-available/ /etc/nginx/sites-available
	cp nginx.conf /usr/local/etc/nginx/nginx.conf
	rsync --delete -a sites-available/ /usr/local/etc/nginx/sites-available

ln:
	mkdir /usr/local/etc/nginx/sites-enabled 2> /dev/null;:
	find /usr/local/etc/nginx/sites-available -type f -exec ln -fs '{}' /usr/local/etc/nginx/sites-enabled/ \;

brew:
	brew services restart nginx # brew services stop nginx
	brew services list | grep nginx
	ps -ax | grep nginx
	# /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
	# ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist

# nginx -t # TEST nginx.conf
# sudo nginx -g "daemon off;" # sudo if :80 port used
