#' Brewery & Home Info
#'
#' This function makes it easy to search home sales and rental
#' valuations by breweries in different states.
#'
#' The function asks the user to provide a U.S state that they would
#' like to search for information on home sale and rental valuations
#' around breweries.
#'
#'
#' @param state A state in the U.S
#' @keywords Brewery locations state home sales rentals
#' @export
#' @examples
#' get_breweryhomeinfo(state = "Colorado")
#'


get_breweryhomeinfo <- function(state) {

  library(dplyr)

  data <- brewery_sales_rentals %>%
    select(Brewery, `Brewery Type`, Address, City, Zipcode, `Average Listing Price`, `Typical Rent Price`, State) %>%
    filter(State == state)


  states_notincluded <- c("Alabama", "Alaska", "Arizona", "Arkansas", "Connecticut", "Delaware", "Hawaii", "Idaho",
                          "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts",
                          "Minnesota", "Mississippi", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersery",
                          "New Mexico", "North Dakota", "Oklahoma", "Oregon", "Rhode Island", "South Dakota", "Utah",
                          "Vermont", "Washington", "West Virginia", "Wyoming", "alabama", "alaska", "arizona", "arkansas",
                          "connecticut", "delaware", "hawaii", "idaho", "indiana", "iowa", "kansas", "kentucky", "louisiana",
                          "maine", "maryland", "massachusetts", "minnesota", "mississippi", "montana", "nebraska", "nevada",
                          "new hampshire", "new jersery", "new mexico", "north dakota", "oklahoma", "oregon", "rhode island",
                          "south dakota", "utah", "vermont", "washington", "west virginia", "wyoming")

  state_lower <- c("new york", "pennsylvania", "virginia", "north carolina", "south carolina", "georgia", "florida", "tennessee",
                   "ohio", "michigan", "wisconsin", "illinois", "missouri", "texas", "colorado", "california")

  if ( any(state %in% states_notincluded)) stop ("Due to the small size of the dataset, this state does not have any available information.
                                                 Please choose a different U.S state from the following list: New York, Pennsylvania,
                                                 Virginia, North Carolina, South Carolina, Georgia, Florida, Tennessee, Ohio, Mchigan,
                                                 Wisconsin, Illinois, Missouri, Texas, Colorado, California")

  if ( any(state %in% state_lower)) stop ("States should always be capitalized!! Capitalize and re-run the function!")


  return(data)

}
