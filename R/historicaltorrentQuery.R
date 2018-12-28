#' Query historical torrent
#'
#' Query historical torrent  endpoint to extract information on IP
#'
#' @import httr
#' @import dplyr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#' @importFrom tidyr unnest
#'
#' @param ip target IP address
#' @param auth_token authentication token for the API
#' @export


historicaltorrentQuery <- function(ip, auth_token) {

  content_query <- GET(paste0("https://api.binaryedge.io/v2/query/torrent/historical/",ip),add_headers("X-Key" = auth_token))
  raise <- content(content_query, as="text", encoding = 'UTF-8')

  fromJSON(raise, flatten = TRUE) %>%
    as.data.table() %>%
    # unnest() %>%
    replace(.=="NULL", NA)

}
