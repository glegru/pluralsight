# machine_learning_app.R
# Deploying the previous machine learning algorithm through a fancy shiny app !
# date: 2017-09-15

# Needed : install.packages("shiny")  # the Shiny R framework
# -------------------------------------------------------

library(shiny)
library(RColorBrewer)
library(tree)

setwd("D:\\00_Auto-formation\\Pluralsight\\Data_Science_with_R\\8_Deploying_to_Production")  # at work

# Loading previous learned model
load("data\\Tree.RData")
load("data\\Train.RData")


# color palette
palette <- brewer.pal(3, "Set2")

# ui
ui <- fluidPage(
    titlePanel("Iris Species Predictor"),
    sidebarLayout(
        sidebarPanel(
            sliderInput(
                inputId = "petal.length",
                label = "Petal Length (cm)",
                min = 1,
                max = 7, 
                value = 4
            ),
            sliderInput(
                inputId = "petal.width",
                label = "Petal Width (cm)",
                min = 0.0,
                max = 2.5, 
                step = 0.5,
                value = 1.5
            )
        ),
        mainPanel(
            textOutput(
                outputId = "text"
            ),
            plotOutput(
                outputId = "plot"
            )
        )
    )
)

# server
server <- function(input, output) {
    output$text = renderText({

        # predictor
        predictors <- data.frame(
            Petal.Length = input$petal.length,
            Petal.Width  = input$petal.width,
            Sepal.Length = 0,
            Sepal.Width  = 0
        )

        # prediction
        prediction = predict(
            object = model,
            newdata = predictors,
            type = "class"
        )

        # prediction text
        paste(
            "The predicted species is ",
            as.character(prediction)
        )
    })

    output$plot = renderPlot({
        
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

        # plot decission tree boundaries
        partition.tree(
            model,
            label = "Species",
            add = TRUE
        )

        # draw predictor on plot
        points(
            x = input$petal.length,
            y = input$petal.width,
            col = "red",
            pch = 4,
            cex = 2,
            lwd = 2,
        )
    })
}

# create the actual shiny app
shinyApp(
    ui = ui,
    server = server
)