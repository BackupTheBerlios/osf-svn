edit = sed \
	-e 's,@PERL\@,$(PERL),g' \
	-e 's,@bindir\@,$(bindir),g' \
	-e 's,@datadir\@,$(pkgdatadir),g' \
	-e 's,@htdocsdir\@,$(htdocsdir),g' \
	-e 's,@sysconfdir\@,$(sysconfdir)/$(PACKAGE),g'

%: %.in
	$(edit) $< >$@
