# creating_statistical_models.R
# Basic statistical model training (for instance linear regression)
# date: 2017-09-14
# -------------------------------------------------------

# Setting the working directory
setwd("D:\\00_Auto-formation\\Pluralsight\\Data_Science_with_R\\5_Create_Statistical_Models")  # at work

# Importing the data
iris <- read.csv("data\\Iris.csv")
head(iris)

# scatter plot
plot(
    x = iris$Petal.Length,
    y = iris$Petal.Width,
    main = "Iris Petal Length vs. Width",
    xlab = "Petal Length (cm)",
    ylab = "Petal Width (cm)",
)

# linear regression model
model <- lm(
    formula = Petal.Width ~ Petal.Length,
    data = iris
)
summary(model)

# plotting the model
lines(
    x = iris$Petal.Length,
    y = model$fitted,
    col = "red",
    lwd = 3
)

# correlation
cor(
    x = iris$Petal.Length,
    y = iris$Petal.Width
)

# predict new values
predict(
    object = model,
    newdata = data.frame(
        Petal.Length = c(2, 5, 7)
    )
)