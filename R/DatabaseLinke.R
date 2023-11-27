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
  "BashScriptLocation", "GeneCards", "PUBMED_search_prefix", "wikipedia", "ensembl_multispecies",
  "grc37", "grc38", "grc_mm38", "grc_Zebra", "uniprot_mouse", "uniprot_human", "uniprot_zebra",
  "STRING", "STRING_mouse_suffix", "STRING_human_suffix", "STRING_elegans_suffix", "HGNC_symbol_search",
  "wormbase_search_prefix", "worm_CGC_prefix",
  "google", "MGI_search_prefix", "MGI_search_suffix", "b.dbl.writeOut", "b.dbl.Open"
))


# _________________________________________________________________________________________________
#' @title Open URLs One by One
#'
#' @description This function opens provided links sequentially with an optional delay between each.
#' This can be useful for slower computers and to avoid triggering anti-robot measures in search engines.
#' @param links A vector of URLs to be opened sequentially.
#' @param wait Delay in seconds between opening each URL. By default, it is set to 1 second.
#' @examples
#' geneSymbols <- c("Sox2", "Actb")
#' openURLsOneByOne(geneSymbols)
#'
#' @export
openURLs.1by1 <- function(links, wait = 1) {
  for (link in links) {
    if (wait) Sys.sleep(runif(1) + .5)
    browseURL(link)
  }
}

# _________________________________________________________________________________________________
#' @title GeneCards Link Generator
#'
#' @description Generates GeneCards URLs for a given list of gene symbols.
#' @param vector_of_gene_symbols A character vector containing gene symbols.
#' @param writeOut A logical parameter determining if URLs should be written out to a bash script. Default is b.dbl.writeOut.
#' @param Open A logical parameter determining if URLs should be opened immediately. Default is b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_GeneCards(geneSymbols)
#' link_GeneCards(geneSymbols, Open = TRUE)
#'
#' @export
link_GeneCards <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links <- paste0(GeneCards, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}

# _________________________________________________________________________________________________
#' @title Zebrafish Ensembl Link Generator
#'
#' @description Generates the latest Ensembl (GRC38) URLs for a given list of zebrafish gene symbols.
#' @param vector_of_gene_symbols A character vector containing zebrafish gene symbols.
#' @param writeOut A logical parameter determining if URLs should be written out to a bash script. Default is b.dbl.writeOut.
#' @param Open A logical parameter determining if URLs should be opened immediately. Default is b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_ensembl_zebra(geneSymbols)
#' link_ensembl_zebra(geneSymbols, Open = TRUE)
#'
#' @export
link_ensembl_zebra <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links <- paste0(grc_Zebra[1], vector_of_gene_symbols, grc_Zebra[2])
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}

# _________________________________________________________________________________________________
#' @title Mouse Ensembl Link Generator
#'
#' @description Generates the latest Ensembl (GRC38) URLs for a given list of mouse gene symbols.
#' @param vector_of_gene_symbols A character vector containing mouse gene symbols.
#' @param writeOut A logical parameter determining if URLs should be written out to a bash script. Default is b.dbl.writeOut.
#' @param Open A logical parameter determining if URLs should be opened immediately. Default is b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_ensembl_mice(geneSymbols)
#' link_ensembl_mice(geneSymbols, Open = TRUE)
#'
#' @export
link_ensembl_mice <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links <- paste0(grc_mm38[1], vector_of_gene_symbols, grc_mm38[2])
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}

# _________________________________________________________________________________________________
#' @title Generate Zebrafish Ensembl Links
#'
#' @description This function generates the latest Zebrafish Ensembl (GRC38) links for a list of gene symbols.
#' @param vector_of_gene_symbols A vector containing gene symbols to be linked.
#' @param writeOut A boolean flag indicating whether to write out the output or not. Default is the value of `b.dbl.writeOut`.
#' @param Open A boolean flag indicating whether to open the links. Default is the value of `b.dbl.Open`.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_ensembl_zebra(geneSymbols)
#' link_ensembl_zebra(geneSymbols, Open = TRUE)
#'
#' @export
link_ensembl_zebra <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse the latest ensembl (GRC38) links to your list of gene symbols.
  links <- paste0(grc_Zebra[1], vector_of_gene_symbols, grc_Zebra[2])
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}

