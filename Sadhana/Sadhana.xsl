<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<html>
		<head>
			<title>MathJax TeX Test Page</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<script type="text/x-mathjax-config">
			  MathJax.Hub.Config({
				tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
			  });
			</script>
			<script type="text/javascript" src="MathJax/MathJax.js?config=TeX-AMS_HTML-full"></script>		
		</head>		
			<body>
				<h2 align="center">JOURNAL OF SADHANA</h2>
				<xsl:for-each select="journal/volume">
					<h2 align="center">Volume No.<xsl:value-of select="@vnum"/></h2>
					<xsl:for-each select="issue">
						<h2 align="center">Issue No.<xsl:value-of select="@inum"/></h2>
						<table border="1">
							<tr bgcolor="EEEEE">
								<th>Title</th>
								<th>Abstract</th>
							</tr>
							<xsl:for-each select="entry">
								<tr bgcolor="EEEEE">
									<td><xsl:value-of select="title" /></td>
									<td>
										<xsl:for-each select="abstract/p">
											<xsl:value-of select="."/><br /><br />											
										</xsl:for-each>
									</td>	
								</tr>
							</xsl:for-each>
						</table>	
					</xsl:for-each>			
				</xsl:for-each>								
			</body>
	</html>
</xsl:template>
</xsl:stylesheet>
