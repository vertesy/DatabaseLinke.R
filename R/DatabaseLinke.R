######################################################################
# Parse links to databases from your list of gene symbols
######################################################################
# source('~/GitHub/Packages/DatabaseLinke.R/DatabaseLinke.R')
# source('https://raw.githubusercontent.com/vertesy/DatabaseLinke.R/master/DatabaseLinke.R')

######################################################################
## Full functionality is only expected on OS X
## See details: https://github.com/vertesy/TheCorvinas/blob/master/R/DatabaseLinkeR.md
## - Set writeOut=FALSE, in each function for first usage.
##
## If you encounter a bug, or something doesn't work,
## 1.) please let me know by raising an issue on Github/vertesy/TheCorvinas
## https://github.com/vertesy/TheCorvinas/issues/new?milestone=DatabaseLinke.R
## 2.) It might be a missing function.
## - Try to source("https://raw.githubusercontent.com/vertesy/CodeAndRoll/master/CodeAndRoll.R")
## See details: https://github.com/vertesy/TheCorvinas/blob/master/R/CodeAndRoll.md
## - If still some functons are missing, try to install MarkdownReports: install.packages("devtools"); devtools::install_github(repo = "vertesy/MarkdownReports/MarkdownReports"); require("MarkdownReports")
## See details: https://vertesy.github.io/MarkdownReports/
##
######################################################################

utils::globalVariables(c(
  'BashScriptLocation', 'GeneCards', 'PUBMED_search_prefix', 'wikipedia', 'ensembl_multispecies'
  , 'grc37', 'grc38', 'grc_mm38', 'grc_Zebra', 'uniprot_mouse', 'uniprot_human', 'uniprot_zebra'
  , 'STRING', 'STRING_mouse_suffix', 'STRING_human_suffix', 'STRING_elegans_suffix', 'HGNC_symbol_search'
  , 'wormbase_search_prefix', 'worm_CGC_prefix'
  , "google", "MGI_search_prefix", "MGI_search_suffix", 'b.dbl.writeOut', 'b.dbl.Open'
))


# openURLs.1by1(links) ------------------------------------------------------------------------------------------------
#' @title openURLs.1by1
#' @description Open links with ~1 second delay. Necessary for slower computers and not to trigger the "robot" blocker of search engines (where you will pass your commands).
#' @param links PARAM_DESCRIPTION
#' @param wait PARAM_DESCRIPTION, Default: 1
#' @examples geneSymbols = c('Sox2', 'Actb'); openURLs.1by1(geneSymbols)
#' @export
openURLs.1by1 <- function(links, wait=1) { # Open links with ~1 second delay. Necessary for slower computers and not to trigger the "robot" blocker of search engines (where you will pass your commands).
  for (link in links) {
    if (wait) Sys.sleep(runif(1)+.5)
    browseURL(link)
  }
}


