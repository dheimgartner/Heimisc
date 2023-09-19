## code to prepare `gemeindetypologie` dataset goes here
## https://www.agvchapp.bfs.admin.ch/de/typologies/query

devtools::load_all()

library(tidyverse)

rm(list = ls())

path <- "data-raw/gemeindetypologie.xlsx"
sheet1 <- "Daten"
sheet2 <- "CH1+CL_GDET9+2012.1"

gemeindetypologie <-
  path %>%
  readxl::read_excel(sheet = sheet1, skip = 1) %>%
  drop_na() %>%
  select(-c("Städtische / Ländliche Gebiete", "Gemeindetypologie 2012 (25 Typen)")) %>%
  rename(Code = "Gemeindetypologie 2012 (9 Typen)")

labels <-
  path %>%
  readxl::read_excel(sheet = sheet2, skip = 1)

gemeindetypologie <-
  gemeindetypologie %>%
  left_join(labels)

## add plz
gemeindetypologie <-
  gemeindetypologie %>%
  mutate(across(!all_of(c("Gemeindename", "BFS Gde-nummer")), factor))

gemeindetypologie <-
  gemeindetypologie %>%
  left_join(Heimisc::bfs_crosswalks, by = c("BFS Gde-nummer" = "GDENR")) %>%
  select(gemeindename = GDENAMK, kanton = Kanton, plz = PLZ4, code = Code, gemeindetypologie = Label)

usethis::use_data(gemeindetypologie, overwrite = TRUE)
