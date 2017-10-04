# handling_big_data.R
# Handling ff and biglm librairies (big data librairies)
# date: 2017-09-14

# Needed : install.packages("ff")
#          install.packages("biglm")
# -------------------------------------------------------

# Setting the working directory
setwd("D:\\00_Auto-formation\\Pluralsight\\Data_Science_with_R\\6_Handling_Big_Data")  # at work

# Importing the data
iris <- read.csv("data\\Iris.csv")
head(iris)

#------------------------------------------------------------
#                                                    USING FF
#------------------------------------------------------------
library(ff)

# create a ffdf object from Iris.csv
irisff <- read.table.ffdf(
    file = "data\\Iris.csv",
    FUN = "read.csv"
)

# goofing around with ffdf functionalities
class(irisff)
names(irisff)
irisff[1:5,]       # cannot use head() with a ffdf object

#------------------------------------------------------------
#                                                 USING BIGLM
#------------------------------------------------------------
library(biglm)

# big linear model
model <- biglm(
    formula = Petal.Width ~ Petal.Length,
    data = irisff
)
summary(model)

# scatter plot
plot(
    x = irisff$Petal.Length[],
    y = irisff$Petal.Width[],
    main = "Iris Petal Length vs. Width",
    xlab = "Petal Length (cm)",
    ylab = "Petal Width (cm)"
)

# get y-intercept from model
b <- summary(model)$mat[1,1]

# get slope from model
m <- summary(model)$mat[2,1]

# plot
lines(
    x = irisff$Petal.Length[],
    y = m * irisff$Petal.Length[] + b,
    col = "red",
    lwd = 3
)

# predict new values
predict(
    object = model,
    newdata = data.frame(
        Petal.Length = c(2, 5, 7),
        Petal.Width = c(0, 0, 0)
    )
)