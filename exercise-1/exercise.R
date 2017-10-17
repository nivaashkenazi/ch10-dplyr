# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library('fueleconomy')

# You should have have access to the `vehicles` data.frame
vehicles <- data.frame(fueleconomy::vehicles, stringsAsFactors = FALSE)
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles.97 <- vehicles[vehicles$year == 1997, ]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
is.unique <- lengh(unique(vehicles.97$year)) == 1 # returns TRUE

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.drives <- vehicles[vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20, ]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.highway.milage <- two.wheel.drives[two.wheel.drives$hwy == min(two.wheel.drives$hwy), ]$id

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the2 most hwy miles/gallon of vehicles of that make in that year
BestChoice <- function(year, make) {
  new.frame <- vehicles[vehicles$year == year & vehicles$make == make, ]
  return(new.frame[new.frame$hwy == max(new.frame$hwy), ])
}

# What was the most efficient honda model of 1995?
best.honda <- BestChoice(1995, 'Honda')$model

