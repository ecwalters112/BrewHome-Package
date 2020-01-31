## ---- echo=FALSE, results='hide', message=FALSE--------------------------
suppressMessages(library(here))

here("images", "Brewhomeimage.png")

## ---- echo=FALSE, out.width = "100%"-------------------------------------

knitr::include_graphics("images/Brewhomeimage.png")

## ---- echo=FALSE, results='hide', message=FALSE--------------------------
suppressMessages(library(here))

here("images", "brewerydata.png")

## ---- echo=FALSE,  out.width = "100%"------------------------------------
knitr::include_graphics("images/brewerydata.png")

## ----eval=FALSE----------------------------------------------------------
#  library(BrewHome)
#  get_brewery()

## ----eval=FALSE----------------------------------------------------------
#  library(BrewHome)
#  get_brewery_bystate()

## ----eval=FALSE----------------------------------------------------------
#  library(BrewHome)
#  get_breweryhomeinfo()

## ----eval=FALSE----------------------------------------------------------
#  BrewHome::plot_breweryhomemap()

## ----eval=FALSE----------------------------------------------------------
#  library(BrewHome)
#  plot_breweryhomemap()

## ---- echo=FALSE, results='hide', message=FALSE--------------------------

suppressMessages(library(dplyr))

load(file = "~/Desktop/BrewHome/data/brewery_sales_rentals.rda")

## ------------------------------------------------------------------------
Avg_brew_homeprice <- brewery_sales_rentals %>%
  group_by(Brewery) %>%
  summarise(mean = mean(`Average Listing Price`))

Avg_brew_homeprice 

## ------------------------------------------------------------------------
Avg_brew_rentalprice <- brewery_sales_rentals %>%
  group_by(Brewery) %>%
  summarise(mean = mean(`Typical Rent Price`))

Avg_brew_rentalprice 

## ------------------------------------------------------------------------
Avg_brewtype_homeprice <- brewery_sales_rentals %>%
  group_by(`Brewery Type`) %>%
  summarise(mean = mean(`Average Listing Price`))

Avg_brewtype_homeprice 

