PACKAGE_NAME = osf-pull-config
VERSION = $(shell date '+%Y%m%d')

INSTALL = install -c
INSTALL_PROGRAM = $(INSTALL) -m 755
INSTALL_DATA = $(INSTALL) -m 644


all:


install: all installdirs
	$(INSTALL_DATA) cron.d $(DESTDIR)/etc/cron.d/$(PACKAGE_NAME)
	$(INSTALL_PROGRAM) pull-config $(DESTDIR)/usr/sbin/pull-config
	$(INSTALL_DATA) includelist $(DESTDIR)/etc/$(PACKAGE_NAME)
	$(INSTALL_DATA) pull-config.conf $(DESTDIR)/etc/$(PACKAGE_NAME)


installdirs:
	mkdir -p $(DESTDIR)/etc/cron.d
	mkdir -p $(DESTDIR)/usr/sbin
	mkdir -p $(DESTDIR)/etc/$(PACKAGE_NAME)


.PHONY: all install installdirs dist distdir clean


#include dist.mk
