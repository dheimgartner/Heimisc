#' Download and Read Swiss Shapefiles
#'
#' @param url from data.geo.admin.ch.
#' @param readr function to read shapefiles.
#' @param ... additional arguments passed to `readr` func.
#'
#' @return List of shapefiles.
#' @export
#'
#' @seealso [https://data.geo.admin.ch/]
#'
#' @examples
#' swiss_shapefiels(url = "https://data.geo.admin.ch/ch.swisstopo.swissboundaries3d/swissboundaries3d_2024-01/swissboundaries3d_2024-01_2056_5728.shp.zip")
swiss_shapefiles <- function(url, readr = sf::st_read, ...) {
  tmp_file <- tempfile(fileext = ".zip")
  download.file(url, tmp_file, mode = "wb")
  tmp_dir <- tempdir()
  unzip(tmp_file, exdir = tmp_dir)
  files <- list.files(tmp_dir)
  files <- files[grepl("shp$", files)]
  file_paths <- paste(tmp_dir, files, sep = "/")
  shape_files <- lapply(file_paths, function(x) readr(x, ...))
  nm <-  tolower(sub(".*_([A-Z]+)\\.shp$", "\\1", files))
  names(shape_files) <- nm
  shape_files
}