# GeneCards links ------------------------------------------------------------------------------------------------
#' @title link_GeneCards
#' @description Parse GeneCards links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_GeneCards(geneSymbols); link_GeneCards(geneSymbols, Open = TRUE)
#' @export
link_GeneCards <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse GeneCards links to your list of gene symbols.
  links = paste0(GeneCards, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

# ENSEMBL Links --------------------------------------------------------------------------------------------------------------------------------

#' @title link_ensembl_zebra
#' @description Parse the latest ensembl (GRC38) links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_ensembl_zebra(geneSymbols); link_ensembl_zebra(geneSymbols, Open = TRUE)
#' @export
link_ensembl_zebra <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse the latest ensembl (GRC38) links to your list of gene symbols.
  links = paste0(grc_Zebra[1], vector_of_gene_symbols, grc_Zebra[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

#' @title link_ensembl_mice
#' @description Parse the latest ensembl (GRC38) links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_ensembl_mice(geneSymbols); link_ensembl_mice(geneSymbols, Open = TRUE)
#' @export
link_ensembl_mice <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse the latest ensembl (GRC38) links to your list of gene symbols.
  links = paste0(grc_mm38[1], vector_of_gene_symbols, grc_mm38[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

#' @title link_ensembl_mice
#' @description Parse the latest ensembl (GRC38) links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_ensembl_mice(geneSymbols); link_ensembl_mice(geneSymbols, Open = TRUE)
#' @export
link_ensembl_mice <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse the latest ensembl (GRC38) links to your list of gene symbols.
  links = paste0(grc_mm38[1], vector_of_gene_symbols, grc_mm38[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

#' @title link_ensembl
#' @description Parse the latest ensembl (GRC38) links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_ensembl(geneSymbols); link_ensembl(geneSymbols, Open = TRUE)
#' @export
link_ensembl <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse the latest ensembl (GRC38) links to your list of gene symbols.
  links = paste0(ensembl_multispecies[1], vector_of_gene_symbols, ensembl_multispecies[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation )
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

#' @title link_ensembl.grc37
#' @description Parse ensembl GRC37 links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_ensembl.grc37(geneSymbols); link_ensembl.grc37(geneSymbols, Open = TRUE)
#' @export
link_ensembl.grc37 <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse ensembl GRC37 links to your list of gene symbols.
  links = paste0(grc37[1], vector_of_gene_symbols, grc37[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

## UNIPROT Links --------------------------------------------------------------------------------------------------------------------------------

#' @title link_uniprot_mice
#' @description Parse the latest UNIPROT links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: F
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_uniprot_mice(geneSymbols); link_uniprot_mice(geneSymbols, Open = TRUE)
#' @export
link_uniprot_mice <- function(vector_of_gene_symbols, writeOut = F, Open = b.dbl.Open) { # Parse the latest UNIPROT links to your list of gene symbols.
  links = paste0(uniprot_mouse[1], vector_of_gene_symbols, uniprot_mouse[2] )
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}
lll='http://www.uniprot.org/uniprot/?query=Eef1d+Mouse+reviewed%3Ayes+&sort=score'


#' @title link_uniprot_human
#' @description Parse the latest UNIPROT links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: F
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_uniprot_human(geneSymbols); link_uniprot_human(geneSymbols, Open = TRUE)
#' @export
link_uniprot_human <- function(vector_of_gene_symbols, writeOut = F, Open = b.dbl.Open) { # Parse the latest UNIPROT links to your list of gene symbols.
  links = paste0( uniprot_human[1], vector_of_gene_symbols, uniprot_human[2] )
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

#' @title link_uniprot_zebrafish
#' @description Parse the latest UNIPROT links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: F
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_uniprot_zebrafish(geneSymbols); link_uniprot_zebrafish(geneSymbols, Open = TRUE)
#' @export
link_uniprot_zebrafish <- function(vector_of_gene_symbols, writeOut = F, Open = b.dbl.Open) { # Parse the latest UNIPROT links to your list of gene symbols.
  links = paste0( uniprot_zebra[1], vector_of_gene_symbols, uniprot_zebra[2] )
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}


# SRING links ------------------------------------------------------------------------
#' @title link_String
#' @description Parse STRING protein interaction database links to your list of gene symbols. "organism" can be mouse, human or NA.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param organism PARAM_DESCRIPTION, Default: 'human'
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_String(geneSymbols); link_String(geneSymbols, Open = TRUE)
#' @export
link_String <- function(vector_of_gene_symbols # Parse STRING protein interaction database links to your list of gene symbols. "organism" can be mouse, human or NA.
                        , organism="human", writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  suffix = if (is.na(organism)) { "" }
  else if (organism == "elegans") { STRING_elegans_suffix }
  else if (organism == "mouse") { STRING_mouse_suffix }
  else if (organism == "human") { STRING_human_suffix }
  links = paste0( STRING, vector_of_gene_symbols, suffix )
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}


# SRING links ------------------------------------------------------------------------
#' @title qString
#' @description Parse STRING protein interaction database links to your list of gene symbols. "organism" can be mouse, human or NA.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param organism PARAM_DESCRIPTION, Default: 'human'
#' @param writeOut PARAM_DESCRIPTION, Default: F
#' @param Open PARAM_DESCRIPTION, Default: TRUE
#' @examples geneSymbols = c('Sox2', 'Actb'); qString(geneSymbols); qString(geneSymbols, Open = TRUE)
#' @export
qString <- function(vector_of_gene_symbols # Parse STRING protein interaction database links to your list of gene symbols. "organism" can be mouse, human or NA.
                    , organism="human", writeOut =F, Open = TRUE) {
  suffix = if (is.na(organism)) { "" }
  else if (organism == "elegans") { STRING_elegans_suffix }
  else if (organism == "mouse") { STRING_mouse_suffix }
  else if (organism == "human") { STRING_human_suffix }
  links = paste0( STRING, vector_of_gene_symbols, suffix )
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}



# PUBMED links ------------------------------------------------------------------------

#' @title link_pubmed
#' @description Parse PUBMED database links to your list of gene symbols. "additional_terms" can be any vector of strings that will be searched for together with each gene.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param additional_terms PARAM_DESCRIPTION, Default: ''
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_pubmed(geneSymbols); link_pubmed(geneSymbols, Open = TRUE)
#' @export
link_pubmed <- function(vector_of_gene_symbols  # Parse PUBMED database links to your list of gene symbols. "additional_terms" can be any vector of strings that will be searched for together with each gene.
                        , additional_terms = "", writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links = paste0( PUBMED_search_prefix, vector_of_gene_symbols, " ", paste(additional_terms, collapse = " ") )
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}


# Wikipedia links ------------------------------------------------------------------------

#' @title link_wikipedia
#' @description Parse wikipedia search query links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_wikipedia(geneSymbols); link_wikipedia(geneSymbols, Open = TRUE)
#' @export
link_wikipedia <- function(vector_of_gene_symbols  # Parse wikipedia search query links to your list of gene symbols.
                           , writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links = paste0( wikipedia, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

# Google search URL / search query links ------------------------------------------------------------------------
# google="http://www.google.com/search?as_q="

#' @title link_google
#' @description Parse google search query links to your list of gene symbols. Strings "prefix" and ""suffix" will be searched for together with each gene ("Human ID4 neurons"). See updated google and bing services in [CodeAndRoll.R](https://vertesy.github.io/CodeAndRoll.R).
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param prefix PARAM_DESCRIPTION, Default: ''
#' @param suffix PARAM_DESCRIPTION, Default: ''
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @param sleep PARAM_DESCRIPTION, Default: 1
#' @examples geneSymbols = c('Sox2', 'Actb'); link_google(geneSymbols); link_google(geneSymbols, Open = TRUE)
#' @export
link_google <- function(vector_of_gene_symbols # Parse google search query links to your list of gene symbols. Strings "prefix" and ""suffix" will be searched for together with each gene ("Human ID4 neurons"). See updated google and bing services in [CodeAndRoll.R](https://vertesy.github.io/CodeAndRoll.R).
                        , prefix ="", suffix ="", writeOut = b.dbl.writeOut, Open = b.dbl.Open, sleep=1) {
  links = paste0( google, prefix," ", vector_of_gene_symbols," ", suffix)
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    if (sleep>0) {  bash_commands = paste0(bash_commands, ' ; sleep ', sleep)  } # if wait
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}


# HGNC links ------------------------------------------------------------------------------------------------
#' @title link_HGNC
#' @description Parse HGNC links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_HGNC(geneSymbols); link_HGNC(geneSymbols, Open = TRUE)
#' @export
link_HGNC <- function(vector_of_gene_symbols # Parse HGNC links to your list of gene symbols.
                      , writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links = paste0(HGNC_symbol_search, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

# Quick lookup versioin
#' @title qHGNC
#' @description Parse HGNC links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: FALSE
#' @param Open PARAM_DESCRIPTION, Default: TRUE
#' @examples geneSymbols = c('Sox2', 'Actb'); qHGNC(geneSymbols); qHGNC(geneSymbols, Open = TRUE)
#' @export
qHGNC <- function(vector_of_gene_symbols # Parse HGNC links to your list of gene symbols.
                  , writeOut = FALSE, Open = TRUE) {
  links = paste0(HGNC_symbol_search, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}

# wormbase links ------------------------------------------------------------------------

#' @title link_wormbase
#' @description Parse wormbase database links to your list of gene symbols..
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_wormbase(geneSymbols); link_wormbase(geneSymbols, Open = TRUE)
#' @export
link_wormbase <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse wormbase database links to your list of gene symbols..
  links = paste0( wormbase_search_prefix, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}



# MGI JAX mouse genomics links ------------------------------------------------------------------------

#' @title link_MGI.JAX
#' @description Parse MGI JAX mouse genomics links search query links to your list of gene symbols.
#' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' @examples geneSymbols = c('Sox2', 'Actb'); link_MGI.JAX(geneSymbols); link_MGI.JAX(geneSymbols, Open = TRUE)
#' @export
link_MGI.JAX <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse MGI JAX mouse genomics links search query links to your list of gene symbols.
  links = paste0( MGI_search_prefix, vector_of_gene_symbols, MGI_search_suffix)
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links) }
}


#  ------------------------------------------------------------------------
#  ------------------------------------------------------------------------
#  ------------------------------------------------------------------------
#  ------------------------------------------------------------------------
#  ------------------------------------------------------------------------

# old
# uniprot_mouse =c('http://www.uniprot.org/uniprot/?query=organism%3A"Mus+musculus+[10090]"+',"&sort=score")
# uniprot_human =c('http://www.uniprot.org/uniprot/?query=organism%3A"Homo+sapiens+%28Human%29+[9606]"+',"&sort=score")
# uniprot_zebra =c('http://www.uniprot.org/uniprot/?query=organism%3A"Danio+rerio+(Zebrafish)+(Brachydanio+rerio)+[7955]"+',"&sort=score")

