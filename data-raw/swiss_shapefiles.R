## code to prepare `swiss_shapefiles` dataset goes here

library(tidyverse)
library(bfsMaps)

"Hm... Better to download shapefiles yourself..."

?bfsMaps::DownloadBfSMaps  # see api link...

options(bfsMaps.base = "~/MapData/2022_GEOM_TK")

bfsMaps::DownloadBfSMaps()

path_maps <- system.file("extdata/maps.csv", package = "bfsMaps")
maps <- readr::read_csv2(path_maps)

maps

get_map <- function(name = NULL) {
  bfsMaps::GetMap(name)
}

avbl <-
  maps %>%
  drop_na() %>%
  pull(name_x)

all_maps <-
  avbl %>%
  map(function(x) {
    tryCatch(get_map(x), error = function(e) NA)
  })

names(all_maps) <- avbl

all_maps <- all_maps[!is.na(all_maps)]

ggplot() +
  geom_sf(data = see1, fill = "lightblue") +
  geom_sf(data = see2, fill = "lightblue") +
  theme_void()

usethis::use_data(swiss_shapefiles, overwrite = TRUE)
