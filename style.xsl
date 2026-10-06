<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="pt-BR">
      <head>
        <title><xsl:value-of select="rss/channel/title"/> - Feed Agregador</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <style>
          :root {
            --primary: #b71c1c;
            --primary-hover: #d32f2f;
            --bg-main: #f4f6f9;
            --bg-card: #ffffff;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
            --radius: 12px;
          }

          * { box-sizing: border-box; }

          body {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background-color: var(--bg-main);
            color: var(--text-main);
            margin: 0;
            padding: 2.5rem 1rem;
            line-height: 1.7;
          }

          .container {
            max-width: 900px;
            margin: 0 auto;
          }

          .header {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            padding: 2.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
            text-align: center;
          }

          .header h1 {
            color: var(--primary);
            font-size: 2.2rem;
            margin: 0 0 0.75rem 0;
            font-weight: 800;
            letter-spacing: -0.025em;
          }

          .header p {
            color: var(--text-muted);
            margin: 0.5rem 0;
            font-size: 1.05rem;
          }

          .notice {
            display: inline-block;
            background: #fff5f5;
            color: #c53030;
            border: 1px solid #feb2b2;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 500;
            margin-top: 1rem;
          }

          .feed-grid {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
          }

          .item-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            padding: 2rem;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
          }

          .item-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.08), 0 8px 10px -6px rgba(0, 0, 0, 0.04);
            border-color: #cbd5e1;
          }

          .item-card h2 {
            margin: 0 0 1rem 0;
            font-size: 1.35rem;
            line-height: 1.4;
          }

          .item-card h2 a {
            color: var(--text-main);
            text-decoration: none;
            transition: color 0.15s ease;
          }

          .item-card h2 a:hover {
            color: var(--primary);
          }

          .meta-info {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 0.85rem;
            color: var(--text-muted);
            margin-bottom: 1.25rem;
            padding-bottom: 0.75rem;
            border-bottom: 1px solid var(--border-color);
          }

          .badge {
            background: #f1f5f9;
            color: #475569;
            padding: 0.2rem 0.6rem;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
          }

          .content-preview {
            font-size: 1rem;
            color: #334155;
          }

          .content-preview img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin: 1rem 0;
          }

          footer {
            text-align: center;
            margin-top: 3rem;
            color: var(--text-muted);
            font-size: 0.85rem;
          }

          .brand-header {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 0.5rem;
          }

          .brand-logo {
            width: 48px;
            height: 48px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid var(--primary);
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <div class="brand-header">
              <img src="docs/LibreUFOP_logo.jpeg" alt="Logo LibreUFOP" class="brand-logo"/>
              <h1><xsl:value-of select="rss/channel/title"/></h1>
            </div>
            <p><xsl:value-of select="rss/channel/description"/></p>
          </div>

          <div class="feed-grid">
            <xsl:for-each select="rss/channel/item">
              <div class="item-card">
                <div class="meta-info">
                  <xsl:if test="source">
                    <span class="badge"><xsl:value-of select="source"/></span>
                  </xsl:if>
                  <span>📅 <xsl:value-of select="pubDate"/></span>
                </div>
                <h2><a href="{link}" target="_blank" rel="noopener noreferrer"><xsl:value-of select="title"/></a></h2>
                <div class="content-preview">
                  <xsl:value-of select="description" disable-output-escaping="yes"/>
                </div>
              </div>
            </xsl:for-each>
          </div>

          <footer>
            <p>Gerado pelo Projeto LibreUFOP • ICEA/UFOP</p>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>