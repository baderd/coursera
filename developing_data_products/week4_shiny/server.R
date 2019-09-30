#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(rhandsontable)
library(plotly)



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    df_cars_raw <- cbind(car_name = rownames(mtcars), mtcars)
    dfcars <- reactive({
        subset(df_cars_raw, grepl(input$car_search, car_name, ignore.case = T))
    })
    
    output$hp_vs_qsec <- renderPlotly({
        plot_ly(data = dfcars(), x = ~hp, y = ~qsec, hovertext = ~car_name)
    })
    
    output$hot <- renderRHandsontable({
        rhandsontable(data = dfcars(), rowHeaders = NULL)
    })

})
