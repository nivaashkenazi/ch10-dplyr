# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
mutate(flights, air_time_gain = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, -air_time_gain)

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- mutate(flights, air_time_gain = arr_delay - dep_delay) %>%
          arrange(-air_time_gain)

# Make a histogram of the amount of gain using the `hist` command
hist(flights$air_time_gain)

# On average, did flights gain or lose time?
# flights lost time on average

# Create a data.frame that is of flights headed to seatac ('SEA'), 
SEA.flights <- filter(flights, dest == 'SEA')

# On average, did flights to seatac gain or loose time?
hist(SEA.flights$air_time_gain)
# on average, seatac flights also lost air time

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see chapter 11 section on standard evaluation
SpecifyInfo <- function(in.origin, in.dest, in.column) {
  output.frame <- filter(flights, dest == in.dest, origin == in.origin) %>%
                  select(in.column)
  return(output.frame)
}

# Retireve the air_time column for flights from JFK to SEA
SpecifyInfo('JFK', 'SEA', 'air_time')

# What was the average air time of those flights (in hours)?  
mean()

# What was the min/max average air time for the JFK to SEA flights?
