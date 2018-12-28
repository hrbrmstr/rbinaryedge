#' Query DNS database - IP
#'
#' Query dns database to get list dns information for a IP
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#'
#' @param ip target ip
#' @param page page number of query
#' @param auth_token authentication token for the API
#' @export


dnsipQuery <- function(ip,page, auth_token) {

  content_query <- GET(paste0("https://api.binaryedge.io/v2/query/domains/ip/",ip,"?page=",page),add_headers("X-Key" = auth_token))
  raise <- content(content_query, as="text", encoding = 'UTF-8')

  fromJSON(raise, flatten = TRUE) %>%
    as.data.table() %>%
    #unnest() %>%
    replace(.=="NULL", NA)

}
