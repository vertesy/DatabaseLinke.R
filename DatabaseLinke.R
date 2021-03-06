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

# vector_of_gene_symbols =c("Oct4", "Dazl")
"As of 2019 Firefox Qunatum is not working with BrowseURL"
Sys.setenv("R_BROWSER" = "/usr/bin/open -a '/Applications/Safari.app'")
# Sys.setenv("R_BROWSER" = "/usr/bin/open -a '/Applications/Google Chrome.app'")
options(browser = as.vector(Sys.getenv("R_BROWSER")))

# User Setup ----------------------------------------------------------------------
BashScriptLocation = "~/bin/run.sh"

# Static part of Query links ------------------------
GeneCards = "http://www.genecards.org/Search/Keyword?queryString="
PUBMED_search_prefix = "https://www.ncbi.nlm.nih.gov/pubmed/?term="
wikipedia = "http://en.wikipedia.org/w/index.php?search="
# SEE: http://www.our-picks.com/archives/2007/01/30/google-search-urls-revealed-or-how-to-create-your-own-search-url/

ensembl_multispecies =c("http://www.ensembl.org/Multi/Search/Results?q=",";site=ensembl")
grc37 =c("http://grch37.ensembl.org/Human/Search/Results?q=", ";site=ensembl;facet_feature_type=Gene;facet_species=Human")
grc38 =c("http://www.ensembl.org/Human/Search/Results?q=", ";site=ensembl;facet_feature_type=Gene;facet_species=Human")
grc_mm38 =c("http://www.ensembl.org/Mouse/Search/Results?q=", ";site=ensembl;facet_feature_type=;facet_species=Mouse")
grc_Zebra =c("http://www.ensembl.org/Search/Results?q=", ";site=ensembl;facet_feature_type=;facet_species=Zebrafish")


uniprot_mouse =c('http://www.uniprot.org/uniprot/?query=','+Mouse+reviewed%3Ayes+&sort=score')
uniprot_human =c('http://www.uniprot.org/uniprot/?query=','+Human+reviewed%3Ayes+&sort=score')
uniprot_zebra =c('http://www.uniprot.org/uniprot/?query=','+zebrafish+reviewed%3Ayes+&sort=score')
# I left out (Mouse) part because it messes up with markdown, it still works.
# old
# uniprot_mouse =c('http://www.uniprot.org/uniprot/?query=organism%3A"Mus+musculus+[10090]"+',"&sort=score")
# uniprot_human =c('http://www.uniprot.org/uniprot/?query=organism%3A"Homo+sapiens+%28Human%29+[9606]"+',"&sort=score")
# uniprot_zebra =c('http://www.uniprot.org/uniprot/?query=organism%3A"Danio+rerio+(Zebrafish)+(Brachydanio+rerio)+[7955]"+',"&sort=score")



# HELP: http://string-db.org/help/faq/#how-do-i-link-to-string. Find Species ID by: http://www.ncbi.nlm.nih.gov/taxonomy
STRING = "http://string-db.org/newstring_cgi/show_network_section.pl?identifier="
STRING_mouse_suffix = "&species=10090"
STRING_human_suffix = "&species=9606"
STRING_elegans_suffix = "&species=6239"


# Single organism databases --------------------------------------------------------------------------------
HGNC_symbol_search = "http://www.genenames.org/cgi-bin/gene_search?search="

wormbase_search_prefix = "https://www.wormbase.org/search/gene/"
worm_CGC_prefix =c("http://www.cgc.cbs.umn.edu/search.php?st=","&field=all&exst=&exfield=all")

b.dbl.writeOut =F
b.dbl.Open =F

# openURLs.1by1(links) ------------------------------------------------------------------------------------------------
openURLs.1by1 <- function(links, wait=1) { # Open links with ~1 second delay. Necessary for slower computers and not to trigger the "robot" blocker of search engines (where you will pass your commands).
  for (link in links) {
    if (wait) Sys.sleep(runif(1)+.5)
    browseURL(link)
  }
}


