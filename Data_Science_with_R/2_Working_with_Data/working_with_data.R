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

# filter a subset of rows 
temp <- filter(
    .data = temp,
    Transmission == 'Automatic'
)
head(temp)

# compute a new column
temp <- mutate(
    .data = temp,
    Consumption = Fuel.Economy * 0.425
)
head(temp)

# group by a column
temp <- group_by(
    .data = temp,
    Cylinders
)
head(temp)

# aggregate based on group
temp <- summarize(
    .data = temp,
    Avg.Consumption = mean(Consumption)
)
head(temp)

# aggregate by descending order
temp <- arrange(
    .data = temp,
    desc(Avg.Consumption)
)
head(temp)

# convert back to a data frame
efficiency <- as.data.frame(temp)
print(efficiency)

# chain all the previous methods
efficiency <- cars %>%
    select(Fuel.Economy, Cylinders, Transmission) %>%
    filter(Transmission == "Automatic") %>%
    mutate(Consumption = Fuel.Economy * 0.425) %>%
    group_by(Cylinders) %>%
    summarize(Avg.Consumption = mean(Consumption)) %>%
    arrange(desc(Avg.Consumption)) %>%
    as.data.frame()
print(efficiency)

# write to a csv file
write.csv(
    x = efficiency, 
    file = "results\\fuel_efficiency.csv",
    row.names = FALSE
)