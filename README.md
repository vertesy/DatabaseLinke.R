[![DOI](https://zenodo.org/badge/251416302.svg)](https://zenodo.org/badge/latestdoi/251416302)

# DatabaseLinke.R – Parse links to databases from your list of  gene symbols

A set of functions to parse and open (search query) links to genomics related and other websites for R. Useful when you want to explore e.g.: the function of a set of differentially expressed genes.

[Get the DatabaseLinke.R](https://github.com/vertesy/DatabaseLinke.R/blob/master/DatabaseLinke.R)

[TOC]

## Summary

A set of functions to parse links to genomics related websites.

It can do 3 things:

1. Parse (and store) the links for a vector of gene symbols
2. Parse the links, and **open** them **in the default browser** (beware for 20+ genes)
3. Parse the link, and **write** `open` commands **into an** (executable) **bash script**, which you can later open in batches.

*Note: It typically parses query (search) links, instead direct links*

## List of Databases

- **[Ensemble](https://www.ensembl.org/index.html)**
- **[Uniprot](https://www.uniprot.org/)**
- **[STRING: a protein interaction database](https://string-db.org/cgi/input.pl?input_page_active_form=multiple_identifiers)**
- **[Pubmed](https://www.ncbi.nlm.nih.gov/pubmed/)**
- **[Wikipedia](https://en.wikipedia.org/wiki/Main_Page)**

### Species specific

- **[Wormbase](http://www.wormbase.org/)**
- **[HGNC (Human Gene Nomenclature)](http://www.genenames.org/)**

## Install

1. Install package

Install directly from **GitHub** via **devtools** with one R command:

```r
# install.packages("devtools"); # If you don't have it.
require("devtools")
devtools::install_github(repo = "vertesy/DatabaseLinke.R ")
```



## Usage

#### 1) Simply load the package:

```r
require("DatabaseLinke.R ")
```

Then call user setup script (every time before using)

   ```r
source("https://raw.githubusercontent.com/vertesy/DatabaseLinke.R/master/R/DatabaseLinke.Setup.Global.Variables.R")
   ```



#### 2) Alternative

Directly source it from the web in `R`:

   ```r
   source("https://raw.githubusercontent.com/vertesy/DatabaseLinke.R/master/R/DatabaseLinke.R")
   source("https://raw.githubusercontent.com/vertesy/DatabaseLinke.R/master/R/DatabaseLinke.Setup.Global.Variables.R")
   ```

You can also download and source.

### Test it!

```r
# Dummy
geneSymbols = c('Sox2', 'Actb'); 

# Test Helper
openURLs.1by1("http://www.google.com/search?as_q= Sox2 ")

# Test
link_GeneCards(geneSymbols); link_GeneCards(geneSymbols, Open = TRUE)
link_ensembl_zebra(geneSymbols); link_ensembl_zebra(geneSymbols, Open = TRUE)
link_ensembl_mice(geneSymbols); link_ensembl_mice(geneSymbols, Open = TRUE)
link_ensembl_mice(geneSymbols); link_ensembl_mice(geneSymbols, Open = TRUE)
link_ensembl(geneSymbols); link_ensembl(geneSymbols, Open = TRUE)
link_ensembl.grc37(geneSymbols); link_ensembl.grc37(geneSymbols, Open = TRUE)
link_uniprot_mice(geneSymbols); link_uniprot_mice(geneSymbols, Open = TRUE)
link_uniprot_human(geneSymbols); link_uniprot_human(geneSymbols, Open = TRUE)
link_uniprot_zebrafish(geneSymbols); link_uniprot_zebrafish(geneSymbols, Open = TRUE)
link_String(geneSymbols); link_String(geneSymbols, Open = TRUE)
qString(geneSymbols); qString(geneSymbols, Open = TRUE)
link_pubmed(geneSymbols); link_pubmed(geneSymbols, Open = TRUE)
link_wikipedia(geneSymbols); link_wikipedia(geneSymbols, Open = TRUE)
link_google(geneSymbols); link_google(geneSymbols, Open = TRUE)
link_HGNC(geneSymbols); link_HGNC(geneSymbols, Open = TRUE)
qHGNC(geneSymbols); qHGNC(geneSymbols, Open = TRUE)
link_wormbase(geneSymbols); link_wormbase(geneSymbols, Open = TRUE)
link_MGI.JAX(geneSymbols); link_MGI.JAX(geneSymbols, Open = TRUE)

```

### Use details

*Default species is typically mice*

You can use the functions in 3 ways:

1. Open the link in your web browser:

   ```r
   link_String("Mecom")
   ```

2. Writes the link in a bash script, called run.sh:   

   ```r
   link_String("Mecom", writeOut = T)
   ```

    - use, if  you have too many links to open at once
    - When you run the script, it opens all the links as tabs in your default browser (on OS X /  *nix).
    - **Comment out some lines if its too much**
    - More precisely, it will write the links to `BashScriptLocation` in an executable format.

#### Writing to file

Using `link_String("Mecom", writeOut = T)`, in your bash script, you will find:

```bash
open 'http://string-db.org/newstring_cgi/show_network_section.pl?identifier=Mecom&species=10090'
```


#### Print links to the screen

```r
link_String("Mecom", writeOut = F, Open=F)
```

Writes the link to the screen. You get:

```bash
http://string-db.org/newstring_cgi/show_network_section.pl?identifier=Mecom&species=10090
```

as a character vector, so you can write out in a column of your gene-table.



## Components

1. R script containing functions each of which operates on vectors of gene symbols.
2. An executable bash script that you need to make. You can make it anywhere, but you need to specify it in the R-script's `BashScriptLocation` variable.

## List of Functions in DatabaseLinke.R (21) 

Updated: 2023/11/27 20:46

- #### 1 `openURLs.1by1()`

  Open URLs One by One. This function opens provided links sequentially with an optional delay between each.  This can be useful for slower computers and to avoid triggering anti-robot measures in search engines.

- #### 2 `link_GeneCards()`

  GeneCards Link Generator. Generates GeneCards URLs for a given list of gene symbols.

- #### 3 `link_ensembl_zebra()`

  Zebrafish Ensembl Link Generator. Generates the latest Ensembl (GRC38) URLs for a given list of zebrafish gene symbols.

- #### 4 `link_ensembl_mice()`

  Mouse Ensembl Link Generator. Generates the latest Ensembl (GRC38) URLs for a given list of mouse gene symbols.

- #### 5 `link_ensembl_zebra()`

  Generate Zebrafish Ensembl Links. This function generates the latest Zebrafish Ensembl (GRC38) links for a list of gene symbols.

- #### 6 `link_ensembl()`

  Generate Ensembl Links. This function generates the latest Ensembl (GRC38) links for a list of gene symbols.

- #### 7 `link_ensembl.grc37()`

  Parse Ensembl GRC37 links. This function generates Ensembl GRC37 links for a list of gene symbols.

- #### 8 `link_uniprot_mice()`

  Parse UNIPROT Links for Mice Genes. This function generates UNIPROT links for a list of mouse gene symbols.

- #### 9 `link_uniprot_human()`

  Parse UNIPROT Links for Human Genes. This function generates UNIPROT links for a list of human gene symbols.

- #### 10 `link_uniprot_zebrafish()`

  Parse UNIPROT Links for Zebrafish Genes. This function generates UNIPROT links for a list of zebrafish gene symbols.

- #### 11 `link_String()`

  Parse STRING Database Links. This function generates links to the STRING protein interaction database for a list of gene symbols.

- #### 12 `qString()`

  qString. Generates links to the STRING protein interaction database based on a given list of gene symbols. The function supports different organisms such as mice, humans, or "NA" for no specific organism.

- #### 13 `link_pubmed()`

  link_pubmed. Generates links to the PUBMED database based on a given list of gene symbols and additional search terms.

- #### 14 `link_wikipedia()`

  link_wikipedia. Generates Wikipedia search query links based on a given list of gene symbols.

- #### 15 `link_google()`

  link_google. Parses Google search query links for a provided list of gene symbols. The "prefix" and "suffix" will be searched for together with each gene (e.g., "Human ID4 neurons").  Uses google="`http://www.google.com/search?as_q=`".

- #### 16 `link_bing()`

  link_bing. Parses Bing search query links for a provided list of gene symbols.

- #### 17 `# qHGNC()`

  HGNC link generator and web lookup. Parses HGNC links for a provided list of gene symbols.

- #### 18 `link_wormbase()`

  link_wormbase. Generate Wormbase database links for a list of gene symbols.

- #### 19 `link_MGI.JAX()`

  link_MGI.JAX. Generate MGI JAX mouse genomics search query links for a list of gene symbols.

- #### 20 `link_SNPedia_clip2clip()`

  link_SNPedia_clip2clip. Generate SNPedia links from a list of rsIDs copied from an Excel column.

- #### 21 `link_Franklin_clip2clip()`

  link_Franklin_clip2clip. Generate Franklin (Genoox) links from a list of coordinates.



## Appendix

### [Google search URL / search query](http://www.our-picks.com/archives/2007/01/30/google-search-urls-revealed-or-how-to-create-your-own-search-url/)

| String        | Meaning                                                      |
| ------------- | ------------------------------------------------------------ |
| as_oq         | This tells Google to find pages in which at least instance of nintendo **OR**  wii is found |
| as_q          | This means that you look for **both** nintendo and wii in the same page |
| as_epq        | Google translates this as a Google search of “nintendo wii”, searches the  exact phrase ‘nintendo wii’ |
| num           | The number of results you want displayed, it ranges from 0 to 100. If you  set num to 0 you will get the ‘No match found” message |
| safe          | If you set this to active the Google Safe Search is on and the adult  material will be filtered |
| as_eq         | Use this to exclude a term from your search                  |
| as_qdr        | Shows only results that have been updated in the given time interval.  Possible values: y (year), m6 (6 months), m3 (3 months). |
| as_sitesearch | Limits the search to a specific domain or TLD (.us; .gov; .co.uk; .ro;  etc) |
| as_occt       | This is set by default to ‘any’ but if you change it you can search in:  title, url, links |



---------

## Troubleshooting


### If you encounter a bug, or something doesn't work,

1. please let me know by raising an issue on [DatabaseLinke.R](https://github.com/vertesy/DatabaseLinke.R/issues)
2. Fix by providing the missing function.
   - Try to `source("https://raw.githubusercontent.com/vertesy/CodeAndRoll/master/CodeAndRoll.R")`
     [See details for CodeAndRoll](https://github.com/vertesy/DatabaseLinke.R/blob/master/R/CodeAndRoll.md)
   - If still some functons are missing, try to install MarkdownReports:
     `install.packages("devtools")`
     `devtools::install_github(repo = "vertesy/MarkdownReports")`
     `require("MarkdownReports")`
     [See details for MarkdownReports](https://vertesy.github.io/MarkdownReports/)





---

Vertesy, 2021.  ***Cite via:*** [![DOI](https://zenodo.org/badge/251416302.svg)](https://zenodo.org/badge/latestdoi/251416302)

<br>



