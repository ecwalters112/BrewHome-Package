## ---- eval=FALSE---------------------------------------------------------
#  
#  url <- "https://sandbox-api.brewerydb.com/v2/locations/?order=order/?key=key"
#  
#  query_params <- list(
#    "order" = "breweryName",
#    "key"=Sys.getenv("BreweryDB_API"))
#  
#  
#  request <- GET(url, query = query_params)
#  
#  str(request, max.level = 1)
#  
#  char <- rawToChar(request$content)
#  
#  df <- jsonlite::fromJSON(char, simplifyDataFrame = TRUE)
#  
#  df1 <- as.data.frame(df)
#  
#  df1 <- do.call(data.frame, df1) #This helps include columns that were categorized as dataframes within the dataframe. Especially the Brewery name column, which is needed for this dataset.
#  
#  
#  df1 <- df1 %>%
#    rename("postal_code" = data.postalCode) #This helps with merging the datasets by zipcode later.
#  
#  names(df1) <- gsub("data\\.", "", names(df1)) #Removes (.) punctuation from the column names.
#  
#  df1 <- df1[ -c(1:3,66:80) ]
#  
#  df1 <- df1 %>%
#    select(name,streetAddress, locality, region, postal_code, latitude, longitude, openToPublic, locationTypeDisplay, brewery.name, brewery.description, brewery.established, website, phone) # Only selecting columns that are needed for the particular function.
#  

## ---- eval=FALSE---------------------------------------------------------
#  home <- read.csv(file="RDC_Inventory_Core_Metrics_Zip_Current.csv")
#  
#  home_organized <- home %>%
#    select(postal_code, zip_name, active_listing_count, average_listing_price, total_listing_count, price_reduced_count, median_days_on_market) #selecting certain variables I would like to include.
#  
#  
#  home_brewery <- merge(df1, home_organized , by = "postal_code") #merging this data with the brewery data (df1) by zipcode.

## ---- eval=FALSE---------------------------------------------------------
#  zillow <- read.csv(file="Zip_Zri_AllHomesPlusMultifamily_Summary.csv")

## ---- eval=FALSE---------------------------------------------------------
#  zillow <- zillow %>%
#    select(RegionName, Zri) %>%
#    rename("postal_code" = RegionName)

## ---- eval=FALSE---------------------------------------------------------
#  brewery_sales_rentals <- merge(home_brewery, zillow, by = "postal_code")

## ---- eval=FALSE---------------------------------------------------------
#  brewery_sales_rentals <- brewery_sales_rentals %>%
#    rename("Zipcode" = postal_code) %>%
#    rename("Address"= streetAddress) %>%
#    rename("City" = locality) %>%
#    rename("State" = region) %>%
#    rename("Brewery Type" = locationTypeDisplay) %>%
#    rename("Brewery" = brewery.name) %>%
#    rename("Description" = brewery.description) %>%
#    rename("Year Established" = brewery.established) %>%
#    rename("Homes for Sale" = active_listing_count) %>%
#    rename("Average Listing Price" = average_listing_price) %>%
#    rename("Price Reduced Count" = price_reduced_count) %>%
#    rename("Median Day on Market" = median_days_on_market) %>%
#    rename("Typical Rent Price" = Zri) %>%
#    rename("Phone" = phone) %>%
#    rename("Website" = website) %>%
#    rename("Brewery Latitude" = latitude) %>%
#    rename("Brewery Longitude" = longitude) %>%
#    rename("Open to Public" = openToPublic)

## ---- eval=FALSE---------------------------------------------------------
#  brewery_sales_rentals <- brewery_sales_rentals %>%
#    select(Zipcode, Address, City, State, `Brewery Type`, Brewery, Description, `Year Established`, `Homes for Sale`, `Average Listing Price`, `Price Reduced Count`, `Median Day on Market`, `Typical Rent Price`, Phone, Website, `Brewery Latitude`, `Brewery Longitude`, `Open to Public`)

## ---- eval=FALSE---------------------------------------------------------
#  
#  save(brewery_sales_rentals, file = "brewery_sales_rentals.rda")
#  

