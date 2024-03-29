% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DatabaseLinke.R
\name{link_uniprot_human}
\alias{link_uniprot_human}
\title{Parse UNIPROT Links for Human Genes}
\usage{
link_uniprot_human(vector_of_gene_symbols, writeOut = FALSE, Open = b.dbl.Open)
}
\arguments{
\item{vector_of_gene_symbols}{A character vector of human gene symbols.}

\item{writeOut}{A logical indicating whether to write out the links. Default is FALSE.}

\item{Open}{A logical indicating whether to open the links. Default is b.dbl.Open.}
}
\description{
This function generates UNIPROT links for a list of human gene symbols.
}
\examples{
geneSymbols <- c("Sox2", "Actb")
link_uniprot_human(geneSymbols)
link_uniprot_human(geneSymbols, Open = TRUE)

}
