#' @export
my_theme <- function(...) {
  my_theme <-
    theme(
      #text = element_text(family = ""),
      panel.background = element_rect(fill = "white", color = "black", linewidth = 1),
      #legend.position = c(0.1, 0.85),
      legend.box.background = element_rect(color = "grey", linewidth = 1),
      legend.key = element_blank(),
      panel.grid.major = element_line(color = "grey", linewidth = 0.4),
      panel.grid.minor = element_blank(),
      plot.title = element_text(hjust = 0.5),
      strip.background = element_blank(),
      ...
    )
  my_theme
}
