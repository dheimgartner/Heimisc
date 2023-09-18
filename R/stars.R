#' @export
stars <- function(pval_vec) {
  stars <- dplyr::case_when(pval_vec < 0.001 ~ "***",
                            pval_vec < 0.01 ~ "**",
                            pval_vec < 0.05 ~ "*",
                            is.na(pval_vec) ~ "-",
                            TRUE ~ "")
  return(stars)
}
