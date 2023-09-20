#' @export
google_geocode <- function(street, street_nr, zip, country, api_key = NULL) {
    if (is.null(api_key)) {
        api_key <- Sys.getenv("GOOGLE_API_KEY")
        assertthat::assert_that(stringr::str_count(api_key) > 0,
            msg = "No Google api key found..."
        )
    }
    base_url <- "https://maps.googleapis.com/maps/api/geocode/json"
    query <- paste(street, street_nr, zip, country, sep = ", ")
    api_url <- sprintf(
        "%s?address=%s&key=%s",
        base_url, utils::URLencode(query), api_key
    )
    response <- httr::GET(api_url)

    return(response)
}

#' @export
google_reverse_geocode <- function(lon, lat, api_key = NULL) {
    if (is.null(api_key)) {
        api_key <- Sys.getenv("GOOGLE_API_KEY")
        assertthat::assert_that(stringr::str_count(api_key) > 0,
            msg = "No Google api key found..."
        )
    }
    base_url <- "https://maps.googleapis.com/maps/api/geocode/json"
    query <- paste0("latlng=", lat, ",", lon, "&key=", api_key)
    api_url <- sprintf("%s?%s", base_url, utils::URLencode(query))
    response <<- httr::GET(api_url)

    return(response)
}
