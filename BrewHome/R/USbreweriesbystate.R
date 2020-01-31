#' Breweries by State
#'
#' This function makes it easy to filter out breweries and their location information
#' by state using the BreweryBP sandbox API data..
#'
#' The function asks the user to provide their BreweryBP API key
#' and the state they wish to search, and then it will return a small
#' dataframe of brewery location information by state.
#'
#' @param key BreweryBP API key
#' @param state A state in the U.S
#' @keywords Brewery locations API base_url key_preface key df state
#' @export
#' @examples
#' get_brewery_bystate(state = "", key = "BreweryDB_API")
#'

get_brewery_bystate <- function(state, key) {

  library(httr)
  library(dplyr)

  base_url <- "https://sandbox-api.brewerydb.com/v2/locations/?region=region/?key=key"

  query_params <- list(
    "region"= state,
    "key"=Sys.getenv(key))

  request_base <- GET(base_url, query = query_params)

  char_base <- rawToChar(request_base$content)

  df_base <- jsonlite::fromJSON(char_base, simplifyDataFrame = TRUE)

  df_base1 <- as.data.frame(df_base)

  df_base1 <- do.call(data.frame, df_base1)

  names(df_base1) <- gsub("data\\.", "", names(df_base1))

  df_base1 <- df_base1[ -c(1:3, 0) ]

  df_base1 <- df_base1 %>%
    rename("postal_code" = postalCode)

  df_base1<- df_base1%>%
    select(name,streetAddress, locality, region, postal_code, latitude, longitude, openToPublic, locationTypeDisplay, brewery.name, website, phone)

  df_base1

}
