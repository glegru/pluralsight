# predicting_with_machine_learning.R
# Approaching the decision tree machine learning algorithm through R
# date: 2017-09-14

# Needed : install.packages("tree")          # decision tree algorithm
#          install.packages("RColorBrewer")  # color palette for plotting
#          install.packages("caret")         # evaluate performance of classifications and regression algorithms
# -------------------------------------------------------

# Setting the working directory
setwd("D:\\00_Auto-formation\\Pluralsight\\Data_Science_with_R\\7_Predicting_with_Machine_Learning")  # at work

# Importing the data
iris <- read.csv("data\\Iris.csv")
head(iris)

set.seed(42)

# splitting data into training and test datasets

indexes <- sample(
    x = 1:150,
    size = 100
)
print(indexes)

train <- iris[indexes, ]
test <- iris[-indexes, ]

# -------------------------------------------------------
#                                           DECISION TREE
# -------------------------------------------------------
library(tree)

# training decision tree model
model <- tree(
    formula = Species ~ .,
    data = train
)
summary(model)

# plot
plot(model)
text(model)

# moar visualization
library(RColorBrewer)

# creating a color palette
palette <- brewer.pal(3, "Set2")

# scatter plot colored by species
plot(
    x = iris$Petal.Length,
    y = iris$Petal.Width,
    pch = 19,
    col = palette[as.numeric(iris$Species)],
    main = "Iris Petal Length vs. Width",
    xlab = "Petal Length (cm)",
    ylab = "Petal Width (cm)"
)

# plot decision boundaries
partition.tree(
    tree = model,
    label = "Species",
    add = TRUE
)

# prediction
predictions <- predict(
    object = model,
    newdata = test,
    type = "class"
)

# create a confusion matrix : comparing the predicted species and the real ones
table(
    x = predictions,
    y = test$Species
)

library(caret)

# evaluate prediction result
confusionMatrix(
    data = predictions,
    reference = test$Species
)

# saving tree model
save(model, file = "results\\Tree.RData")
save(train, file = "Train.RData")
