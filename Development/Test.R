geneSymbols = c('Sox2', 'Actb')



openURLs.1by1("http://www.google.com/search?as_q= Sox2 ")

link_GeneCards(geneSymbols)
link_GeneCards(geneSymbols, Open = TRUE)


link_ensembl_mice(geneSymbols)
link_ensembl_mice(geneSymbols, Open = TRUE)


link_ensembl_mice(geneSymbols)
link_ensembl_mice(geneSymbols, Open = TRUE)


link_ensembl(geneSymbols)
link_ensembl(geneSymbols, Open = TRUE)


link_ensembl.grc37(geneSymbols)
link_ensembl.grc37(geneSymbols, Open = TRUE)


link_ensembl_zebra(geneSymbols)
link_ensembl_zebra(geneSymbols, Open = TRUE)


link_uniprot_mice(geneSymbols)
link_uniprot_mice(geneSymbols, Open = TRUE)


link_uniprot_human(geneSymbols)
link_uniprot_human(geneSymbols, Open = TRUE)


link_uniprot_zebrafish(geneSymbols)
link_uniprot_zebrafish(geneSymbols, Open = TRUE)


link_String(geneSymbols)
link_String(geneSymbols, Open = TRUE)


qString(geneSymbols)
qString(geneSymbols, Open = TRUE)


link_pubmed(geneSymbols)
link_pubmed(geneSymbols, Open = TRUE)


link_wikipedia(geneSymbols)
link_wikipedia(geneSymbols, Open = TRUE)


link_google(geneSymbols)
link_google(geneSymbols, Open = TRUE)


link_HGNC(geneSymbols)
link_HGNC(geneSymbols, Open = TRUE)


qHGNC(geneSymbols)
qHGNC(geneSymbols, Open = TRUE)


link_wormbase(geneSymbols)
link_wormbase(geneSymbols, Open = TRUE)


# link_CGC(geneSymbols)
# link_CGC(geneSymbols, Open = TRUE)


link_MGI.JAX(geneSymbols)
link_MGI.JAX(geneSymbols, Open = TRUE)




# Junkyard

#' # CGC links (worms mutant database) ------------------------------------------------------------------------
#'
#' #' @title link_CGC
#' #' @description Parse CGC links (worms mutant database).
#' #' @param vector_of_gene_symbols PARAM_DESCRIPTION
#' #' @param writeOut PARAM_DESCRIPTION, Default: b.dbl.writeOut
#' #' @param Open PARAM_DESCRIPTION, Default: b.dbl.Open
#' #' @export
#' link_CGC <- function(vector_of_gene_symbols, writeOut = b.dbl.writeOut, Open = b.dbl.Open) { # Parse CGC links (worms mutant database).
#'   links = paste0( worm_CGC_prefix[1], vector_of_gene_symbols, worm_CGC_prefix[2] )
#'   if (writeOut) {
#'     bash_commands = paste0("open '", links, "'")
#'     write.simple.append("", ManualName = BashScriptLocation)
#'     write.simple.append(bash_commands, ManualName = BashScriptLocation)
#'   } else if (Open) { openURLs.1by1(links) } else { return(links)}
#'
#' }
# link_CGC(geneSymbols); link_CGC(geneSymbols, Open = TRUE)
