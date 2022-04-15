<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Server Status - Icecast Streaming Server</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<link rel="stylesheet" type="text/css" href="style-custom.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
	<!--Button positioning on navbar-->
	<style type="text/css">
		#title {
			position: absolute;
			bottom: 2px;
			left: 2px;
		}
		#link-admin {
			position: absolute;
			bottom: 2px;
			left: 167px;
		}
		#link-stats {
			position: absolute;
			bottom: 2px;
			left: 332px;
		}
		#link-vers {
			position: absolute;
			bottom: 2px;
			left: 497px;
		}
		#link-ice {
			position: absolute;
			bottom: 2px;
			left: 662px;
		}
	</style>
</head>
<body>
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
	<xsl:for-each select="source">
		<xsl:choose>
			<xsl:when test="listeners">
			<div class="roundbox">
			<div class="roundbox-inner">
				<div class="titlebar">
				<span>Mountpoint Statistics</span>
				<img src="close.png" class="close" />
				</div>
				<div class="spacing">
				<div class="mounthead">
					<h3 class="mount">Mount Point <xsl:value-of select="@mount" /></h3>
					<div class="right">
						<xsl:choose>
							<xsl:when test="authenticator">
								<a class="auth" href="/auth.xsl">Login</a>
							</xsl:when>
							<xsl:otherwise>
								<ul class="mountlist">
									<li><a class="play" href="{@mount}">Listen Live</a></li>
									<!-- <li><a class="play" href="{@mount}.vclt">VCLT</a></li> -->
								</ul>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
				<div class="mountcont">
					<xsl:if test="server_type and ((server_type = 'application/ogg') or (server_type = 'audio/ogg'))">
						<div class="audioplayer">
							<audio controls="controls" preload="none">
								<source src="{@mount}" type="{server_type}" />
							</audio>
						</div>
					</xsl:if>
					<table class="yellowkeys">
						<tbody>
							<xsl:if test="server_name">
								<tr>
									<td>Stream Name:</td>
									<td><xsl:value-of select="server_name" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="server_description">
								<tr>
									<td>Stream Description:</td>
									<td><xsl:value-of select="server_description" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="server_type">
								<tr>
									<td>Content Type:</td>
									<td><xsl:value-of select="server_type" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="stream_start">
								<tr>
									<td>Stream started:</td>
									<td class="streamstats"><xsl:value-of select="stream_start" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="bitrate">
								<tr>
									<td>Bitrate:</td>
									<td class="streamstats"><xsl:value-of select="bitrate" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="quality">
								<tr>
									<td>Quality:</td>
									<td class="streamstats"><xsl:value-of select="quality" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="video_quality">
								<tr>
									<td>Video Quality:</td>
									<td class="streamstats"><xsl:value-of select="video_quality" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="frame_size">
								<tr>
									<td>Framesize:</td>
									<td class="streamstats"><xsl:value-of select="frame_size" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="frame_rate">
								<tr>
									<td>Framerate:</td>
									<td class="streamstats"><xsl:value-of select="frame_rate" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="listeners">
								<tr>
									<td>Listeners (current):</td>
									<td class="streamstats"><xsl:value-of select="listeners" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="listener_peak">
								<tr>
									<td>Listeners (peak):</td>
									<td class="streamstats"><xsl:value-of select="listener_peak" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="genre">
								<tr>
									<td>Genre:</td>
									<td class="streamstats"><xsl:value-of select="genre" /></td>
								</tr>
							</xsl:if>
							<xsl:if test="server_url">
								<tr>
									<td>Stream URL:</td>
									<td class="streamstats">
										<a href="{server_url}"><xsl:value-of select="server_url" /></a>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>Now Playing:</td>
								<td class="streamstats">
								<xsl:if test="artist">
									<xsl:value-of select="artist" /> - 
								</xsl:if>
									<xsl:value-of select="title" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
			</div>
			</div>
			</xsl:when>
			<xsl:otherwise>
				<h3><xsl:value-of select="@mount" /> - Not Connected</h3>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
	<div class="padding" style="height: 15px;"></div>

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
</body>
</html>
</xsl:template>
</xsl:stylesheet>
