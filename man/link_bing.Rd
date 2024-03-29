% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DatabaseLinke.R
\name{link_bing}
\alias{link_bing}
\title{link_bing}
\usage{
link_bing(
  vector_of_gene_symbols,
  bing = "https://www.bing.com/search?q = ",
  prefix = "",
  suffix = "",
  writeOut = b.dbl.writeOut,
  Open = b.dbl.Open,
  sleep = 0
)
}
\arguments{
\item{vector_of_gene_symbols}{A character vector of gene symbols to generate Bing search links.}

\item{bing}{A Bing search URL string, default: "https://www.bing.com/search?q = ".}

\item{prefix}{A string to be added before each gene symbol in the search query, default: ''.}

\item{suffix}{A string to be added after each gene symbol in the search query, default: ''.}

\item{writeOut}{A boolean indicating whether to write the bash commands to file, default: b.dbl.writeOut.}

\item{Open}{A boolean indicating whether to open the search links, default: b.dbl.Open.}

\item{sleep}{The sleep interval in seconds between opening search links, default: 1.}
}
\description{
Parses Bing search query links for a provided list of gene symbols.
}
\examples{
link_bing("ACTB")

}
