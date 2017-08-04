# working_with_data.R
# Handling R syntax
# date: 2017-07-28
# -------------------------------------------------------

# Setting the working directory
setwd('D:\\00_Auto-formation\\Pluralsight\\Data_Science_with_R\\Working_with_Data')  # at work

# Importing the data
cars <- read.table(
    file = 'data\\Cars.txt',
    header = TRUE,
    sep = '\t',
    quote = '\"'
)

# Peek at the data
head(cars)

# loading dplyr
library(dplyr)

# select a subset of columns
temp <- select(
    .data = cars,
    Transmission,
    Cylinders,
    Fuel.Economy
)
head(temp)