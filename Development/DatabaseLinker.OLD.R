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

# User Setup ----------------------------------------------------------------------
BashScriptLocation = "~/bin/run.sh"

.gene_IDs_hg19	 =try(read.simple.vec("~/GitHub/Wikis/TheCorvinas.wiki/Sequencing.and.Mapping/GeneModels/gene_IDs.hg19.vec"), silent =T)
.gene_IDs_mm10	 =try(read.simple.vec("~/GitHub/Wikis/TheCorvinas.wiki/Sequencing.and.Mapping/GeneModels/gene_IDs.mm10.vec"), silent =T)
.gene_names_hg19	 =try(read.simple.vec("~/GitHub/Wikis/TheCorvinas.wiki/Sequencing.and.Mapping/GeneModels/gene_names.hg19.vec"), silent =T)
.gene_names_mm10	 =try(read.simple.vec("~/GitHub/Wikis/TheCorvinas.wiki/Sequencing.and.Mapping/GeneModels/gene_names.mm10.vec"), silent =T)

# Validate Gene Symbols / Names / IDs ------------------------------------------------------------------------

validateGene <- function(vector_of_gene_symbols, ExpressionMatrix, SubsetOfGeneIDs = NULL, species = c("human", "mice")[1]) { # Validate Gene Symbols / Names / IDs,
  condition = F
  any_print(length(MarkerGenes), " gene symbols are provided."); print("", quote = F)
  gene_IDs = if (species == "human") {.gene_IDs_hg19} else if (species == "mice") {.gene_IDs_mm10}
  found = gene_IDs[sub("\\_\\_chr\\w+","",gene_IDs) %in% vector_of_gene_symbols]
  not_found = setdiff(vector_of_gene_symbols, id2name(found))
  if (length(not_found)) {any_print(length(not_found), "genes are not found in the",species,"reference: ", not_found, "or", x=parse_vec(not_found)); print("", quote = F) } #if

  GenesDetected = rownames(ExpressionMatrix)
  expressed = intersect(found, GenesDetected)
  not_expressed = setdiff(found, GenesDetected)
  if (length(not_expressed)) {any_print(length(not_expressed), "existing genes are not expressed: ", not_expressed, "or", x=parse_vec(not_expressed)); print("", quote = F) } #if
  any_print(length(expressed), "genes are expressed: ", expressed); print("", quote = F)

  if (length(SubsetOfGeneIDs)) {
    inSubset = intersect(expressed, SubsetOfGeneIDs)
    any_print(length(inSubset), "genes are expressed and found in", substitute(SubsetOfGeneIDs),": ", inSubset); print("", quote = F)
    return(inSubset)
  } else { return(expressed) }

}
# x=validateGene(MarkerGenes, HeartSlices, SubsetOfGeneIDs = HE_genes)
