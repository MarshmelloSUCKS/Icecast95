<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/iceresponse" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Icecast Streaming Media Server</title>
	<link rel="stylesheet" type="text/css" href="/style.css" />
	<link rel="stylesheet" type="text/css" href="/style-custom.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
</head>
<body>

	<xsl:for-each select="/iceresponse">
		<div class="roundbox">
		<div class="roundbox-inner">
				<div class="titlebar">
					<span>Icecast Server Response</span>
					<img src="/close.png" class="close" />
				</div>
				<div class="spacing">
			<div class="mountcont">
			<h3>Response</h3>
			<p>Message: <xsl:value-of select="message" /></p>
			<p>Return Code: <xsl:value-of select="return" /></p>
			</div>
			</div>
		</div>
		</div>
	</xsl:for-each>

	<div class="navbar">
	<div class="navbar-inner"></div>
		<div class="button" id="title">
			<img src="/icas.png" width="auto" height="16" />
			<span>Icecast2 Status</span>
		</div>
		
		<a href="stats.xsl">
			<div class="button" id="link-admin">
				<img src="/admn.png" width="auto" height="16" />
				<span>Admin Home</span>
			</div>
		</a>

		<a href="listmounts.xsl">
			<div class="button" id="link-stats">
				<img src="/stat.png" width="auto" height="16" />
				<span>Mountpoint List</span>
			</div>
		</a>

		<a href="/status.xsl">
			<div class="button" id="link-vers">
				<img src="/stat.png" width="auto" height="16" />
				<span>Public Index</span>
			</div>
		</a>

		<a href="http://icecast.org">
			<div class="button" id="link-ice">
				<img src="/icas.png" width="auto" height="16" />
				<span>Support Icecast</span>
			</div>
		</a>

	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