# _________________________________________________________________________________________________
#' @title Generate Ensembl Links
#'
#' @description This function generates the latest Ensembl (GRC38) links for a list of gene symbols.
#' @param vector_of_gene_symbols A vector containing gene symbols to be linked.
#' @param writeOut A boolean flag indicating whether to write out the output or not. Default is the value of `b.dbl.writeOut`.
#' @param Open A boolean flag indicating whether to open the links. Default is the value of `b.dbl.Open`.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_ensembl(geneSymbols)
#' link_ensembl(geneSymbols, Open = TRUE)
#'
#' @export
link_ensembl <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links <- paste0(ensembl_multispecies[1], vector_of_gene_symbols, ensembl_multispecies[2])
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}

# _________________________________________________________________________________________________
#' @title Parse Ensembl GRC37 links
#'
#' @description This function generates Ensembl GRC37 links for a list of gene symbols.
#' @param vector_of_gene_symbols A character vector of gene symbols.
#' @param writeOut A logical indicating whether to write out the links. Default is b.dbl.writeOut.
#' @param Open A logical indicating whether to open the links. Default is b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_ensembl.grc37(geneSymbols)
#' link_ensembl.grc37(geneSymbols, Open = TRUE)
#'
#' @export
link_ensembl.grc37 <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse ensembl GRC37 links to your list of gene symbols.
  links <- paste0(grc37[1], vector_of_gene_symbols, grc37[2])
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}


# _________________________________________________________________________________________________
#' @title Parse UNIPROT Links for Mice Genes
#'
#' @description This function generates UNIPROT links for a list of mouse gene symbols.
#' @param vector_of_gene_symbols A character vector of mouse gene symbols.
#' @param writeOut A logical indicating whether to write out the links. Default is FALSE.
#' @param Open A logical indicating whether to open the links. Default is b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_uniprot_mice(geneSymbols)
#' link_uniprot_mice(geneSymbols, Open = TRUE)
#'
#' @export
link_uniprot_mice <- function(vector_of_gene_symbols, writeOut = F, Open = b.dbl.Open) { # Parse the latest UNIPROT links to your list of gene symbols.
  links <- paste0(uniprot_mouse[1], vector_of_gene_symbols, uniprot_mouse[2])
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}
lll <- "http://www.uniprot.org/uniprot/?query=Eef1d+Mouse+reviewed%3Ayes+&sort=score"


# _________________________________________________________________________________________________
#' @title Parse UNIPROT Links for Human Genes
#'
#' @description This function generates UNIPROT links for a list of human gene symbols.
#' @param vector_of_gene_symbols A character vector of human gene symbols.
#' @param writeOut A logical indicating whether to write out the links. Default is FALSE.
#' @param Open A logical indicating whether to open the links. Default is b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_uniprot_human(geneSymbols)
#' link_uniprot_human(geneSymbols, Open = TRUE)
#'
#' @export
link_uniprot_human <- function(vector_of_gene_symbols, writeOut = F, Open = b.dbl.Open) { # Parse the latest UNIPROT links to your list of gene symbols.
  links <- paste0(uniprot_human[1], vector_of_gene_symbols, uniprot_human[2])
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}

# _________________________________________________________________________________________________
#' @title Parse UNIPROT Links for Zebrafish Genes
#'
#' @description This function generates UNIPROT links for a list of zebrafish gene symbols.
#' @param vector_of_gene_symbols A character vector of zebrafish gene symbols.
#' @param writeOut A logical indicating whether to write out the links. Default is FALSE.
#' @param Open A logical indicating whether to open the links. Default is b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_uniprot_zebrafish(geneSymbols)
#' link_uniprot_zebrafish(geneSymbols, Open = TRUE)
#'
#' @export
link_uniprot_zebrafish <- function(vector_of_gene_symbols, writeOut = F, Open = b.dbl.Open) { # Parse the latest UNIPROT links to your list of gene symbols.
  links <- paste0(uniprot_zebra[1], vector_of_gene_symbols, uniprot_zebra[2])
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}


# _________________________________________________________________________________________________
#' @title Parse STRING Database Links
#'
#' @description This function generates links to the STRING protein interaction database for a list of gene symbols.
#' @param vector_of_gene_symbols A character vector of gene symbols.
#' @param organism A string indicating the organism. Can be 'mouse', 'human' or 'elegans'. Default is 'human'.
#' @param writeOut A logical indicating whether to write out the links. Default is b.dbl.writeOut.
#' @param Open A logical indicating whether to open the links. Default is b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_String(geneSymbols)
#' link_String(geneSymbols, Open = TRUE)
#'
#' @export

