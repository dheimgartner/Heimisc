#' @export
get_cran <- function(local_cran = "_CRAN") {
  home <- Sys.getenv("HOME")
  return(paste("file:", home, local_cran, sep = "/"))
}

#' @export
install <- function(pkg, ...) {
  install.packages(pkg, repos = get_cran(), ...)
}

#' @export
uninstall <- function(pkg, ...) {
  remove.packages(pkg, ...)
}
