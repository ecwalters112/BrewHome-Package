#' Breweries in U.S
#'
#' This function makes it easy to create a dataframe of different breweries
#' in the U.S and their location inforamtion using the BreweryBP sandbox API data.
#'
#' The function asks the user to provide their BreweryBP API key, and then it will return a small dataframe of brewery location information.
#'
#' @param key BreweryBP API key
#' @keywords Brewery locations API base_url key_preface key df
#' @export
#' @examples
#' get_brewery(key = "BreweryDB_API")

get_brewery <- function(key) {

  library(httr)

  base_url <- "https://sandbox-api.brewerydb.com/v2"

  key_preface <- "/?key="

  key <- Sys.getenv(key)

  df <- jsonlite::fromJSON(paste0(base_url, "/locations", key_preface, key))

  df

}
