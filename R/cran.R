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

#' Execute `write_PACKAGES`
#'
#' @export
write_cran <- function() {
  contrib <- paste(get_cran(), "src", "contrib/", sep = "/")
  contrib <- gsub(pattern = "^file:/", replacement = "", x = contrib)
  tools::write_PACKAGES(contrib)
  cli::cli({
    cli::cli_h1((cli::col_green("Executed `tools::write_PACKAGES(contrib)`")))
    cli::cli_text(contrib)
  })
}


#' @export
update_cran <- function(pkg_path, ...) {
  msg <- list()

  tmp <- tempdir()
  built <- devtools::build(pkg = pkg_path, path = tmp, ...)

  contrib <- paste(get_cran(), "src", "contrib/", sep = "/")
  contrib <- gsub(pattern = "^file:/", replacement = "", x = contrib)

  success <- file.copy(built, contrib, overwrite = TRUE)
  if (!success) {
    msg_ = paste0("Copying to ", contrib, " failed...")
    msg <- append(msg, msg_)
  }

  tools::write_PACKAGES(contrib)

  cli::cli({
    cli::cli_h1(cli::col_green("Updated package in local CRAN"))
    cli::cli_text(pkg_path)
    if (success) {
      cli::cli_alert_success("Yay")
    } else {
      cli::cli_alert_danger("Failure")
      purrr::walk(msg, function(x) {
        cli::cli_alert_warning(x)
      })
    }
  })

  invisible(success)
}
