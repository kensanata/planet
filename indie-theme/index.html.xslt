<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:atom="http://www.w3.org/2005/Atom"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:planet="http://planet.intertwingly.net/"
                xmlns="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="atom planet xhtml">

<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="atom:feed">

  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;&#10;</xsl:text>

    <html>

      <!-- head -->
      <xsl:text>&#10;&#10;</xsl:text>
      <head><xsl:text>&#10;&#10;</xsl:text>
        <xsl:text disable-output-escaping='yes'>&lt;link rel="stylesheet" href="default.css" type="text/css"/&gt;</xsl:text><xsl:text>&#10;</xsl:text>
        <title><xsl:value-of select="atom:title"/></title><xsl:text>&#10;</xsl:text>
	<!-- meta robots -->
	<xsl:text disable-output-escaping='yes'>&lt;meta name="robots" content="noindex,nofollow"&gt;</xsl:text><xsl:text>&#10;</xsl:text>
	<!-- meta generator -->
        <xsl:text disable-output-escaping='yes'>&lt;meta name="generator" content="</xsl:text>
	<xsl:value-of select="atom:generator"/>
	<xsl:text disable-output-escaping='yes'>"&gt;</xsl:text><xsl:text>&#10;</xsl:text>
	<!-- link to atom.xml -->
        <xsl:if test="atom:link[@rel='self']">
          <xsl:text disable-output-escaping='yes'>&lt;link rel="alternate" href="</xsl:text>
          <xsl:value-of select="atom:link[@rel='self']/@href"/><xsl:text>" title="</xsl:text>
	  <xsl:value-of select="atom:title"/><xsl:text>" type="</xsl:text>
          <xsl:value-of select="atom:link[@rel='self']/@type"/><xsl:text disable-output-escaping='yes'>"&gt;</xsl:text>
	  <xsl:text>&#10;</xsl:text>
        </xsl:if>
        <xsl:text disable-output-escaping='yes'>&lt;link rel="shortcut icon" type="image/x-icon" href="images/venus.ico"&gt;</xsl:text><xsl:text>&#10;</xsl:text>
        <xsl:text disable-output-escaping='yes'>&lt;link rel="icon" type="image/x-icon"  href="images/venus.ico"&gt;</xsl:text><xsl:text>&#10;</xsl:text>
        <script type="text/javascript" src="personalize.js">
	<!-- hack to prevent XHTML tag minimization -->
	<xsl:text>&#x20;</xsl:text>
	</script>
      </head>

      <xsl:text>&#10;&#10;</xsl:text>
      <body>
        <xsl:text>&#10;</xsl:text>
	<p class="invisible"><a href="#body">Skip to content</a></p>
        <h1><xsl:value-of select="atom:title"/></h1>

        <xsl:text>&#10;</xsl:text>
        <div id="sidebar">

	  <p class="small">
	    <a href="/wiki/Planet/What%20is%20this%3f">What is this?</a>
	  </p>

          <xsl:text>&#10;&#10;</xsl:text>
          <h2>Members</h2>
          <xsl:text>&#10;</xsl:text>
          <ul>
            <xsl:for-each select="planet:source">
              <xsl:sort select="planet:name"/>
              <xsl:text>&#10;</xsl:text>
              <li>
                <!-- icon -->
                <a title="subscribe to {planet:name}’s feed">
                  <xsl:choose>
                    <xsl:when test="planet:http_location">
                      <xsl:attribute name="href">
                        <xsl:value-of select="planet:http_location"/>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="atom:link[@rel='self']/@href">
                      <xsl:attribute name="href">
                        <xsl:value-of select="atom:link[@rel='self']/@href"/>
                      </xsl:attribute>
                    </xsl:when>
                  </xsl:choose>
                  <xsl:text disable-output-escaping='yes'>&lt;img src="images/feed-icon-10x10.png" alt="(feed)"&gt;</xsl:text>
                </a>
                <xsl:text>&#x20;</xsl:text>

                <!-- name -->
                <a href="{atom:link[@rel='alternate']/@href}">
                  <xsl:choose>
                    <xsl:when test="planet:message">
                      <xsl:attribute name="class">message</xsl:attribute>
                      <xsl:attribute name="title">
                        <xsl:value-of select="planet:message"/>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="atom:title">
                      <xsl:attribute name="title">
                        <xsl:value-of select="atom:title"/>
                      </xsl:attribute>
                    </xsl:when>
                  </xsl:choose>
                  <xsl:value-of select="planet:name"/>
                </a>
              </li>
            </xsl:for-each>
            <xsl:text>&#10;</xsl:text>
          </ul>

          <xsl:text>&#10;&#10;</xsl:text>
          <h2>Info</h2>

          <dl>
            <dt>Last updated:</dt>
            <dd>
              <span class="date" title="GMT">
                <xsl:value-of select="atom:updated/@planet:format"/>
              </span>
            </dd>
            <dt>Powered by:</dt>
            <dd>
              <a href="http://intertwingly.net/code/venus/" title="Sam Ruby’s Venus">
                <xsl:text disable-output-escaping='yes'>&lt;img src="images/venus.png" width="80" height="15"
                  alt="Venus"&gt;</xsl:text>
              </a>
            </dd>
            <dt>Export:</dt>
            <dd>
                  <a href="opml.xml" title="export the {planet:name} subscription list in OPML format">
                    <xsl:text disable-output-escaping='yes'>&lt;img src="images/opml.png" alt="OPML"&gt;</xsl:text>
                  </a>
            </dd>
            <dd>
                  <a href="foafroll.xml" title="export the {planet:name} subscription list in FOAF format">
                    <xsl:text disable-output-escaping='yes'>&lt;img src="images/foaf.png" alt="FOAF"&gt;</xsl:text>
                  </a>
            </dd>
          </dl>

        </div>

        <xsl:text>&#10;&#10;</xsl:text>
        <div id="body">
          <xsl:apply-templates select="atom:entry"/>
          <xsl:text>&#10;&#10;</xsl:text>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="atom:entry">
    <!-- date header -->
    <xsl:variable name="date" select="substring(atom:updated,1,10)"/>
    <xsl:if test="not(preceding-sibling::atom:entry
      [substring(atom:updated,1,10) = $date])">
      <xsl:text>&#10;&#10;</xsl:text>
      <h2 class="date"><xsl:value-of select="$date"/></h2>
    </xsl:if>

    <xsl:text>&#10;&#10;</xsl:text>
    <div class="news">

      <xsl:if test="@xml:lang">
        <xsl:attribute name="xml:lang">
          <xsl:value-of select="@xml:lang"/>
        </xsl:attribute>
      </xsl:if>

      <!-- entry title -->
      <xsl:text>&#10;</xsl:text>
      <h3>
        <a href="{atom:source/atom:link[@rel='alternate']/@href}">
          <xsl:attribute name="title" select="{atom:source/atom:title}"/>
          <xsl:value-of select="atom:source/planet:name"/>
        </a>
        <xsl:if test="atom:title">
	  <xsl:text>&#x20;</xsl:text>
          <xsl:choose>
	    <xsl:when test="atom:source/atom:icon">
              <img src="{atom:source/atom:icon}" class="icon" alt="" />
	    </xsl:when>
	    <xsl:otherwise>
              <xsl:text>&#x2014;</xsl:text>
	    </xsl:otherwise>
          </xsl:choose>
	  <xsl:text>&#x20;</xsl:text>
          <a href="{atom:link[@rel='alternate']/@href}">
            <xsl:if test="atom:title/@xml:lang != @xml:lang">
              <xsl:attribute name="xml:lang" select="{atom:title/@xml:lang}"/>
            </xsl:if>
            <xsl:value-of select="atom:title"/>
          </a>
        </xsl:if>
      </h3>

      <!-- entry content -->
      <xsl:text>&#10;</xsl:text>
      <div class="content">
      <xsl:choose>
        <xsl:when test="planet:excerpt">
          <xsl:apply-templates select="planet:excerpt"/>
        </xsl:when>
        <xsl:when test="atom:content">
          <xsl:apply-templates select="atom:content"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="atom:summary"/>
        </xsl:otherwise>
      </xsl:choose>

      <!-- entry footer -->
      <xsl:text>&#10;</xsl:text>
      <div class="permalink">
        <xsl:if test="atom:link[@rel='license'] or
                      atom:source/atom:link[@rel='license'] or
                      atom:rights or atom:source/atom:rights">
          <a>
            <xsl:if test="atom:source/atom:link[@rel='license']/@href">
              <xsl:attribute name="rel">license</xsl:attribute>
              <xsl:attribute name="href">
                <xsl:value-of select="atom:source/atom:link[@rel='license']/@href"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="atom:link[@rel='license']/@href">
              <xsl:attribute name="rel">license</xsl:attribute>
              <xsl:attribute name="href">
                <xsl:value-of select="atom:link[@rel='license']/@href"/>
              </xsl:attribute>
           </xsl:if>
            <xsl:if test="atom:source/atom:rights">
              <xsl:attribute name="title">
                <xsl:value-of select="atom:source/atom:rights"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="atom:rights">
              <xsl:attribute name="title">
                <xsl:value-of select="atom:rights"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:text>&#169;</xsl:text>
          </a>
          <xsl:text> </xsl:text>
        </xsl:if>
        <a href="{atom:link[@rel='alternate']/@href}" class="permalink">
          <xsl:choose>
            <xsl:when test="atom:author/atom:name">
              <xsl:if test="not(atom:link[@rel='license'] or
                                atom:source/atom:link[@rel='license'] or
                                atom:rights or atom:source/atom:rights)">
                <xsl:text>by </xsl:text>
              </xsl:if>
              <xsl:value-of select="atom:author/atom:name"/>
              <xsl:text> at </xsl:text>
            </xsl:when>
            <xsl:when test="atom:source/atom:author/atom:name">
              <xsl:if test="not(atom:link[@rel='license'] or
                                atom:source/atom:link[@rel='license'] or
                                atom:rights or atom:source/atom:rights)">
                <xsl:text>by </xsl:text>
              </xsl:if>
              <xsl:value-of select="atom:source/atom:author/atom:name"/>
              <xsl:text> at </xsl:text>
            </xsl:when>
          </xsl:choose>
          <span class="date" title="GMT">
            <xsl:value-of select="atom:updated/@planet:format"/>
          </span>
        </a>
        <xsl:if test="atom:link[@rel='replies'][@type='text/html']">
					<xsl:text disable-output-escaping='yes'>&lt;br&gt;</xsl:text>
					<xsl:choose>
						<xsl:when test="atom:link[@rel='replies'][@type='text/html']/@title">
							<a href="{atom:link[@rel='replies'][@type='text/html']/@href}" class="replies">
								<xsl:value-of select="atom:link[@rel='replies'][@type='text/html']/@title"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>Comments</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
        </xsl:if>
      </div>
      </div>
    </div>

  </xsl:template>

  <!-- xhtml content -->
  <xsl:template match="atom:content/xhtml:div | atom:summary/xhtml:div">
    <xsl:copy>
      <xsl:if test="../@xml:lang and not(../@xml:lang = ../../@xml:lang)">
        <xsl:attribute name="xml:lang">
          <xsl:value-of select="../@xml:lang"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="@*|node()"/>
   </xsl:copy>
  </xsl:template>

  <!-- plain text content -->
  <xsl:template match="atom:content/text() | atom:summary/text()">
    <div>
      <xsl:if test="../@xml:lang and not(../@xml:lang = ../../@xml:lang)">
        <xsl:attribute name="xml:lang">
          <xsl:value-of select="../@xml:lang"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:copy-of select="."/>
    </div>
  </xsl:template>

  <!-- Feedburner detritus -->
  <xsl:template match="xhtml:div[@class='feedflare']"/>

  <!-- Remove stray atom elements -->
  <xsl:template match="atom:*">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- pass through everything else -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
