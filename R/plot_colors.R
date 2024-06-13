#' Plot color vector
#'
#' @param colors vector of colors
#' @export
plot_colors <- function(colors, pch = 16, cex = 10) {
  plot(1:length(colors), rep(1, length(colors)),
       pch = pch, col = colors, cex = cex, axes = FALSE, xlab = "", ylab = "")
  axis(1, at = 1:length(colors), labels = colors, lwd = 0)
}
