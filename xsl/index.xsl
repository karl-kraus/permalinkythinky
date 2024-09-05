<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">

        <html lang="en">
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <title>Bootstrap demo</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                    rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous"/>
            </head>
            <body>

                <main>
                    <div class="container">
                        <h1 class="text-center pt-5">
                            <xsl:value-of select=".//tei:titleStmt/tei:title/text()"/>
                        </h1>
                        <p class="lead text-center">annotiert durch <xsl:value-of
                                select=".//tei:titleStmt/tei:author/text()"/></p>
                    
                        <div class="main-text">
                            <xsl:apply-templates select=".//tei:body"></xsl:apply-templates>
                        </div>
                    </div>
                    <!-- Bootstrap Modal -->
                    <div class="modal fade" id="selectionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Selected Range URL</h5>
                                    
                                </div>
                                <div class="modal-body">
                                    <!-- The URL will be inserted here -->
                                    <p id="modalText"></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                                        
                </main>


                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"/>
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="main.js"></script>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="tei:lb">
        <br />
    </xsl:template>
    
    <xsl:template match="tei:fw">
        <span class="forme-work ps-5">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:anchor[@xml:id]">
        <span class="permalinky">
            <xsl:attribute name="id">
                <xsl:value-of select="data(./@xml:id)"/>
            </xsl:attribute>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:p[@xml:id]">
        <p>
            <xsl:attribute name="id">
                <xsl:value-of select="data(./@xml:id)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    

</xsl:stylesheet>
