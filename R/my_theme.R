#' My ggplot theme
#'
#' Minimal theme inspired by base R plot.
#'
#' @export
#' @examples
#' colors <- RColorBrewer::brewer.pal(n = 11, name = "BrBG")
#'
#' iris %>%
#'   ggplot(aes(x = Sepal.Length, y = Sepal.Width, shape = Species, col = Species)) +
#'   geom_point(size = 2) +
#'   labs(title = "The famous iris data",
#'        subtitle = "Have you ever seen it?") +
#'   scale_color_manual(values = colors[c(8, 3, 10)]) +
#'   my_theme() +
#'   add_grid()
my_theme <- function(...) {
  my_theme <-
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold", hjust = 0, size = ggplot2::rel(1.5),
                                         margin = ggplot2::margin(0, 0, 4, 0)),
      panel.background = ggplot2::element_rect(fill = "white", color = "black", linewidth = 1),
      legend.box.background = ggplot2::element_rect(color = "white", linewidth = 1),
      legend.key = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      strip.background = ggplot2::element_blank(),
      ...,
      complete = TRUE
    )
  my_theme
}

#' Add gridlines
#'
#' @export
#' @examples
#' colors <- RColorBrewer::brewer.pal(n = 11, name = "BrBG")
#'
#' iris %>%
#'   ggplot(aes(x = Sepal.Length, y = Sepal.Width, shape = Species, col = Species)) +
#'   geom_point(size = 2) +
#'   labs(title = "The famous iris data",
#'        subtitle = "Have you ever seen it?") +
#'   scale_color_manual(values = colors[c(8, 3, 10)]) +
#'   my_theme() +
#'   add_grid()
add_grid <- function(color = "grey", linetype = "dotted", linewidth = 0.5, ...) {
  grid <-
    theme(
      panel.grid.major = ggplot2::element_line(color = color,
                                               linewidth = linewidth,
                                               linetype = linetype,
                                               ...),
    )
  grid
}
