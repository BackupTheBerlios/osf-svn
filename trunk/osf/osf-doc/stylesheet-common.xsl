<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output
    method="xml"
    encoding="utf-8"
    omit-xml-declaration="yes"
    standalone="yes"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    indent="yes"/>

  <xsl:param name="fast" select="'0'"/>

  <xsl:param name="callout.graphics" select="'0'"></xsl:param>
  <xsl:param name="toc.section.depth">2</xsl:param>
  <xsl:param name="linenumbering.extension" select="'0'"></xsl:param>
  <xsl:param name="generate.index" select="1 - $fast"></xsl:param>
  <xsl:param name="preface.autolabel" select="1 - $fast"></xsl:param>
  <xsl:param name="section.autolabel" select="1 - $fast"></xsl:param>
  <xsl:param name="section.label.includes.component.label" select="1 - $fast"></xsl:param>
  <xsl:param name="html.stylesheet" select="'stylesheet.css'"></xsl:param>
  <xsl:param name="use.id.as.filename" select="'1'"></xsl:param>
  <xsl:param name="make.valid.html" select="1"></xsl:param>
  <xsl:param name="generate.id.attributes" select="1"></xsl:param>
  <xsl:param name="generate.legalnotice.link" select="1"></xsl:param>
  <xsl:param name="refentry.xref.manvolnum" select="0"/>
  <xsl:param name="formal.procedures" select="0"></xsl:param>
  <xsl:param name="punct.honorific" select="''"></xsl:param>
  <xsl:param name="chunker.output.indent" select="'yes'"/>
  <xsl:param name="chunk.quietly" select="1"></xsl:param>

  <!-- Change display of some elements -->

  <xsl:template match="command">
    <xsl:call-template name="inline.monoseq"/>
  </xsl:template>

  <xsl:template match="productname">
    <xsl:call-template name="inline.charseq"/>
  </xsl:template>

  <xsl:template match="structfield">
    <xsl:call-template name="inline.monoseq"/>
  </xsl:template>

  <xsl:template match="structname">
    <xsl:call-template name="inline.monoseq"/>
  </xsl:template>

  <xsl:template match="symbol">
    <xsl:call-template name="inline.monoseq"/>
  </xsl:template>

  <xsl:template match="systemitem">
    <xsl:call-template name="inline.charseq"/>
  </xsl:template>

  <xsl:template match="token">
    <xsl:call-template name="inline.monoseq"/>
  </xsl:template>

  <xsl:template match="type">
    <xsl:call-template name="inline.monoseq"/>
  </xsl:template>

  <xsl:template match="programlisting/emphasis">
    <xsl:call-template name="inline.boldseq"/>
  </xsl:template>

  <!--
    Format multiple terms in varlistentry vertically, instead
    of comma-separated.
   -->

  <xsl:template match="varlistentry/term[position()!=last()]">
    <span class="term">
      <xsl:call-template name="anchor"/>
      <xsl:apply-templates/>
    </span><br/>
  </xsl:template>

</xsl:stylesheet>
