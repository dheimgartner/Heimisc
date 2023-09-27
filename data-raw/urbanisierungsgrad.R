## code to prepare `urbanisierungsgrad` dataset goes here
## https://www.agvchapp.bfs.admin.ch/de/typologies/query

devtools::load_all()

library(tidyverse)

rm(list = ls())

path <- "data-raw/typo_urba/urbanisierungsgrad.xlsx"
sheet1 <- "Daten"
sheet2 <- "CH1+CL_DEGURB+2017.1"

urbanisierungsgrad <-
  path %>%
  readxl::read_excel(sheet = sheet1, skip = 1) %>%
  drop_na() %>%
  rename(Code = "Urbanisierungsgrad 2011 (DEGURBA) - eurostat")

labels <-
  path %>%
  readxl::read_excel(sheet = sheet2, skip = 1)

urbanisierungsgrad <-
  urbanisierungsgrad %>%
  left_join(labels)

## add plz
urbanisierungsgrad <-
  urbanisierungsgrad %>%
  mutate(across(!all_of(c("Gemeindename", "BFS Gde-nummer")), factor))

urbanisierungsgrad <-
  urbanisierungsgrad %>%
  left_join(Heimisc::bfs_crosswalks, by = c("BFS Gde-nummer" = "GDENR")) %>%
  select(gemeindename = GDENAMK, kanton = Kanton, plz = PLZ4, code = Code, urbanisierungsgrad = Label)

usethis::use_data(urbanisierungsgrad, overwrite = TRUE)
