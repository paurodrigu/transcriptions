<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <xsl:variable name="current_n" >
            <xsl:number count="tei:lb" level="any" from="tei:cb"/>
        </xsl:variable>
        <lb xmlns="http://www.tei-c.org/ns/1.0" >
            <xsl:apply-templates select="@*|node()"/>
            <xsl:if test="$current_n &lt; 100">
                <xsl:attribute name="n" select="$current_n"/>
            </xsl:if>
        </lb>    
        
    </xsl:template>
    
    
    
</xsl:stylesheet>
