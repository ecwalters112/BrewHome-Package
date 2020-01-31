#' Map Breweries & Home Info
#'
#' This function creates an interactive leaflet map of the different brewery locations,
#' which includes popups with informaiton on the breweries and home sale and rental
#' information around each brewery location.
#'
#' The function does not have any parameters, it will plot the interactive map
#' when the function is called.
#'
#'
#' @keywords Brewery locations state home sales rentals
#' @export
#' @examples
#' plot_breweryhomemap()
#'


plot_breweryhomemap <- function() {

  library(leaflet)
  library(dplyr)

  content <- paste("Brewery:",brewery_sales_rentals$Brewery,"<br/>",
                   "Brewery Type:",brewery_sales_rentals$`Brewery Type`,"<br/>",
                   "Description:",brewery_sales_rentals$Description,"<br/>",
                   "Website:",brewery_sales_rentals$Website,"<br/>",
                   "Phone:",brewery_sales_rentals$Phone,"<br/>",
                   "Address:",brewery_sales_rentals$Address,"<br/>",
                   "Average Price of Homes Nearby:",brewery_sales_rentals$`Average Listing Price`,"<br/>",
                   "Typical Rent Nearby:",brewery_sales_rentals$`Typical Rent Price`,"<br/>")

  leaflet(data = brewery_sales_rentals) %>%
    addTiles() %>%
    addMarkers(~`Brewery Longitude`, ~`Brewery Latitude`, popup = content, label = ~as.character(Brewery))


}

