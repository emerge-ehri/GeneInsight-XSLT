<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<xsl:variable name="report" select="org.pcpgm.gis.fedmsg.v4.Envelope/objMessage/report"/>
<xsl:variable name="patient" select="$report/patient"/>



<xsl:variable name="sampleString">XML,XSLT,XPath,SVG,XPointer</xsl:variable>
<!-- <xsl:variable name="tokenizedSample" select="tokenize($sampleString,',')"/> -->

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="../../favicon.ico" />

    <title>Baylor Genetics Report</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
<!--     <link href="../css/dashboard.css" rel="stylesheet" /> -->
<style>
  
<!-- body {font-family:Arial, Helvetica, sans-serif} -->
<!-- em {font-size:12px} -->

<!-- td {vertical-align: top; padding:2px} -->
.label {font-weight: bold!important}
h1 {font-weight:normal}
h2 {font-size:1.6rem; font-weight:normal; padding-bottom:0.3rem; border-bottom:1px solid lightblue; margin-top:2.5rem}
ul {padding-left:1.5rem}
a.help_link {font-size:70%}
<!-- .form .row {margin-bottom:0.5rem} -->
.table {font-size:80%}
.gene_card {border: 1px solid lightblue; border-radius:0.5rem; padding:1rem; margin-bottom:2rem}
.citation {font-size:70%; font-style:italic; margin-top:3rem}
.citation img.emerge_logo {width:200px}

<!-- table.patient td:first-child {width: 10em;font-weight:bold} -->