link_String <- function(vector_of_gene_symbols # Parse STRING protein interaction database links to your list of gene symbols. "organism" can be mouse, human or NA.
                        , organism = "human", writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  suffix <- if (is.na(organism)) {
    ""
  } else if (organism == "elegans") {
    STRING_elegans_suffix
  } else if (organism == "mouse") {
    STRING_mouse_suffix
  } else if (organism == "human") {
    STRING_human_suffix
  }
  links <- paste0(STRING, vector_of_gene_symbols, suffix)
  if (writeOut) {
    bash_commands <- paste0("open '", links, "'")
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}


# _________________________________________________________________________________________________
#' @title qString
#'
#' @description Generates links to the STRING protein interaction database based on a given list of gene symbols. The function supports different organisms such as mice, humans, or "NA" for no specific organism.
#' @param vector_of_gene_symbols A character vector of gene symbols for which links should be created.
#' @param organism A string indicating the organism of interest. Default is "human".
#' @param writeOut A boolean indicating whether to write out the commands or not. Default is FALSE.
#' @param Open A boolean indicating whether to open the generated links or not. Default is TRUE.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' qString(geneSymbols)
#' qString(geneSymbols, Open = TRUE)
#'
#' @export
qString <- function(vector_of_gene_symbols # Parse STRING protein interaction database links to your list of gene symbols. "organism" can be mouse, human or NA.
                    , organism = "human", writeOut = F, Open = TRUE) {
  suffix <- if (is.na(organism)) {
    ""
  } else if (organism == "elegans") {
    STRING_elegans_suffix
  } else if (organism == "mouse") {
    STRING_mouse_suffix
  } else if (organism == "human") {
    STRING_human_suffix
  }
  links <- paste0(STRING, vector_of_gene_symbols, suffix)
  if (writeOut) {
    bash_commands <- paste0("open '", links, "'")
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}



# _________________________________________________________________________________________________
#' @title link_pubmed
#'
#' @description Generates links to the PUBMED database based on a given list of gene symbols and additional search terms.
#' @param vector_of_gene_symbols A character vector of gene symbols for which links should be created.
#' @param additional_terms A character vector of additional terms to be included in the search query. Default is an empty string.
#' @param writeOut A boolean indicating whether to write out the commands or not. Default is determined by b.dbl.writeOut.
#' @param Open A boolean indicating whether to open the generated links or not. Default is determined by b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_pubmed(geneSymbols)
#' link_pubmed(geneSymbols, Open = TRUE)
#'
#' @export
link_pubmed <- function(vector_of_gene_symbols # Parse PUBMED database links to your list of gene symbols. "additional_terms" can be any vector of strings that will be searched for together with each gene.
                        , additional_terms = "", writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links <- paste0(PUBMED_search_prefix, vector_of_gene_symbols, " ", paste(additional_terms, collapse = " "))
  if (writeOut) {
    bash_commands <- paste0("open '", links, "'")
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}


# _________________________________________________________________________________________________
#' @title link_wikipedia
#'
#' @description Generates Wikipedia search query links based on a given list of gene symbols.
#' @param vector_of_gene_symbols A character vector of gene symbols for which links should be created.
#' @param writeOut A boolean indicating whether to write out the commands or not. Default is determined by b.dbl.writeOut.
#' @param Open A boolean indicating whether to open the generated links or not. Default is determined by b.dbl.Open.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_wikipedia(geneSymbols)
#' link_wikipedia(geneSymbols, Open = TRUE)
#'
#' @export
link_wikipedia <- function(vector_of_gene_symbols # Parse wikipedia search query links to your list of gene symbols.
                           , writeOut = b.dbl.writeOut, Open = b.dbl.Open) {
  links <- paste0(wikipedia, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands <- paste0("open '", links, "'")
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}

# _________________________________________________________________________________________________
#' @title link_google
#'
#' @description Parses Google search query links for a provided list of gene symbols.
#'              The "prefix" and "suffix" will be searched for together with each gene (e.g., "Human ID4 neurons").
#'              Uses google="http://www.google.com/search?as_q=".
#' @param vector_of_gene_symbols A character vector of gene symbols to generate Google search links.
#' @param google A Google search URL string, default: "http://www.google.com/search?as_q = ".
#' @param prefix A string to be added before each gene symbol in the search query, default: ''.
#' @param suffix A string to be added after each gene symbol in the search query, default: ''.
#' @param writeOut A boolean indicating whether to write the bash commands to file, default: b.dbl.writeOut.
#' @param Open A boolean indicating whether to open the search links, default: b.dbl.Open.
#' @param sleep The sleep interval in seconds between opening search links, default: 1.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_google(geneSymbols)
#' link_google(geneSymbols, Open = TRUE)
#'
#' @export
link_google <- function(
    vector_of_gene_symbols #  Parse google search query links to your list of gene symbols. Strings "prefix" and ""suffix" will be searched for together with each gene ("Human ID4 neurons"). See many additional services in [DatabaseLinke.R](https://vertesy.github.io/DatabaseLinke.R/).
    , google = "http://www.google.com/search?as_q = ", prefix = "", suffix = "",
    writeOut = b.dbl.writeOut, Open = b.dbl.Open, sleep = 0) {
  links <- paste0(google, prefix, " ", vector_of_gene_symbols, " ", suffix)
  if (writeOut) {
    bash_commands <- paste0("open '", links, "'")
    if (sleep > 0) {
      bash_commands <- paste0(bash_commands, " ; sleep ", sleep)
    } # if wait
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    for (linkX in links) Sys.sleep(0.3 + runif(1))
    browseURL(linkX, encodeIfNeeded = T)
  } else {
    return(links)
  }
}

function(vector_of_gene_symbols, prefix = "", suffix = "", writeOut = b.dbl.writeOut,
         Open = b.dbl.Open, sleep = 1) {
  links <- paste0(
    google, prefix, " ", vector_of_gene_symbols,
    " ", suffix
  )
  if (writeOut) {
    bash_commands <- paste0("open '", links, "'")
    if (sleep > 0) {
      bash_commands <- paste0(
        bash_commands, " ; sleep ",
        sleep
      )
    }
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}


# _________________________________________________________________________________________________
#' @title link_bing
#'
#' @description Parses Bing search query links for a provided list of gene symbols.
#' @param vector_of_gene_symbols A character vector of gene symbols to generate Bing search links.
#' @param bing A Bing search URL string, default: "https://www.bing.com/search?q = ".
#' @param prefix A string to be added before each gene symbol in the search query, default: ''.
#' @param suffix A string to be added after each gene symbol in the search query, default: ''.
#' @param writeOut A boolean indicating whether to write the bash commands to file, default: b.dbl.writeOut.
#' @param Open A boolean indicating whether to open the search links, default: b.dbl.Open.
#' @param sleep The sleep interval in seconds between opening search links, default: 1.
#' @examples link_bing("ACTB")
#'
#' @export
link_bing <- function(
    vector_of_gene_symbols #  Parse bing search query links to your list of gene symbols. Strings "prefix" and ""suffix" will be searched for together with each gene ("Human ID4 neurons"). See many additional services in [DatabaseLinke.R](https://vertesy.github.io/DatabaseLinke.R/).
    , bing = "https://www.bing.com/search?q = ", prefix = "", suffix = "",
    writeOut = b.dbl.writeOut, Open = b.dbl.Open, sleep = 0) {
  links <- paste0(bing, prefix, " ", vector_of_gene_symbols, " ", suffix)
  if (writeOut) {
    bash_commands <- paste0("open '", links, "'")
    if (sleep > 0) {
      bash_commands <- paste0(bash_commands, " ; sleep ", sleep)
    } # if wait
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    for (linkX in links) Sys.sleep(0.3 + runif(1))
    browseURL(linkX, encodeIfNeeded = T)
  } else {
    return(links)
  }
}


# _________________________________________________________________________________________________
#' @title HGNC link generator and web lookup
#'
#' @description Parses HGNC links for a provided list of gene symbols.
#' @param vector_of_gene_symbols A character vector of gene symbols to generate HGNC links.
#' @param writeOut A boolean indicating whether to write the bash commands to file, default: FALSE.
#' @param Open A boolean indicating whether to open the HGNC links, default: TRUE.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' qHGNC(geneSymbols)
#' qHGNC(geneSymbols, Open = FALSE)
#'
#' @export
qHGNC <- function(
    vector_of_gene_symbols # Parse HGNC links to your list of gene symbols.
    , HGNC_symbol_search = "http://www.genenames.org/cgi-bin/gene_search?search=",
    writeOut = FALSE, Open = TRUE) {
  links <- paste0(HGNC_symbol_search, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands <- paste0("open ", links)
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}

link_HGNC <- qHGNC

# # Quick lookup versioin
# #' @title qHGNC
# #' @description Parse HGNC links to your list of gene symbols.
# #' @param vector_of_gene_symbols PARAM_DESCRIPTION
# #' @param writeOut PARAM_DESCRIPTION, Default: FALSE
# #' @param Open PARAM_DESCRIPTION, Default: TRUE
# #' @examples geneSymbols = c('Sox2', 'Actb'); qHGNC(geneSymbols); qHGNC(geneSymbols, Open = TRUE)
# #' @export
# qHGNC <- function(vector_of_gene_symbols # Parse HGNC links to your list of gene symbols.
#                   , writeOut = FALSE, Open = TRUE) {
#   links = paste0(HGNC_symbol_search, vector_of_gene_symbols)
#   if (writeOut) {
#     bash_commands = paste0("open ", links)
#     ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
#     ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
#   } else if (Open) { openURLs.1by1(links) } else { return(links) }
# }

# _________________________________________________________________________________________________
#' @title link_wormbase
#'
#' @description Generate Wormbase database links for a list of gene symbols.
#' @param vector_of_gene_symbols A character vector of gene symbols for which to generate Wormbase links.
#' @param wormbase_search_prefix The base URL for Wormbase search.
#' @param writeOut A logical indicating whether to write the generated links to a file, default: FALSE.
#' @param Open A logical indicating whether to open the generated links in a web browser, default: TRUE.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_wormbase(geneSymbols)
#' link_wormbase(geneSymbols, Open = TRUE)
#'
#' @export
link_wormbase <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse wormbase database links to your list of gene symbols..
  links <- paste0(wormbase_search_prefix, vector_of_gene_symbols)
  if (writeOut) {
    bash_commands <- paste0("open '", links, "'")
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}



# _________________________________________________________________________________________________
#' @title link_MGI.JAX
#'
#' @description Generate MGI JAX mouse genomics search query links for a list of gene symbols.
#' @param vector_of_gene_symbols A character vector of gene symbols for which to generate MGI JAX links.
#' @param MGI_search_prefix The base URL for MGI JAX search.
#' @param MGI_search_suffix The suffix for MGI JAX search.
#' @param writeOut A logical indicating whether to write the generated links to a file, default: FALSE.
#' @param Open A logical indicating whether to open the generated links in a web browser, default: TRUE.
#' @examples geneSymbols <- c("Sox2", "Actb")
#' link_MGI.JAX(geneSymbols)
#' link_MGI.JAX(geneSymbols, Open = TRUE)
#'
#' @export
link_MGI.JAX <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse MGI JAX mouse genomics links search query links to your list of gene symbols.
  links <- paste0(MGI_search_prefix, vector_of_gene_symbols, MGI_search_suffix)
  if (writeOut) {
    bash_commands <- paste0("open '", links, "'")
    ReadWriter::write.simple.append("", ManualName = BashScriptLocation)
    ReadWriter::write.simple.append(bash_commands, ManualName = BashScriptLocation)
  } else if (Open) {
    openURLs.1by1(links)
  } else {
    return(links)
  }
}


# _________________________________________________________________________________________________
#' @title link_SNPedia_clip2clip
#'
#' @description Generate SNPedia links from a list of rsIDs copied from an Excel column.
#' @param rdIDs A list of rsIDs from an Excel column.
#' @param searchQueryPrefix The base URL for SNPedia search, default: 'https://www.snpedia.com/index.php/'.
#' @param as.ExcelLink A logical indicating whether to format the links as Excel links, default: TRUE.
#' @param as.MarkDownLink A logical indicating whether to format the links as Markdown links, default: FALSE.
#' @examples link_SNPedia_clip2clip(rdIDs = clipr::read_clip_tbl(header = F))
#'
#' @export
link_SNPedia_clip2clip <- function(
    rdIDs = clipr::read_clip_tbl(header = F),
    searchQueryPrefix = "https://www.snpedia.com/index.php/",
    as.ExcelLink = T,
    as.MarkDownLink = F) {
  v.rdIDs <- tibble::deframe(rdIDs)
  links <- paste0(searchQueryPrefix, v.rdIDs)
  tbl_link <- as.tibble(links)
  print(head(tbl_link))
  colnames(tbl_link) <- NULL
  if (as.ExcelLink) {
    tbl_link <- FormatAsExcelLink(site_name = v.rdIDs, site_url = links)
    print("Now paste into to Execl, or google sheets")
  } else if (as.MarkDownLink) {
    tbl_link <- paste0("[", v.rdIDs, "](", links, ")")
    print("Now  paste into to typora (then text edit, then Execl, then google docs)")
  }

  clipr::write_clip(tbl_link)
}
# link_SNPedia_clip2clip()



# _________________________________________________________________________________________________
#' @title link_Franklin_clip2clip
#'
#' @description Generate Franklin (Genoox) links from a list of coordinates.
#' @param coordinates A two-column dataframe of coordinates in the format (e.g., 5:35162876 C/T or 16:7164219 T/G) read from the clipboard. Default: clipboard content.
#' @param searchQueryPrefix The base URL for Genoox Franklin search query. Default: 'https://franklin.genoox.com/clinical-db/variant/snp/'.
#' @param as.ExcelLink A logical indicating whether to format the links as Excel links. Default: TRUE.
#' @examples link_Franklin_clip2clip(coordinates = clipr::read_clip_tbl(header = F))
#'
#' @export
link_Franklin_clip2clip <- function(
    coordinates = clipr::read_clip_tbl(header = F),
    searchQueryPrefix = "https://franklin.genoox.com/clinical-db/variant/snp/",
    as.ExcelLink = T) {
  stopifnot(ncol(coordinates) == 2)
  Coord <-
    if (idim(coordinates)[2] == 2) {
      coordinates <- paste(coordinates[, 1], coordinates[, 2], sep = ":")
    } else {
      tibble::deframe(coordinates)
    }

  Coord.Formattes <- paste0("chr", gsub(x = Coord, pattern = ":", replacement = "-"))
  Coord.Formattes <- gsub(x = Coord.Formattes, pattern = "/", replacement = "-")

  links <- paste0(searchQueryPrefix, Coord.Formattes)
  tbl_link <- as.tibble(links)
  print(head(tbl_link))
  colnames(tbl_link) <- NULL
  if (as.ExcelLink) {
    tbl_link <- FormatAsExcelLink(site_name = tibble::deframe(Coord.Formattes), site_url = links)
    print("Now paste into to Execl, or google sheets")
  }
  clipr::write_clip(tbl_link)
}
# link_Franklin_clip2clip()



# _________________________________________________________________________________________________
#' @title link_VarSome_clip2clip
#'
#' @description Generate VarSome links from a list of rsIDs.
#' @param rdIDs A dataframe of rsIDs read from the clipboard. Default: clipboard content.
#' @param searchQueryPrefix The base URL for VarSome search query. Default: 'https://varsome.com/variant/'.
#' @param hg The human genome version for the search, either "hg19" or "hg38". Default: "hg19".
#' @param suffix The suffix for VarSome search. Default: "?annotation-mode=germline".
#' @param as.ExcelLink A logical indicating whether to format the links as Excel links. Default: TRUE.
#' @param as.MarkDownLink A logical indicating whether to format the links as Markdown links. Default: FALSE.
#' @examples link_VarSome_clip2clip(rdIDs = clipr::read_clip_tbl(header = F), hg = "hg38")
#'
#' @export
link_VarSome_clip2clip <- function(
    rdIDs = clipr::read_clip_tbl(header = F),
    searchQueryPrefix = "https://varsome.com/variant/",
    hg = "hg19",
    suffix = "?annotation-mode=germline",
    as.ExcelLink = T,
    as.MarkDownLink = F) {
  "https://varsome.com/variant/hg38/rs12970134?annotation-mode=germline"
  prefix_total <- paste0(searchQueryPrefix, hg, "/")

  v.rdIDs <- tibble::deframe(rdIDs)
  links <- paste0(prefix_total, v.rdIDs, suffix)
  tbl_link <- as.tibble(links)
  print(head(tbl_link))
  colnames(tbl_link) <- NULL
  if (as.ExcelLink) {
    tbl_link <- FormatAsExcelLink(
      site_name = paste("VS", v.rdIDs),
      site_url = links
    )
    print("Now paste into to Execl, or google sheets")
  } else if (as.MarkDownLink) {
    tbl_link <- paste0("[", v.rdIDs, "](", links, ")")
    print("Now  paste into to typora (then text edit, then Execl, then google docs)")
  }

  clipr::write_clip(tbl_link)
}
# link_VarSome_clip2clip()



# _________________________________________________________________________________________________


# old
# uniprot_mouse =c('http://www.uniprot.org/uniprot/?query=organism%3A"Mus+musculus+[10090]"+',"&sort=score")
# uniprot_human =c('http://www.uniprot.org/uniprot/?query=organism%3A"Homo+sapiens+%28Human%29+[9606]"+',"&sort=score")
# uniprot_zebra =c('http://www.uniprot.org/uniprot/?query=organism%3A"Danio+rerio+(Zebrafish)+(Brachydanio+rerio)+[7955]"+',"&sort=score")
