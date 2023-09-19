## code to prepare `bfs_crosswalks` dataset goes here
## https://www.bfs.admin.ch/asset/de/do-t-09.02-gwr-37

library(tidyverse)

rm(list = ls())

path <- "data-raw/bfs_crosswalks.xlsx"
sheet <- "PLZ4"

bfs_crosswalks <-
  path %>%
  readxl::read_excel(sheet = sheet, col_names = TRUE) %>%
  drop_na()

bfs_crosswalks <-
  bfs_crosswalks %>%
  mutate(across(!all_of(c("PLZ4", "%_IN_GDE", "GDENR")), factor))

max_perc <-
  bfs_crosswalks %>%
  group_by(PLZ4) %>%
  summarise(max_perc = max(`%_IN_GDE`, na.rm = TRUE)) %>%
  ungroup()

bfs_crosswalks <-
  max_perc %>%
  left_join(bfs_crosswalks, by = c("PLZ4", "max_perc" = "%_IN_GDE")) %>%
  select(PLZ4, everything(), -max_perc) %>%
  group_by(PLZ4) %>%
  slice(1) %>%
  ungroup()

usethis::use_data(bfs_crosswalks, overwrite = TRUE)
