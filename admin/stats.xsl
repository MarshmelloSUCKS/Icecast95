<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Icecast Streaming Media Server</title>
	<link rel="stylesheet" type="text/css" href="/style.css" />
	<link rel="stylesheet" type="text/css" href="/style-custom.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
</head>
<body>
	<div class="roundbox">
		<div class="roundbox-inner">
			<div class="titlebar">
				<span>Global Server Statistics</span>
				<img src="/close.png" class="close" />
			</div>
			<div class="spacing">
				<h3>Global Server Stats</h3>
					<div class="mountcont">
						<table class="yellowkeys">
							<tbody>
								<xsl:for-each select="/icestats">
									<xsl:for-each select="*">
										<xsl:if test = "name()!='source'"> 
											<tr>
							   					<td><xsl:value-of select="name()" /></td>
							   					<td><xsl:value-of select="." /></td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
			</div>
		</div>
	</div>
	
	<xsl:for-each select="source">
	<xsl:if test = "listeners!=''"> 
	<div class="roundbox">
		<div class="roundbox-inner">
			<div class="titlebar">
				<span>Mountpoint Statistics</span>
				<img src="/close.png" class="close" />
			</div>
			<div class="spacing">
				<h3 class="mount">Mountpoint <xsl:value-of select="@mount" /></h3>
					<div class="right">
						<xsl:choose>
							<xsl:when test="authenticator">
								<a class="auth" href="/auth.xsl">Login</a>
							</xsl:when>
							<xsl:otherwise>
								<ul class="mountlist">
									<li><a class="play" href="{@mount}.m3u">M3U</a></li>
									<li><a class="play" href="{@mount}.xspf">XSPF</a></li>
								</ul>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div class="mountcont">
						<ul class="nav">
						<li><a href="listclients.xsl?mount={@mount}">List Clients</a></li>
						<li><a href="moveclients.xsl?mount={@mount}">Move Listeners</a></li>
						<li><a href="updatemetadata.xsl?mount={@mount}">Update Metadata</a></li>
						<xsl:if test="authenticator">
							<li><a href="manageauth.xsl?mount={@mount}">Manage Authentication</a></li>
						</xsl:if>
						<li><a href="killsource.xsl?mount={@mount}">Kill Source</a></li>
					</ul>
					<xsl:if test="server_type and ((server_type = 'application/ogg') or (server_type = 'audio/ogg'))">
						<div class="audioplayer">
							<audio controls="controls" preload="none">
								<source src="{@mount}" type="{server_type}" />
							</audio>
						</div>
					</xsl:if>
					<table class="yellowkeys">
						<tbody>
							<xsl:for-each select="*">
								<tr>
									<td><xsl:value-of select="name()" /></td>
									<td><xsl:value-of select="." /></td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					</div>
			</div>
		</div>
	</div>
	</xsl:if>
	</xsl:for-each>
	<div class="padding" style="height: 15px;"></div>

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
