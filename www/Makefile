all:
	# sudo mkdir /var/www
	# sudo chown $USER /var/www
	rsync -a "$(CURDIR)"/. /var/www
	#rsync -a --delete $(SRC_DIRNAME)/ -e ssh $(SSH_HOSTNAME):$(TEMP_DIRNAME)
	#ssh $(SSH_HOSTNAME) sudo rsync -a $(TEMP_DIRNAME)/ $(DST_DIRNAME)