# GeneCards links ------------------------------------------------------------------------------------------------
link_GeneCards <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse GeneCards links to your list of gene symbols.
  links = paste0(GeneCards, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

# ENSEMBL Links --------------------------------------------------------------------------------------------------------------------------------

link_ensembl_zebra <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse the latest ensembl (GRC38) links to your list of gene symbols.
  links = paste0(grc_Zebra[1], vector_of_gene_symbols, grc_Zebra[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

link_ensembl_mice <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse the latest ensembl (GRC38) links to your list of gene symbols.
  links = paste0(grc_mm38[1], vector_of_gene_symbols, grc_mm38[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

link_ensembl_mice <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse the latest ensembl (GRC38) links to your list of gene symbols.
  links = paste0(grc_mm38[1], vector_of_gene_symbols, grc_mm38[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

link_ensembl <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse the latest ensembl (GRC38) links to your list of gene symbols.
  links = paste0(ensembl_multispecies[1], vector_of_gene_symbols, ensembl_multispecies[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation )
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

link_ensembl.grc37 <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse ensembl GRC37 links to your list of gene symbols.
  links = paste0(grc37[1], vector_of_gene_symbols, grc37[2])
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

## UNIPROT Links --------------------------------------------------------------------------------------------------------------------------------

link_uniprot_mice <- function(vector_of_gene_symbols, writeOut = F, Open = b.dbl.Open) { # Parse the latest UNIPROT links to your list of gene symbols.
  links = paste0(uniprot_mouse[1], vector_of_gene_symbols, uniprot_mouse[2] )
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}
lll='http://www.uniprot.org/uniprot/?query=Eef1d+Mouse+reviewed%3Ayes+&sort=score'


link_uniprot_human <- function(vector_of_gene_symbols, writeOut = F, Open = b.dbl.Open) { # Parse the latest UNIPROT links to your list of gene symbols.
  links = paste0( uniprot_human[1], vector_of_gene_symbols, uniprot_human[2] )
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

link_uniprot_zebrafish <- function(vector_of_gene_symbols, writeOut = F, Open = b.dbl.Open) { # Parse the latest UNIPROT links to your list of gene symbols.
  links = paste0( uniprot_zebra[1], vector_of_gene_symbols, uniprot_zebra[2] )
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}


# SRING links ------------------------------------------------------------------------
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
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}


# SRING links ------------------------------------------------------------------------
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
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}



# PUBMED links ------------------------------------------------------------------------

link_pubmed <- function(vector_of_gene_symbols  # Parse PUBMED database links to your list of gene symbols. "additional_terms" can be any vector of strings that will be searched for together with each gene.
                         , additional_terms = "", writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links = paste0( PUBMED_search_prefix, vector_of_gene_symbols, " ", paste(additional_terms, collapse = " ") )
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}


# Wikipedia links ------------------------------------------------------------------------

link_wikipedia <- function(vector_of_gene_symbols  # Parse wikipedia search query links to your list of gene symbols.
                            , writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links = paste0( wikipedia, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

# Google search URL / search query links ------------------------------------------------------------------------
google="http://www.google.com/search?as_q="

link_google <- function(vector_of_gene_symbols # Parse google search query links to your list of gene symbols. Strings "prefix" and ""suffix" will be searched for together with each gene ("Human ID4 neurons"). See updated google and bing services in [CodeAndRoll.R](https://vertesy.github.io/CodeAndRoll.R).
                         , prefix ="", suffix ="", writeOut = b.dbl.writeOut, Open = b.dbl.Open, sleep=1) {
  links = paste0( google, prefix," ", vector_of_gene_symbols," ", suffix)
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    if (sleep>0) {  bash_commands = paste0(bash_commands, ' ; sleep ', sleep)  } # if wait
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}


# HGNC links ------------------------------------------------------------------------------------------------
link_HGNC <- function(vector_of_gene_symbols # Parse HGNC links to your list of gene symbols.
                      , writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links = paste0(HGNC_symbol_search, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

# Quick lookup versioin
qHGNC <- function(vector_of_gene_symbols # Parse HGNC links to your list of gene symbols.
                      , writeOut = FALSE, Open = TRUE) {
  links = paste0(HGNC_symbol_search, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open ", links)
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

# wormbase links ------------------------------------------------------------------------

link_wormbase <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse wormbase database links to your list of gene symbols..
  links = paste0( wormbase_search_prefix, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}

# CGC links (worms mutant database) ------------------------------------------------------------------------

link_CGC <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse CGC links (worms mutant database).
  links = paste0( worm_CGC_prefix[1], vector_of_gene_symbols, worm_CGC_prefix[2] )
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) } else { return(links)}

}


# MGI JAX mouse genomics links ------------------------------------------------------------------------
MGI_search_prefix = "http://www.informatics.jax.org/searchtool/Search.do?query="
MGI_search_suffix = "&submit=Quick+Search"

link_MGI.JAX <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse MGI JAX mouse genomics links search query links to your list of gene symbols.
  links = paste0( MGI_search_prefix, vector_of_gene_symbols, MGI_search_suffix)
  if (writeOut) {
    bash_commands = paste0("open '", links, "'")
    write.simple.append("", ManualName = BashScriptLocation)
    write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) { openURLs.1by1(links) }	else { return(links) }
}


#  ------------------------------------------------------------------------
#  ------------------------------------------------------------------------
#  ------------------------------------------------------------------------
#  ------------------------------------------------------------------------
#  ------------------------------------------------------------------------

