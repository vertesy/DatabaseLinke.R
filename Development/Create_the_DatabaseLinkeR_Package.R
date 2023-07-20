######################################################################################################
# Create_the_DatabaseLinke.R_Package.v0.1.R
# 31 10 2021
######################################################################################################
# source("/Users/abel.vertesy/GitHub/Packages/DatabaseLinke.R/Development/Create_the_DatabaseLinke.R_Package.v0.1.R")
rm(list = ls(all.names = TRUE));
try(dev.off(), silent = TRUE)
# install.packages("devtools")

# Functions ------------------------
# install_version("devtools", version = "2.0.2", repos = "http://cran.at.r-project.org") # install.packages("devtools")
require("devtools")
require("roxygen2")
require("stringr")

# devtools::install_github(repo = "vertesy/CodeAndRoll2")
require('CodeAndRoll2')
require('Stringendo')
# try (source('~/GitHub/Packages/CodeAndRoll/CodeAndRoll.R'),silent= FALSE) # ONLY If Stringendo not yet exist
# try (source('~/GitHub/Packages/Rocinante/R/Rocinante.R'),silent= FALSE) # ONLY If Stringendo not yet exist



# Setup ------------------------
(PackageName = 	"DatabaseLinke.R")
package.version = "1.6.0"
setwd("~/GitHub/Packages/")

RepositoryDir = kollapse("~/GitHub/Packages/", PackageName, "/")
fname = 	PackageName
Package_FnP = 	kollapse(RepositoryDir, "R/", fname)

BackupDir = "~/GitHub/Packages/DatabaseLinke.R/Development/"
dir.create(BackupDir)

# devtools::use_package("vioplot")
DESCRIPTION <- list("Title" = "DatabaseLinke.R – Parse links to databases from your list of gene symbols"
    , "Author" = person(given = "Abel", family = "Vertesy", email = "abel.vertesy@imba.oeaw.ac.at", role =  c("aut", "cre") )
    , "Authors@R" = 'person(given = "Abel", family = "Vertesy", email = "a.vertesy@imba.oeaw.ac.at", role =  c("aut", "cre") )'
    , "Description" = "A set of functions to parse and open (search query) links
    to genomics related and other websites for R. Useful when you want to explore
    e.g.: the function of a set of differentially expressed genes."
    , "License" = "GPL-3 + file LICENSE"
    , "Version" = package.version
    , "Packaged" =  Sys.time()
    # , "Repository" =  "CRAN"
    # , "Imports" = "Stringendo, stats, utils"
    , "Imports" = "ReadWriter, stats, utils"
    # , "Suggests" = ""
    , "BugReports"= "https://github.com/vertesy/DatabaseLinke.R/issues"
)


setwd(RepositoryDir)
if ( !dir.exists(RepositoryDir) ) { create(path = RepositoryDir, description = DESCRIPTION, rstudio = TRUE)
} else {
    getwd()
    try(file.remove(c("DESCRIPTION","NAMESPACE", "DatabaseLinke.R.Rproj")))
    create_package(path = RepositoryDir, fields = DESCRIPTION, open = F)
}


# go and write fun's ------------------------------------------------------------------------
# file.edit(Package_FnP)

# Create Roxygen Skeletons ------------------------
# RoxygenReady(Package_FnP)

# replace output files ------------------------------------------------
BackupOldFile = 	kollapse(BackupDir, "Development", ".bac", print = FALSE)
AnnotatedFile = 	kollapse(BackupDir, "Development", ".annot.R", print = FALSE)
file.copy(from = Package_FnP, to = BackupOldFile, overwrite = TRUE)
# file.copy(from = AnnotatedFile, to = Package_FnP, overwrite = TRUE)

# Manual editing of descriptors ------------------------------------------------
# file.edit(Package_FnP)

# Compile a package ------------------------------------------------
setwd(RepositoryDir)
getwd()
document()
warnings()

{
  "update cff version"
  citpath <- paste0(RepositoryDir, 'CITATION.cff')
  xfun::gsub_file(file = citpath, perl = T
                  , "^version: v.+", paste0("version: v", package.version))
}

# Install your package ------------------------------------------------
# # setwd(RepositoryDir)
install(RepositoryDir)
# require("DatabaseLinke.R")
# source("https://github.com/vertesy/DatabaseLinke.R/blob/master/R/DatabaseLinke.Setup.Global.Variables.R")

# # remove.packages("DatabaseLinke.R")
# # Test your package ------------------------------------------------
# help("wplot")
# cat("\014")
# devtools::run_examples()


# Test if you can install from github ------------------------------------------------
# devtools::install_github(repo = "vertesy/DatabaseLinke.R")

# require("DatabaseLinke.R")

# Clean up if not needed anymore ------------------------------------------------
# View(installed.packages())
# remove.packages("DatabaseLinke.R")

check(RepositoryDir, cran = TRUE)
# as.package(RepositoryDir)
#
#
# # source("https://install-github.me/r-lib/desc")
# # library(desc)
# # desc$set("DatabaseLinke.R", "foo")
# # desc$get(DatabaseLinke.R)
#
#
# system("cd ~/GitHub/DatabaseLinke.R/; ls -a; open .Rbuildignore")
#
# Check package dependencies ------------------------------------------------
depFile = paste0(RepositoryDir, 'Development/Dependencies.R')

(f.deps <- NCmisc::list.functions.in.file(filename = Package_FnP))
# clipr::write_clip(f.deps)

sink(file = depFile); print(f.deps); sink()
p.deps <- gsub(x = names(f.deps), pattern = 'package:', replacement = '')
write(x = p.deps, file = depFile, append = T)
p.dep.declared <- trimws(unlist(strsplit(DESCRIPTION$Imports, ",")))
p.dep.new <- sort(union( p.deps, p.dep.declared))
# clipr::write_clip(p.dep.new)
