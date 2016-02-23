<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
		The MIT License (MIT)

		Copyright (c) 2016, Lumen Novus Incorporated d/b/a SharePoint Experience
		http://sharepointexperience.com/

		Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

		The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	-->
	<xsl:output method="html" indent="yes"/>
	<xsl:param name="WPQ"/>
	<xsl:template match="/">
		<div id="{$WPQ}-contacts">
			<xsl:apply-templates/>
			<link rel="stylesheet" href="http://appsforoffice.microsoft.com/fabric/1.0/fabric.min.css"/>
			<link rel="stylesheet" href="http://appsforoffice.microsoft.com/fabric/1.0/fabric.components.min.css"/>
			<script>
				var myControl = document.getElementById(<xsl:value-of select="$WPQ"/>);
			</script>
		</div>
	</xsl:template>
	<xsl:template match="/dsQueryResponse/Rows/Row">
		<div class="ms-ListItem is-selectable">
			<xsl:if test="@ID = 2">
				<xsl:attribute name="class">ms-ListItem is-unread</xsl:attribute>
			</xsl:if>
			<span class="ms-ListItem-primaryText" data-fieldname="Full Name">
				<xsl:value-of select="@FirstName"/> <xsl:value-of select="@Title"/>
			</span>
			<span class="ms-ListItem-secondaryText" data-fieldname="Email">
				<xsl:value-of select="@Email" disable-output-escaping="yes"/>
			</span>
			<span class="ms-ListItem-tertiaryText" data-fieldname="Work Phone">
				<xsl:value-of select="@WorkPhone"/>
			</span>
			<span class="ms-ListItem-metaText" data-fieldname="Item ID">
				<xsl:value-of select="@ID"/>
			</span>
			<div class="ms-ListItem-selectionTarget js-toggleSelection"></div>
			<div class="ms-ListItem-actions">
				<div class="ms-ListItem-action"></div>
				<div class="ms-ListItem-action"></div>
				<div class="ms-ListItem-action"></div>
				<div class="ms-ListItem-action"></div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>