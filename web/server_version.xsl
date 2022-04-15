<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Server Information - Icecast Streaming Server</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<link rel="stylesheet" type="text/css" href="style-custom.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
</head>
<body>
	<div class="navbar">
	<div class="navbar-inner"></div>
		<div class="button" id="title">
			<img src="icas.png" width="auto" height="16" />
			<span>Icecast2 Status</span>
		</div>
		
		<a href="admin/stats.xsl">
			<div class="button" id="link-admin">
				<img src="admn.png" width="auto" height="16" />
				<span>Administration</span>
			</div>
		</a>

		<a href="status.xsl">
			<div class="button" id="link-stats">
				<img src="stat.png" width="auto" height="16" />
				<span>Server Status</span>
			</div>
		</a>

		<a href="server_version.xsl">
			<div class="button" id="link-vers">
				<img src="vers.png" width="auto" height="16" />
				<span>Server Version</span>
			</div>
		</a>

		<a href="http://icecast.org">
			<div class="button" id="link-ice">
				<img src="icas.png" width="auto" height="16" />
				<span>Support Icecast</span>
			</div>
		</a>

	</div>
	<!--end index header menu -->
	<xsl:text disable-output-escaping="yes">
	&lt;!-- WARNING:
	 DO NOT ATTEMPT TO PARSE ICECAST HTML OUTPUT!
	 The web interface may change completely between releases.
	 If you have a need for automatic processing of server data,
	 please read the appropriate documentation. Latest docs:
	 https://icecast.org/docs/icecast-latest/icecast2_stats.html
	-->
	</xsl:text>
	<!--mount point stats-->
	<div class="roundbox">
	<div class="roundbox-inner">
	<div class="titlebar">
		<span>Server Information</span>
		<img src="close.png" class="close" />
	</div>
	<div class="spacing">
		<h3>Server Information</h3>
		<div class="mountcont">
			<table class="yellowkeys">
			<tbody>
				<xsl:for-each select="/icestats">
				<tr>
					<td>Location:</td>
					<td><xsl:value-of select="location" /></td>
				</tr>
				<tr>
					<td>Admin:</td>
					<td><xsl:value-of select="admin" /></td>
				</tr>
				<tr>
					<td>Host:</td>
					<td><xsl:value-of select="host" /></td>
				</tr>
				<tr>
					<td>Version:</td>
					<td><xsl:value-of select="server_id" /></td>
				</tr>
				</xsl:for-each>
				<tr>
					<td>Download:</td>
					<td><a href="https://icecast.org/download/">icecast.org</a></td>
				</tr>
				<tr>
					<td>Source code:</td>
					<td><a href="https://icecast.org/download/#git">icecast.org/download/#git</a></td>
				</tr>
				<tr>
					<td>Documentation:</td>
					<td><a href="https://icecast.org/docs/">icecast.org/docs</a></td>
				</tr>
				<tr>
					<td>Community:</td>
					<td><a href="https://icecast.org/contact/">icecast.org/contact</a></td>
				</tr>
				<tr>
					<td>Theme:</td>
					<td>Icecast95 theme made by IowanEASFan - <a href="https://msx.gay">msx.gay</a></td>
				</tr>
				<tr>
					<td>Body Font:</td>
					<td><a href="https://jdan.github.io/98.css/ms_sans_serif.woff2">ms_sans_serif.woff2</a> and <a href="https://jdan.github.io/98.css/ms_sans_serif_bold.woff2">ms_sans_serif_bold.woff2</a> from <a href="https://jdan.github.io/98.css/">98.css</a></td>
				</tr>
				<tr>
					<td>Header Font:</td>
					<td><a href="https://www.pentacom.jp/pentacom/bitfontmaker2/gallery/?id=9588">Bit Serif</a> by Owen Compher</td>
				</tr>
			</tbody>
			</table>
		</div>
		</div>
	</div>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
