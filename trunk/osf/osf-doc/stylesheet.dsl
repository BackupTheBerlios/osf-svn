<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [

<!ENTITY % output-html          "IGNORE">
<!ENTITY % output-print         "IGNORE">
<!ENTITY % output-text          "IGNORE">

<![ %output-html; [
<!ENTITY dbstyle PUBLIC "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA DSSSL>
]]>

<![ %output-print; [
<!ENTITY dbstyle PUBLIC "-//Norman Walsh//DOCUMENT DocBook Print Stylesheet//EN" CDATA DSSSL>
]]>

<![ %output-text; [
<!ENTITY dbstyle PUBLIC "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA DSSSL>
]]>

]>

<style-sheet>
 <style-specification use="docbook">
  <style-specification-body> 

<!-- general customization ......................................... -->

<!-- (applicable to all output formats) -->

(define draft-mode              #f)

(define %callout-graphics%      #f)
(define %show-comments%         #t)
(define %honorific-punctuation% "")

(element command ($mono-seq$))
(element envar ($mono-seq$))
(element lineannotation ($italic-seq$))
(element literal ($mono-seq$))
(element option ($mono-seq$))
(element parameter ($mono-seq$))
(element structfield ($mono-seq$))
(element structname ($mono-seq$))
(element symbol ($mono-seq$))
(element token ($mono-seq$))
(element type ($mono-seq$))
(element varname ($mono-seq$))
(element (programlisting emphasis) ($bold-seq$)) ;; to highlight sections of code


<!-- HTML output customization ..................................... -->

<![ %output-html; [

(define %section-autolabel%     #t)
(define %label-preface-sections% #f)
(define %generate-legalnotice-link% #t)
(define %html-ext%              ".html")
(define %root-filename%         "index")
(define %link-mailto-url%       (string-append "mailto:" pgsql-docs-list))
(define %use-id-as-filename%    #t)
(define %stylesheet%            "stylesheet.css")
(define %graphic-default-extension% "gif")
(define %gentext-nav-use-ff%    #t)
(define %body-attr%             '())
(define html-index              #t)
(define %fix-para-wrappers%     #t)

;; Returns the depth of auto TOC that should be made at the nd-level
(define (toc-depth nd)
  (cond ((string=? (gi nd) (normalize "book")) 2)
	((string=? (gi nd) (normalize "set")) 2)
	((string=? (gi nd) (normalize "part")) 2)
	((string=? (gi nd) (normalize "chapter")) 2)
	(else 1)))

;; Put a horizontal line in the set TOC (just like the book TOC looks)
(define (set-titlepage-separator side)
  (if (equal? side 'recto)
      (make empty-element gi: "HR")
      (empty-sosofo)))


;; Format multiple terms in varlistentry vertically, instead
;; of comma-separated.
(element (varlistentry term)
  (make sequence
    (process-children-trim)
    (if (not (last-sibling?))
        (make empty-element gi: "BR")
        (empty-sosofo))))

]]> <!-- %output-html -->


<!-- Print output customization .................................... -->

<![ %output-print; [

(define %section-autolabel%     #t)
(define %default-quadding%      'justify)
(define %paper-type%            "A4")
(define %visual-acuity%         "presbyopic")
(define %two-side%              #t)

;; Don't know how well hyphenation works with other backends.  Might
;; turn this on if desired.
(define %hyphenation% #f)
;  (if tex-backend #t #f))

;; Put footnotes at the bottom of the page (rather than end of
;; section), and put the URLs of links into footnotes.
(define bop-footnotes           #t)
;(define %footnote-ulinks%       #t)

;; Indentation of verbatim environments.  (This should really be done
;; with start-indent in DSSSL.)
(define %indent-programlisting-lines% "    ")
(define %indent-screen-lines% "    ")
(define %indent-synopsis-lines% "    ")


;; Default graphic format: Jadetex wants eps, pdfjadetex wants pdf.
;; (Note that pdfjadetex will not accept eps, that's why we need to
;; create a different .tex file for each.)  What works with RTF?

(define texpdf-output #f) ;; override from command line

(define %graphic-default-extension%
  (cond (tex-backend (if texpdf-output "pdf" "eps"))
	(rtf-backend "gif")
	(else "XXX")))

;; Need to add pdf here so that the above works.  Default setup
;; doesn't know about PDF.
(define preferred-mediaobject-extensions
  (list "eps" "ps" "jpg" "jpeg" "pdf" "png"))


;; Fix spacing problems in variablelists

(element (varlistentry term)
  (make paragraph
    space-before: (if (first-sibling?)
		      %para-sep%
		      0pt)
    keep-with-next?: #t
    (process-children)))

(define %varlistentry-indent% 2em)

(element (varlistentry listitem)
  (make sequence
    start-indent: (+ (inherited-start-indent) %varlistentry-indent%)
    (process-children)))


;; Whitespace fixes for itemizedlists and orderedlists

(define (process-listitem-content)
  (if (absolute-first-sibling?)
      (make sequence
        (process-children-trim))
      (next-match)))


]]> <!-- %output-print -->


<!-- Plain text output customization ............................... -->

<!--
This is used for making the INSTALL file and others.  We customize the
HTML stylesheets to be suitable for dumping plain text (via Netscape,
Lynx, or similar).
-->

<![ %output-text; [

(define %section-autolabel% #f)
(define %chapter-autolabel% #f)
(define $generate-chapter-toc$ (lambda () #f))

;; For text output, produce "ASCII markup" for emphasis and such.

(define ($asterix-seq$ #!optional (sosofo (process-children)))
  (make sequence
    (literal "*")
    sosofo
    (literal "*")))
 
(define ($dquote-seq$ #!optional (sosofo (process-children)))
  (make sequence
    (literal (gentext-start-quote))
    sosofo
    (literal (gentext-end-quote))))
 
(element (para command) ($dquote-seq$))
(element (para emphasis) ($asterix-seq$))
(element (para filename) ($dquote-seq$))
(element (para option) ($dquote-seq$))
(element (para replaceable) ($dquote-seq$))
(element (para userinput) ($dquote-seq$))

]]> <!-- %output-text -->

  </style-specification-body>
 </style-specification>

 <external-specification id="docbook" document="dbstyle">
</style-sheet>
