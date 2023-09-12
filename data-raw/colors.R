## code to prepare `colors` dataset goes here

colors <- list()

matplotlib <- c(
  blue = "#1F77B4",
  orange = "#FF7F0E",
  green = "#2CA02C",
  red = "#D62728",
  purple = "#9467BD",
  brown = "#8C564B",
  pink = "#E377C2",
  gray = "#7F7F7F"
)

colors$matplotlib <- matplotlib

usethis::use_data(colors, overwrite = TRUE)
