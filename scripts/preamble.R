# Libraries ---------------------------------------------------------------------

# Make sure the following are installed. This includes packages that are not on CRAN
# and packages that are not loaded below but instead directly references in the code
# (to avoid having to load packages into memory of which we only use a few functions).
list.of.packages <- c("remotes", "papaja", "tidyverse", "magrittr", "rlang", "assertthat", "brms", "gganimate", "fmx")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if (length(new.packages)) {
  if ("remotes" %in% new.packages) install.packages("remotes")
  if ("papaja" %in% new.packages) remotes::install_github("crsh/papaja")
  new.packages <- setdiff(new.packages, c("remotes", "papaja"))
  
  install.packages(new.packages)
}

library(knitr)
library(papaja)             # APA formatted ms

library(tidyverse)          # keeping things tidy
library(magrittr)           # pipes
library(rlang)              # quosures (in functions)
library(assertthat)         # asserts (in functions)
library(brms)

library(fmx)                # for conversion of multinomial logodds
library(gganimate)          # animated flight paths

# Functions ---------------------------------------------------------------------
source("functions.R")


# Constants ---------------------------------------------------------------------
RESET_FIGURES = F   # switch on/off whether figures that have been stored in files are regenerated
RESET_MODELS = F    # switch on/off whether models that have been stored in files are rerun

# For Stan/rstan
chains <- 4

# Get citation information
r_refs(file = "latex-stuff/r-references.bib", append = FALSE)

# plot formatting
myGplot.defaults("paper")

set.seed(42007)