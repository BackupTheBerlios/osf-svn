AUTOMAKE_OPTIONS = 1.9 foreign

DSSSL_STYLESHEETS = /usr/share/sgml/docbook/stylesheet/dsssl/modular
XMLDCL = /usr/share/xml/declaration/xml.dcl


all-local: chunk-de doc.de.txt doc.de.html doc.de.pdf

doc.%.html: stylesheet-html.xsl doc.%.xml
	$(XSLTPROC) $(XSLTPROCFLAGS) -o $@ $^

doc.%.txt: doc.%.html
	lynx -dump -nolist $< >$@

chunk-%: stylesheet-chunk.xsl doc.%.xml
	mkdir -p html-$*
	$(XSLTPROC) $(XSLTPROCFLAGS) --stringparam 'base.dir' 'html-$*/' $^
	cp stylesheet.css html-$*/

%.tex: %.xml
	$(JADE) -c $(DSSSL_STYLESHEETS)/catalog -d stylesheet.dsl -i output-print -t tex -V tex-backend $(XMLDCL) $<

%.pdf: %.tex
	$(PDFJADETEX) $<
	$(PDFJADETEX) $<
	$(PDFJADETEX) $<


clean-local:
	rm -rf html-[a-z][a-z]/ doc.*.html doc.*.txt doc.*.tex doc.*.pdf doc.*.aux doc.*.out doc.*.log
