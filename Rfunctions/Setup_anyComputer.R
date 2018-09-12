
### ANY COMPUTER SETUP ###

#Load libraries
require(data.table)
require(stringr)
require(reshape2)
require(ggplot2)
require(maptools)
#require(rdrop2)

# set a CRAN mirror
local({r <- getOption("repos")
r["CRAN"] <- "http://my.local.cran"
options(repos=r)})

# Miscellaneous options settings
options(stringsAsFactors=FALSE)

options(max.print=100)

options(scipen=10)