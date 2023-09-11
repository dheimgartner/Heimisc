#'@export
init_labels <- function(data, write = NULL) {
  labels <-
    purrr::map(data, function(x) {
      from = sort(unique(x))
      data.frame(from = from, to = NA)
    })

  if (!is.null(write)) {
    wb <- xlsx::createWorkbook()
    purrr::walk2(labels, names(labels), function(x, y) {
      sh <- xlsx::createSheet(wb, sheetName = y)
      xlsx::addDataFrame(x, sh, row.names = FALSE)
    })
    xlsx::saveWorkbook(wb, file = write)
  }

  invisible(labels)
}

#'@export
label_df <- function(df, labels, ...) {
  df_ <- df
  labelr::labels$restore()
  labelr::labels$set(labels)

  labelled <- labelr::label_df(df_, ...)
  return(labelled)
}

#'@export
label_var <- function(x, variable, labels, ...) {
  labelr::labels$restore()
  labelr::labels$set(labels)

  labelled <- labelr::label_var(x, variable = variable, ...)
  return(labelled)
}

#'@export
re_label_df <- function(df, labels, ...) {
  df_ <- df
  labelr::labels$restore()

  re_labels <-
    purrr::map(labels, function(x) {
      df <- x
      df$from <- x$to
      df$to <- x$from
      df
    })

  labelr::labels$set(re_labels)

  labelled <- labelr::label_df(df_, ...)
  return(labelled)
}

#'@export
re_label_var <- function(var, variable, labels, ...) {
  labelr::labels$restore()

  re_labels <-
    purrr::map(labels, function(x) {
      df_lab <- x
      df_lab$from <- x$to
      df_lab$to <- x$from
      return(df_lab)
    })

  labelr::labels$set(re_labels)
  labelled <- labelr::label_var(var, variable = var_name, ...)
  return(labelled)
}