table.report td:first-child{font-weight:bold; width: 10em; vertical-align:top}
table.report td:nth-child(3){border-left: 100px solid #fff; font-weight:bold}

table.variants {font-size:90%; margin:2rem 0 2rem 0; width:100%}
table.variants th {text-align:left; background-color:#e8f5ff; padding:0.5rem}
table.variants td {padding:0.5rem; }

table.refvar {font-size:90%; }
table.refvar td:first-child {width:13rem; text-align:left; font-weight:bold; padding-bottom:0.5rem; }
table.refvar td {padding:2px; vertical-align:top }

table.coverage th {text-align:left; background-color:#fff; padding:5px}
table.coverage td {padding:5px}
table.coverage th:first-child {width:13rem}

</style>

</head>

<body>
<div class="container">
  <h1>Genetic Interpretation Report</h1>

  <p class="lead">Baylor College of Medicine<br />Human Genome Sequencing Center Clinical Laboratory</p>
  <!-- <p class="lead"><xsl:value-of select="org.pcpgm.gis.fedmsg.v4.Envelope/origin/org.pcpgm.gis.fedmsg.v4.EnvelopeSender/senderId"/></p> -->

  <p style="font-size:smaller">Date: <span id="date"><xsl:value-of select="$report/editedBy/onDate" /></span><br />
    Report Identifier: <xsl:value-of select="$report/reportIdentifier"/><br />
  </p>

  <h2>Patient</h2>

  <div class="row form">
    <div class="col-md-6 ">
      <div class="row">
        <div class="col-sm-4 label">Name:</div>
        <div class="col-sm-8"><xsl:value-of select="$patient/lastName" />, <xsl:value-of select="$patient/firstName" /></div>
      </div>
      <div class="row">
        <div class="col-sm-4 label">DOB:</div>
        <div class="col-sm-8"><xsl:value-of select="$patient/dateOfBirth" /></div>
      </div>
      <div class="row" style="display: flex; align-items:end">
        <div class="col-sm-4 col-md-6 col-lg-4 label">Race or Ethnicity:</div>
        <div class="col-sm-8 col-md-6 col-lg-8"><xsl:value-of select="$patient/raceOrEthnicity/org.pcpgm.gis.fedmsg.v4.Code/codeText" /> </div>
      </div>
      <div class="row">
        <div class="col-sm-4 label">Sex:</div>
        <div class="col-sm-8"><xsl:value-of select="$patient/sex/codeText" /> </div>
      </div>
      <div class="row">
        <div class="col-sm-4 label">Physician Name:</div>
        <div class="col-sm-8"><xsl:value-of select="$report/physicians/org.pcpgm.gis.fedmsg.v4.Physician/lastName" />,
          <xsl:value-of select="$report/physicians/org.pcpgm.gis.fedmsg.v4.Physician/firstName" /></div>
      </div>
      <div class="row">
        <div class="col-sm-4 label">Indication:</div>
        <div class="col-sm-8"><xsl:value-of select="$report/indicationText" /></div>
      </div>
      <div class="row">
        <div class="col-sm-4 label">Patient Diseases:</div>
        <div class="col-sm-8">
          <xsl:for-each select="$report/patientDiseases/org.pcpgm.gis.fedmsg.v4.ReportDisease" >
            <xsl:value-of select="name" /><br/>
          </xsl:for-each>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row">
        <div class="col-sm-4 label">Test Type: </div>
        <div class="col-sm-8"><xsl:value-of select="$report/testType/codeText" /></div>
      </div>
      <div class="row">
        <div class="col-sm-4 label">Case Type: </div>
        <div class="col-sm-8"><xsl:value-of select="$report/caseType" /></div>
      </div>
      <div class="row">
        <div class="col-sm-4 label">Genomic Source:  </div>
        <div class="col-sm-8"><xsl:value-of select="$report/genomicSource" /></div>
      </div>
      <div class="row">
        <div class="col-sm-4 label">Assay Name:</div>
        <div class="col-sm-8"><xsl:value-of select="//org.pcpgm.gis.fedmsg.v4.ReferenceAssayVersion/testName" /></div>
      </div>
        <div class="row">
        <div class="col-sm-4 label">Lab Status:</div>
        <div class="col-sm-8"><xsl:value-of select="$report/labStatus" /></div>
      </div>
      <div class="row">
        <div class="col-sm-4 label">Status:</div>
        <div class="col-sm-8"><xsl:value-of select="$report/status" /> </div>
      </div>
    </div>
  </div>

  <h2>Interpreted Diseases</h2>
  <div class="row" >
    <div class="col-sm-7" >
      <xsl:choose>
        <xsl:when test="$report/interpretedDiseases/org.pcpgm.gis.fedmsg.v4.ReportDisease">
          <ul>
            <xsl:for-each select="$report/interpretedDiseases/org.pcpgm.gis.fedmsg.v4.ReportDisease" >
              <xsl:variable name="omim" select="substring-before(substring-after(substring-after(name, '['), ' '), ']')" />
      
              <li>
                <xsl:value-of select="name" /> 
                <a class="help_link">
                  <xsl:attribute name="href">https://www.omim.org/entry/<xsl:value-of select="$omim" /></xsl:attribute>
                  [OMIM]
                </a>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:when>
        <xsl:otherwise>
          <p>No interpreted diseases</p>
        </xsl:otherwise>
      </xsl:choose>
    </div>
    <div class="col-sm-5" >
      <strong>Contact a CUMC genetic counselor:</strong>
      <ul>
        <li><a href="http://www.cumc.columbia.edu/pediatrics/division/clinical-genetics">Pediatric Clinical Genetics</a></li>
        <li><a href="http://www.igm.columbia.edu/about-us/genetic-counseling">Institute of Genomic Medicine</a><br /></li>
      </ul>
    </div>
  </div>
  


  <h2>Genetic Variants</h2>
  <br />

  <xsl:for-each select="//refVariants/org.pcpgm.gis.fedmsg.v4.ReferenceVariant">

    <xsl:variable name="chr"   select="chromosome" />
    <xsl:variable name="start" select="alignments//startPosition" />
    <xsl:variable name="ref"   select="alignments//wildtypeSeq" />
    <xsl:variable name="alt"   select="alignments//variantSeq" />
    <xsl:variable name="gene"  select="geneIdentifier/codeText" />
  
    <xsl:variable name="var" select="concat($chr, '-', $start, '-', $ref, '-', $alt)" />
    <xsl:variable name="gnomad" select="concat('http://gnomad.broadinstitute.org/variant/', $var)" />
<!--     <xsl:variable name="gene_card" select="concat('http://www.genecards.org/cgi-bin/carddisp.pl?gene=', $gene)" /> -->
    <xsl:variable name="genetics_home_reference" select="concat('https://ghr.nlm.nih.gov/gene/', $gene)" />
  
    <div class="gene_card" >
      <p class="lead" style="padding:0 0 0.3rem 0;">
        Variant: <xsl:value-of select="$var" />
      </p>
      <table class="refvar">
    <!-- 
        <tr>
            <td>Variant: </td>
            <td><xsl:value-of select="externalId" /></td>
        </tr>
     -->
        <tr>
            <td>Diseases:</td>
            <td>
                <xsl:for-each select="currentInterpRevision/interpretations//diseaseCodes/org.pcpgm.gis.fedmsg.v4.Code">
                    <xsl:value-of select="codeText" /><br />
                </xsl:for-each>
            </td>
        </tr>
        <tr>
            <td>Gene:</td>
          
            <td>
              <a class="font-weight-bold">
                <xsl:attribute name="href">https://ghr.nlm.nih.gov/gene/<xsl:value-of select="$gene" /></xsl:attribute>
                <xsl:value-of select="$gene" /> 
              </a>
                 
              <a class="">
                <xsl:attribute name="href">https://clinicaltrials.gov/ct2/results?cond=<xsl:value-of select="$gene" />+gene</xsl:attribute>
                  clinicaltrials.gov
              </a>
              
<!-- 
              <a class="help_link">
                <xsl:attribute name="href"><xsl:value-of select="$gene_card" /></xsl:attribute>
                [GeneCards]
              </a>
 -->
            </td>
        </tr> 
        <tr>
            <td>Category Type:</td>
            <td><xsl:value-of select="//org.pcpgm.gis.fedmsg.v4.VariantInterp/categoryType" /></td>
        </tr>
        <tr>
            <td>Category:</td>
            <td>
              <a href="https://www.ncbi.nlm.nih.gov/clinvar/docs/clinsig/">
                <xsl:value-of select="//org.pcpgm.gis.fedmsg.v4.VariantInterp/categoryCode/codeText" />
              </a>
            </td>
        </tr>
        <tr>
            <td>Chromosome:</td> 
            <td><xsl:value-of select="chromosome" /></td>
       </tr>
       <tr>
            <td>Position:</td> 
            <td><xsl:value-of select="alignments//startPosition" /></td>
       </tr>
        <tr>
            <td>Ref / Alt Allele:</td> 
            <td><xsl:value-of select="$ref" /> / <xsl:value-of select="$alt" /></td>
       </tr>
       <tr>
            <td>Build:</td>
            <td><xsl:value-of select="alignments//genomeBuildName" /></td>
        </tr>

        <tr>
            <td>Transcript:</td>
            <td><xsl:value-of select="transcriptId" /></td>
        </tr>
        <tr>
            <td>DNA Change:</td>
            <td><xsl:value-of select="dnaChange" /></td>
        </tr>
          <tr>
            <td>Report DNA Change:</td>
            <td><xsl:value-of select="reportDnaChange" /></td>
        </tr>
        <tr>
            <td>AminoAcid:</td>
            <td><xsl:value-of select="aminoAcidChange" /></td>
        </tr>
        <tr>
            <td>Population Frequency:</td>
            <td><a><xsl:attribute name="href"><xsl:value-of select="$gnomad" /></xsl:attribute>gnomAD</a></td>
        </tr>
        <tr>
            <td>Inheritance:</td>
            <td><xsl:value-of select="//org.pcpgm.gis.fedmsg.v4.VariantInterp/inheritance" /></td>
        </tr>
        <tr>
            <td>Interpretation:</td>
            <td><xsl:value-of select="//org.pcpgm.gis.fedmsg.v4.VariantInterp/interpretationText" /></td>
        </tr>
        <tr>
            <td>Content Approval:</td>
            <td><xsl:value-of select="currentInterpRevision//contentApproval/byName" /></td>
        </tr>
        <tr>
            <td>Content Approval Date:</td>
            <td><xsl:value-of select="currentInterpRevision//contentApproval/onDate" /></td>
        </tr>
      </table>

    </div>
  </xsl:for-each>


  <table class="table variants">
    <thead>
      <tr>
          <th>Chr</th>
          <th>Position</th>
          <th>Ref</th>
          <th>Alt</th>
          <th>Gene</th>
          <th>Transcript</th>
          <th>DNA Change</th>
          <th>AA Change</th>
          <th>Signif</th>
          <th>Alleles</th>
          <th>Category</th>
          <th>SangerVal</th>
      </tr>
    </thead>
    <xsl:for-each select="$report/reportVariants/org.pcpgm.gis.fedmsg.v4.ReportVariant">
        <!-- Parse the Variant String -->
        <!-- Example: var= 117199644,7,ATCT,A -->
        <xsl:variable name="var" select="externalId"/>
      
        <!-- Example: pos= 117199644 -->
        <xsl:variable name="pos" select="substring-before($var, ',')" />

        <!-- temp= 7,ATCT,A -->
        <xsl:variable name="temp" select="substring-after($var, ',')" />
      
        <!-- temp2= ATCT,A -->
        <xsl:variable name="temp2" select="substring-after($temp, ',')" />
        <xsl:variable name="ref" select="substring-before($temp2, ',')" />
        <xsl:variable name="alt" select="substring-after($temp2, ',')" />
      
        <xsl:variable name="zygosity" select="substring(alleleState/codeText,0,4)"/>
        
        <xsl:variable name="gene" select="geneSymbol" />
<!--         <xsl:variable name="genetics_home_reference" select="concat('https://ghr.nlm.nih.gov/gene/', $gene)" /> -->

        <tr>
          <td><xsl:value-of select="chromosome" /></td>
  <!--         <td><xsl:value-of select="externalId" /></td> -->
        
          <td><xsl:value-of select="$pos" /></td>
          <td><xsl:value-of select="$ref" /></td>
          <td><xsl:value-of select="$alt" /></td>
          <td>
              <a>
                <xsl:attribute name="href">https://ghr.nlm.nih.gov/gene/<xsl:value-of select="$gene" /></xsl:attribute>
                <xsl:value-of select="$gene" />
              </a>
          </td>
          <td><xsl:value-of select="transcriptId" /></td>
          <td><xsl:value-of select="dnaChange" /></td>
          <td><xsl:value-of select="aminoAcidChange" /></td>
          <td><xsl:value-of select="significant" /></td>
          <td><xsl:value-of select="$zygosity" /></td>
          <td><xsl:value-of select="category/codeText" /></td>
          <td><xsl:value-of select="confirmedStatus/confirmedBySanger" /></td>
        </tr>
    </xsl:for-each>
  </table>


  <h2>Coverage</h2>

    <table class="table coverage" style="width:100%">
      <tr >
          <th>Gene</th>
          <th>Coverage</th>
      </tr>
      <xsl:for-each select="org.pcpgm.gis.fedmsg.v4.Envelope/objMessage/report/geneCoverage/genes/gene">
          <tr>
            <td><xsl:value-of select="name" /></td>
            <td><xsl:value-of select="coverage" /></td>
          </tr>
      </xsl:for-each>
    </table>
 
  

    <div class="citation">
      <p><img class="emerge_logo" src="../logo_emerge.png" /></p>
      <p>This research project was supported by the National Human Genome 
      Research Institute, National Institutes of Health, through Grant U01HG008680. 
      The content is solely the responsibility of the authors and does not necessarily 
      represent the official views of the NIH.</p>
    </div>

</div>
</body>
<script src="../script.js" />
</html>
</xsl:template>
</xsl:stylesheet>

<!-- template for bootstrap rows
<div class="row">
  <div class="col-md-7">
    <div class="row">
      <div class="col-sm-4 label">a</div>
      <div class="col-sm-8"></div>
    </div>
    <div class="row">
      <div class="col-sm-4 label">b </div>
      <div class="col-sm-8"></div>
    </div>
    <div class="row">
      <div class="col-sm-4 label">c  </div>
      <div class="col-sm-8"></div>
    </div>
    <div class="row">
      <div class="col-sm-4 label">d</div>
      <div class="col-sm-8"></div>
    </div>
  </div>
  <div class="col-md-5">
    <div class="row">
      <div class="col-sm-4 label">e</div>
      <div class="col-sm-8"></div>
    </div>
    <div class="row">
      <div class="col-sm-4 label">f</div>
      <div class="col-sm-8"></div>
    </div>
  </div>
</div>
 -->
