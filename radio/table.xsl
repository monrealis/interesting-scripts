<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//tr[position() > 1]"/>
    </xsl:template>

    <xsl:template match="tr">
        <xsl:variable name="s1">
            <xsl:apply-templates select="td[1]//text()"/>
        </xsl:variable>
        <xsl:variable name="s2">
            <xsl:apply-templates select="td[3]//text()"/>
        </xsl:variable>
        <xsl:value-of select="normalize-space($s1)"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space($s2)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>