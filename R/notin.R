#' Not in
#'
#' Inversion of `%in%`
#'
#' @param x vector
#' @param y vector
#'
#' @return logical
#' @export
#'
#' @examples
#' x <- c(1, 2, 3)
#' y <- c(2, 3, 4)
#' x %in% y
#' x %notin% y
`%notin%` <- function(x, y) {
  !(x %in% y)
}
