######################################################################
# DatabaseLinke.Setup.Global.Variables.R
######################################################################
# source('~/GitHub/Packages/DatabaseLinke.R/R/DatabaseLinke.Setup.Global.Variables.R')
# source('https://raw.githubusercontent.com/vertesy/DatabaseLinke.R/master/DatabaseLinke.R')



# User Setup ----------------------------------------------------------------------
{
  b.dbl.writeOut =F
  b.dbl.Open =F
  BashScriptLocation = "~/bin/run.sh"

  Sys.setenv("R_BROWSER" = "/usr/bin/open -a '/Applications/Safari.app'") # # "As of 2019 Firefox Qunatum is not working with BrowseURL"
  # Sys.setenv("R_BROWSER" = "/usr/bin/open -a '/Applications/Google Chrome.app'")
  options(browser = as.vector(Sys.getenv("R_BROWSER")))
}

# Search URL strings ----------------------------------------------------------------------
{
  # Static part of Query links ------------------------
  PUBMED_search_prefix = "https://www.ncbi.nlm.nih.gov/pubmed/?term="
  wikipedia = "http://en.wikipedia.org/w/index.php?search="
  google="http://www.google.com/search?as_q="   # SEE: http://www.our-picks.com/archives/2007/01/30/google-search-urls-revealed-or-how-to-create-your-own-search-url/
  GeneCards = "http://www.genecards.org/Search/Keyword?queryString="

  ensembl_multispecies =c("http://www.ensembl.org/Multi/Search/Results?q=",";site=ensembl")
  grc37 =c("http://grch37.ensembl.org/Human/Search/Results?q=", ";site=ensembl;facet_feature_type=Gene;facet_species=Human")
  grc38 =c("http://www.ensembl.org/Human/Search/Results?q=", ";site=ensembl;facet_feature_type=Gene;facet_species=Human")
  grc_mm38 =c("http://www.ensembl.org/Mouse/Search/Results?q=", ";site=ensembl;facet_feature_type=;facet_species=Mouse")
  grc_Zebra =c("http://www.ensembl.org/Search/Results?q=", ";site=ensembl;facet_feature_type=;facet_species=Zebrafish")

  uniprot_mouse =c('http://www.uniprot.org/uniprot/?query=','+Mouse+reviewed%3Ayes+&sort=score') # I left out (Mouse) part because it messes up with markdown, it still works.
  uniprot_human =c('http://www.uniprot.org/uniprot/?query=','+Human+reviewed%3Ayes+&sort=score')
  uniprot_zebra =c('http://www.uniprot.org/uniprot/?query=','+zebrafish+reviewed%3Ayes+&sort=score')

  STRING = "http://string-db.org/newstring_cgi/show_network_section.pl?identifier=" # HELP: http://string-db.org/help/faq/#how-do-i-link-to-string. Find Species ID by: http://www.ncbi.nlm.nih.gov/taxonomy
  STRING_mouse_suffix = "&species=10090"
  STRING_human_suffix = "&species=9606"
  STRING_elegans_suffix = "&species=6239"

  # Single organism databases --------------------------------------------------------------------------------
  HGNC_symbol_search = "http://www.genenames.org/cgi-bin/gene_search?search="

  wormbase_search_prefix = "https://www.wormbase.org/search/gene/"
  # worm_CGC_prefix =c("http://www.cgc.cbs.umn.edu/search.php?st=","&field=all&exst=&exfield=all")

  MGI_search_prefix = "http://www.informatics.jax.org/searchtool/Search.do?query="
  MGI_search_suffix = "&submit=Quick+Search"
}

# old
# uniprot_mouse =c('http://www.uniprot.org/uniprot/?query=organism%3A"Mus+musculus+[10090]"+',"&sort=score")
# uniprot_human =c('http://www.uniprot.org/uniprot/?query=organism%3A"Homo+sapiens+%28Human%29+[9606]"+',"&sort=score")
# uniprot_zebra =c('http://www.uniprot.org/uniprot/?query=organism%3A"Danio+rerio+(Zebrafish)+(Brachydanio+rerio)+[7955]"+',"&sort=score")
#

