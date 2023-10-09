include ~/.makerc # environment variables

all:
	mkdir $(PGDATA);:
	find $(CURDIR) -type f -name "*.conf" -exec cp {} $(PGDATA) \;
