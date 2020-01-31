#' Brewery Location and Home/Rental Information
#'
#' This data provides a very small sample of different breweries in the U.S
#' with some home listing information and typical rental information in the
#' same areas as breweries. The home/rental information is all for the month
#' of October, 2019.
#'
#' @format The brewery sale rentals data frame contains 31 observations and 18 variables.
#' \describe{
#'   \item{Zipcode}{Zipode of breweries and homes/rentals}
#'   \item{Address}{Address of breweries}
#'   \item{City}{City of breweries and homes/rentals}
#'   \item{State}{State of breweries and homes/rentals}
#'   \item{Brewery Type}{Type of brewery}
#'   \item{Brewery}{Brewery name}
#'   \item{Description}{Description of brewery}
#'   \item{Year Established}{Year the brewery was established}
#'   \item{Homes for Sale}{Number of homes for sale by zipcode}
#'   \item{Average Listing Price}{Average listing price of homes by zipcode}
#'   \item{Price Reduced Count}{Number if homes that reduced sale price}
#'   \item{Median Day on Market}{Median days a home is listed on the market}
#'   \item{Typical Rent Price}{Typical rent price by zipcode}
#'   \item{Phone}{Phone number of brewery}
#'   \item{Website}{Website of brewery}
#'   \item{Brewery Latitude}{Latitude of brewery location}
#'   \item{Brewery Longitude}{Longitude of brewery location}
#'   \item{Open to Public}{If the brewery is open to the public}
#' }
#'@source \url{https://www.brewerydb.com/developers/docs}
#'@source \url{https://www.zillow.com/research/data/}
#'@source \url{https://www.realtor.com/research/data/}
"brewery_sales_rentals"

