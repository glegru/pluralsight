# creating_descriptive_statistics.R
# Handling R syntax
# date: 2017-09-
# -------------------------------------------------------

# Setting the working directory
setwd('D:\\00_Auto-formation\\Pluralsight\\Data_Science_with_R\\3_Creating_Descriptive_Statistics')  # at work

# Importing the data
cars <- read.table(
    file = 'data\\Cars.txt',
    header = TRUE,
    sep = '\t',
    quote = '\"'
)
head(cars)

# Frequency table
table(cars$Transmission)

# Min value
min(cars$Fuel.Economy)

# max value
max(cars$Fuel.Economy)

# Mean value
mean(cars$Fuel.Economy)

# Median value
median(cars$Fuel.Economy)

# quartiles
quantile(cars$Fuel.Economy)

# standard deviation
sd(cars$Fuel.Economy)

# total sum
sum(cars$Fuel.Economy)

# correlation 
cor(
    x = cars$Cylinders,
    y = cars$Fuel.Economy
)

# summarize the entire table
summary(cars)