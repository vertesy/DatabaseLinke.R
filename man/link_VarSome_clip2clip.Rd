% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DatabaseLinke.R
\name{link_VarSome_clip2clip}
\alias{link_VarSome_clip2clip}
\title{link_VarSome_clip2clip}
\usage{
link_VarSome_clip2clip(
  rdIDs = clipr::read_clip_tbl(header = FALSE),
  searchQueryPrefix = "https://varsome.com/variant/",
  hg = "hg19",
  suffix = "?annotation-mode=germline",
  as.ExcelLink = TRUE,
  as.MarkDownLink = FALSE
)
}
\arguments{
\item{rdIDs}{A dataframe of rsIDs read from the clipboard. Default: clipboard content.}

\item{searchQueryPrefix}{The base URL for VarSome search query. Default: 'https://varsome.com/variant/'.}

\item{hg}{The human genome version for the search, either "hg19" or "hg38". Default: "hg19".}

\item{suffix}{The suffix for VarSome search. Default: "?annotation-mode=germline".}

\item{as.ExcelLink}{A logical indicating whether to format the links as Excel links. Default: TRUE.}

\item{as.MarkDownLink}{A logical indicating whether to format the links as Markdown links. Default: FALSE.}
}
\description{
Generate VarSome links from a list of rsIDs.
}
\examples{
link_VarSome_clip2clip(rdIDs = clipr::read_clip_tbl(header = FALSE), hg = "hg38")

}
