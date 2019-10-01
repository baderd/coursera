#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Dynamic plot and search on mtcars table"),

    # Sidebar with a filter inputs
    sidebarLayout(
        sidebarPanel(
            downloadButton("report", "Generate report"),
            textInput(
                inputId = "car_search", 
                label = "Search for cars by name", 
                value = ""
            )
        ),

        # Show the mtcars table
        mainPanel(
            plotlyOutput("hp_vs_qsec"),
            # tableOutput("simple_tab"),
            rHandsontableOutput("hot")
        )
    )
))
