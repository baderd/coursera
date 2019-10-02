# R shiny app server
# author: Daniel Bader

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
    rownames(df_cars_raw) <- NULL
    
    # subset by search term
    dfcars <- reactive({
        subset(df_cars_raw, grepl(input$car_search, car_name, ignore.case = T))
    })
    
    # display editable table
    tmp_hot <- reactive({
        rhandsontable(data = dfcars(), rowHeaders = NULL) %>%
            hot_table(highlightRow = TRUE) %>%
            hot_cols(columnSorting = TRUE)
    })
    output$hot <- renderRHandsontable(tmp_hot())
    
    
    # plot horsepower vs quarter mile seconds
    output$hp_vs_qsec <- renderPlotly({
        shiny::req(input$hot)
        plot_ly(
            data = hot_to_r(input$hot),
            x = ~hp, y = ~qsec, hovertext = ~car_name
        ) %>%
            add_markers()
    })
    
    
    # generate downloadable report with current modified table
    output$report <- downloadHandler(
        filename = "report.html",
        content = function(file) {
            # save hot to tmp file
            tmpfile <- tempfile(fileext = ".csv")
            write.csv(x = hot_to_r(input$hot), file = tmpfile, row.names = F)
            
            # Set up parameters to pass to Rmd document
            params <- list(file_table = tmpfile)
            
            # Knit the document, passing in the `params` list, and eval it in a
            # child of the global environment 
            # (this isolates the code in the document from the code in this app).
            rmarkdown::render(
                "report.Rmd", 
                output_file = file,
                params = params,
                envir = new.env(parent = globalenv())
            )
        }
    )
})
