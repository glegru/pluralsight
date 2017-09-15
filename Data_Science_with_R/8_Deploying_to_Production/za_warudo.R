# za_warudo.R
# Handling Shiny
# date: 2017-09-15

# Needed : install.packages("shiny")  # the Shiny R framework
# -------------------------------------------------------

library(shiny)

# ui
ui <- fluidPage("Za Warudo !")

# server
server <- function(input, output) {}

# create the actual shiny app
shinyApp(
    ui = ui,
    server = server
)