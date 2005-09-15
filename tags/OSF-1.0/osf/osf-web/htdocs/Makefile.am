SUBDIRS = templates

htdocsdir = $(pkgdatadir)/htdocs
dist_htdocs_DATA = \
	stylesheet.css

dist_pkgdata_DATA = \
	index.html

dist_htdocs_SCRIPTS = \
	amavis-config.cgi errorhandler.cgi postfix-logreport.cgi index.cgi \
	spamrules.cgi system-config.cgi remotetests.cgi config-backup.cgi \
	fetchmail-config.cgi

EXTRA_DIST = \
	amavis-config.cgi.in errorhandler.cgi.in postfix-logreport.cgi.in index.cgi.in \
	spamrules.cgi.in system-config.cgi.in remotetests.cgi.in config-backup.cgi.in \
	fetchmail-config.cgi.in

CLEANFILES = $(dist_htdocs_SCRIPTS)

include ../common.mk
