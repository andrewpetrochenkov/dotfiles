SSH_HOSTNAME:=aws
SRC_DIRNAME:=fonts
DST_DIRNAME:=/usr/share/fonts
TEMP_DIRNAME=/tmp/fonts

all:
	rsync -a --delete $(SRC_DIRNAME)/ -e ssh $(SSH_HOSTNAME):$(TEMP_DIRNAME)
	ssh $(SSH_HOSTNAME) sudo rsync -a $(TEMP_DIRNAME)/ $(DST_DIRNAME)
