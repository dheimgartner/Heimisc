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
my_theme <- function (...) {
  my_theme <- ggplot2::theme(
    plot.title = ggplot2::element_text(face = "bold",
                                       hjust = 0,
                                       size = ggplot2::rel(1.5),
                                       margin = ggplot2::margin(0, 0, 4, 0)),
    panel.background = ggplot2::element_rect(fill = "white", color = "black", linewidth = 0.9),
    legend.box.background = ggplot2::element_rect(color = "black", linewidth = 0.9),
    legend.key = ggplot2::element_blank(),
    panel.grid = ggplot2::element_blank(),
    strip.background = ggplot2::element_blank(),
    axis.ticks.length = unit(-0.15, "cm"),
    axis.text.x = ggplot2::element_text(color = "black", margin = ggplot2::margin(4, 0, 0, 0)),
    axis.text.y = ggplot2::element_text(color = "black", margin = ggplot2::margin(0, 4, 0, 0)),
    axis.title.x = ggplot2::element_text(margin = ggplot2::margin(8, 0, 0, 0)),
    axis.title.y = ggplot2::element_text(margin = ggplot2::margin(0, 8, 0, 0), angle = 90),
    ...,
    complete = TRUE)
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
add_grid <- function(color = "grey", linetype = "solid", linewidth = 0.2, ...) {
  grid <-
    ggplot2::theme(
      panel.grid.major = ggplot2::element_line(color = color,
                                               linewidth = linewidth,
                                               linetype = linetype,
                                               ...),
    )
  grid
}

#' Place legend inside plot area (and scale)
#'
#' @export
legend_inside <- function(position = c(1, 1), justification = c(1.1, 1.1),
                          scale_title = 1, scale_text = 1, scale_key = 1, ...) {
  ggplot2::theme(legend.position = "inside",
                 legend.position.inside = position,
                 legend.justification = justification,
                 legend.title = ggplot2::element_text(size = ggplot2::rel(scale_title)),
                 legend.text = ggplot2::element_text(size = ggplot2::rel(scale_text)),
                 legend.key.size = ggplot2::unit(scale_key, "pt"),
                 ...,
                 complete = FALSE)
}
