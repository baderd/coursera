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
    df_cars_raw <- cbind(
        car_name = rownames(mtcars),
        car_brand = sapply(rownames(mtcars), function(x){
            strsplit(x, " ")[[1]][1]
        }), 
        mtcars
    )
    dfcars <- reactive({
        subset(df_cars_raw, grepl(input$car_search, car_name, ignore.case = T))
    })
    
    output$hp_vs_qsec <- renderPlotly({
        plot_ly(data = dfcars(), x = ~hp, y = ~qsec, hovertext = ~car_name) %>%
            add_markers()
    })
    
    tmp_hot <- reactive({
        rhandsontable(data = dfcars(), rowHeaders = NULL) %>%
            hot_table(highlightRow = TRUE) %>%
            hot_cols(columnSorting = TRUE)
    })
    output$hot <- renderRHandsontable(tmp_hot())
    # output$simple_tab <- renderTable({head(hot_to_r(input$hot))})
    
    output$report <- downloadHandler(
        filename = "report.html",
        content = function(file) {
            # Set up parameters to pass to Rmd document
            params <- list(hot = input$hot, ptly = input$hp_vs_qsec)
            
            # Knit the document, passing in the `params` list, and eval it in a
            # child of the global environment (this isolates the code in the document
            # from the code in this app).
            rmarkdown::render(
                "report.Rmd", 
                output_file = file,
                params = params,
                envir = new.env(parent = globalenv())
            )
        }
    )
})
