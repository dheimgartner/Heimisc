#' @export
drop_rall_na <- function(df) {
    nc <- ncol(df)
    flag <- is.na(df)
    keep <- apply(flag, 1, function(x) sum(x) < nc)
    out <- df[keep, ]
    return(out)
}
