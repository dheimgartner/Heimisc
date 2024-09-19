#' Keep it stupid simple
#'
#' https://github.com/rileytwo/kiss
#'
#' @export
kiss_rstudio_theme <- function()
{
  theme <- "https://raw.githubusercontent.com/rileytwo/kiss/refs/heads/main/rstudio/kiss.rstheme"
  rstudioapi::addTheme(theme,
                       apply = TRUE,
                       force = TRUE)
}
