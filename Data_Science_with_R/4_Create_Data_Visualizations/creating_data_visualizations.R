# creating_data_visualizations.R
# Handling R syntax
# date: 2017-09-
# -------------------------------------------------------

# Setting the working directory
setwd("D:\\00_Auto-formation\\Pluralsight\\Data_Science_with_R\\4_Create_Data_Visualizations")  # at work

# Importing the data
cars <- read.csv("data\\Cars.csv")
head(cars)

# We are gpoing to use ggplot2
library(ggplot2)

# frequency chart
ggplot(
    data = cars,
    aes(x = Transmission)) +
    geom_bar() +
    ggtitle("Count of Cars by Transmission Type") +
    xlab("Transmission Type") +
    ylab("Count of Cars")

# histogram
ggplot(
    data = cars,
    aes(x = Fuel.Economy)) +
    geom_histogram(
        bins = 10) +
    ggtitle("Distribution of Fuel Economy") +
    xlab("Fuel Economy (mpg)") +
    ylab("Count of Cars")

# density plot
ggplot(
    data = cars,
    aes(x = Fuel.Economy)) +
    geom_density() +
    ggtitle("Distribution of Fuel Economy") +
    xlab("Fuel Economy (mpg)") +
    ylab("Density")

# scatterplot
ggplot(
    data = cars,
    aes(
        x = Cylinders,
        y = Fuel.Economy)) +
    geom_point() +
    ggtitle("Fuel Economy by Cylinders") +
    xlab("Cylinders") +
    ylab("Fuel Economy (mpg)")

