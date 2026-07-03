SITE_PACKAGES := $(shell python3 -c 'import sys; print([p for p in sys.path if "site-packages" in p][0])')

.PHONY: all
all:
	cp -R site-packages/* $(SITE_PACKAGES)/
