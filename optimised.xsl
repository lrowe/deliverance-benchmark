<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dv="http://namespaces.plone.org/xdv" xmlns:esi="http://www.edge-delivery.org/esi/1.0" xmlns:exsl="http://exslt.org/common" xmlns:str="http://exslt.org/strings" xmlns:xhtml="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="exsl str dv xhtml esi">
  <xsl:output method="xml" indent="no" omit-xml-declaration="yes" media-type="text/html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

    <xsl:template match="/">
        <html><head><xsl:apply-templates select="/html/head/base"/><meta http-equiv="content-type" content="text/html; charset=utf-8"/><xsl:apply-templates select="/html/head/title"/><meta name="keywords" content=""/><meta name="description" content=""/><link href="http://oskar:8080/theme/style.css" rel="stylesheet" type="text/css" media="screen"/></head><body>&#13;
<div id="header">&#13;
	<div id="menu"><xsl:apply-templates select="//*[@id = 'portal-globalnav']"/></div>&#13;
	<xsl:comment> end #menu </xsl:comment>&#13;
	<div id="search"><xsl:apply-templates select="//*[@id = 'portal-searchbox']"/></div>&#13;
	<xsl:comment> end #search </xsl:comment>&#13;
</div>&#13;
<xsl:comment> end #header </xsl:comment>&#13;
<xsl:comment> end #header-wrapper </xsl:comment>&#13;
<div id="logo">&#13;
	<h1><a href="#">Substantial </a></h1>&#13;
	<p><em> template design by <a href="http://www.freecsstemplates.org/"> CSS Templates</a></em></p>&#13;
</div>&#13;
<hr/><xsl:comment> end #logo </xsl:comment><div id="page">&#13;
	<div id="content">&#13;
		<div id="content-bgtop">&#13;
			<div id="content-bgbtm"><xsl:apply-templates select="//*[@id = 'content']/*"/></div>&#13;
		</div>&#13;
	</div>&#13;
	<xsl:comment> end #content </xsl:comment>&#13;
	<div id="sidebar"><xsl:apply-templates select="//*[@id = 'portal-column-two']"/></div>&#13;
	<xsl:comment> end #sidebar </xsl:comment>&#13;
	<div style="clear: both;"> </div>&#13;
	<xsl:comment> end #page </xsl:comment>&#13;
	<div id="footer">&#13;
		<p><xsl:apply-templates select="//*[@id = 'portal-colophon']/div[contains(concat(' ', normalize-space(@class), ' '), ' colophonWrapper ')]/ul/li"/></p>&#13;
	</div>&#13;
	<xsl:comment> end #footer </xsl:comment>&#13;
</div>&#13;
<xsl:apply-templates select="/html/body/@id"/></body></html>
    </xsl:template>
    <xsl:template match="style|script|xhtml:style|xhtml:script" priority="5">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:value-of select="text()" disable-output-escaping="yes"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="node()|@*" priority="1">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <!-- 
    
        Extra templates
    -->
    
</xsl:stylesheet>