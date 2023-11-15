get_cran <- function(local_cran = "_CRAN") {
  home <- Sys.getenv("HOME")
  return(paste("file:", home, local_cran, sep = "/"))
}

install <- function(pkg, ...) {
  install.packages(pkg, repos = get_cran(), ...)
}

uninstall <- function(pkg, ...) {
  remove.packages(pkg, ...)
}
