#' Character vector without quotes
#' nomen est omeni
#'
#'@param ... symbols to be passed to character
#'
#'@return character vector
#'
#'@export
cc <- function(...)
{
  elems <- rlang::ensyms(...)
  purrr::map(elems, rlang::as_string) %>%
    as.vector(mode = "character")
}
