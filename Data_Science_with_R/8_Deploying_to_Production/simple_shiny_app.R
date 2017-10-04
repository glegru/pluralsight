# simple_shiny_app.R
# Further exploration of shiny, especially the ui and server interactions.
# date: 2017-09-15

# Needed : install.packages("shiny")  # the Shiny R framework
# -------------------------------------------------------

library(shiny)

# ui
ui <- fluidPage(
    titlePanel("Input and Output"),
    sidebarLayout(
        sidebarPanel(
            sliderInput(
                inputId = "num",
                label = "Choose a Number",
                min = 0,
                max = 100, 
                value = 25
            )
        ),
        mainPanel(
            textOutput(
                outputId = "text"
            )
        )
    )
)

# server
server <- function(input, output) {
    output$text <- renderText({
        paste("You selected ", input$num)
    })
}

# create the actual shiny app
shinyApp(
    ui = ui,
    server = server
)