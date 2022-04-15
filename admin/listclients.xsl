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
	<xsl:for-each select="source">
		<div class="roundbox">
		<div class="roundbox-inner">
			<div class="titlebar">
				<span>Mountpoint Client Connections</span>
				<img src="/close.png" class="close" />
			</div>
			<div class="spacing">
			<div class="mounthead">
				<h3>Clients Connected to <xsl:value-of select="@mount" /></h3>
			</div>
			<div class="mountcont">
				<ul class="nav">
					<li class="active"><a href="listclients.xsl?mount={@mount}">List Clients</a></li>
					<li><a href="moveclients.xsl?mount={@mount}">Move Listeners</a></li>
					<li><a href="updatemetadata.xsl?mount={@mount}">Update Metadata</a></li>
					<xsl:if test="authenticator">
						<li><a href="manageauth.xsl?mount={@mount}">Manage Authentication</a></li>
					</xsl:if>
					<li><a href="killsource.xsl?mount={@mount}">Kill Source</a></li>
				</ul>
				<xsl:choose>
					<xsl:when test="listener">
						<div class="scrolltable">
							<table class="colortable">
								<thead>
									<tr>
										<td>IP</td>
										<td>Sec. connected</td>
										<td>User Agent</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<xsl:variable name = "themount"><xsl:value-of select="@mount" /></xsl:variable>
									<xsl:for-each select="listener">
										<tr>
											<td>
												<xsl:value-of select="IP" />
												<xsl:if test="username">
													(<xsl:value-of select="username" />)
												</xsl:if>
											</td>
											<td><xsl:value-of select="Connected" /></td>
											<td><xsl:value-of select="UserAgent" /></td>
											<td><a href="killclient.xsl?mount={$themount}&amp;id={ID}">Kick</a></td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<p>No listeners connected</p>
					</xsl:otherwise>
				</xsl:choose>
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
