bin_SCRIPTS = osf-genconf

EXTRA_DIST = osf-genconf.in

CLEANFILES = $(bin_SCRIPTS)


edit = sed \
	-e 's,@PERL\@,$(PERL),g' \
	-e 's,@templatedir\@,$(pkgdatadir)/conf-templates,g'

%: %.in
	$(edit) $< >$@
