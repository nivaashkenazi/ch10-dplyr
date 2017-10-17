# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# Install (if you haven't already) and load the `dplyr`package


# You should have have access to the `vehicles` data.frame
vehicles <- data.frame(fueleconomy::vehicles, stringsAsFactors = FALSE)
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles.97 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
is.unique <- lengh(unique(vehicles.97$year)) #== 1

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.drives <- filter(vehicles, drive == 'S-Wheel Drive', cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.highway.milage <- filter(two.wheel.drives, hwy == min(hwy))$id

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
BestChoice <- function(in.year, in.make) {
  new.frame <- filter(vehicles, year == in.year, in.make == make)
  return(filter(new.frame, hwy == max(hwy)))
}

# What was the most efficient honda model of 1995?
best.honda <- BestChoice(1995, 'Honda')$model

