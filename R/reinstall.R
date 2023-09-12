#' @export
reinstall <- function() {
    remove.packages("Heimisc")
    devtools::install_github("dheimgartner/Heimisc")
}
