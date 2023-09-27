## code to prepare `labels` dataset goes here

library(tidyverse)
library(readxl)

labels <- list()

# Gemeindetypologie & Urbanisierungsgrad
path <- "./data-raw/typo_urba/labels.xlsx"

sheets <- readxl::excel_sheets(path)
labels_ <-
  map(sheets, function(s) {
    lab <- readxl::read_xlsx(path, sheet = s)
    lab <-
      lab %>%
      select(from, to, filter) %>%
      arrange(filter, to)
  })

names(labels_) <- sheets

labels$typo_urba <- labels_

usethis::use_data(labels, overwrite = TRUE)
