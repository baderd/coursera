# R shiny app server
# author: Daniel Bader

library(shiny)
library(rhandsontable)
library(plotly)

insert_img_tag <- function(car_name, folder = "car_images/"){
    paste0(
        "<img src=\"", 
        folder, gsub(" ", "_", car_name), "_wiki.jpg\"",
        " width=\"50\" height=\"50\">"
    )
}


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$wd <- renderText(getwd())
    
    df_cars_raw <- cbind(
        car_name = rownames(mtcars),
        car_brand = sapply(rownames(mtcars), function(x){
            strsplit(x, " ")[[1]][1]
        }),
        mtcars
    )
    addResourcePath(
        prefix = "foo",
        directoryPath = normalizePath(getwd())
    )
    df_cars_raw[, "car_img"] <- insert_img_tag(
        df_cars_raw$car_name, 
        # folder = "foo/car_images/"
        folder = "/home/daniel/workspace/coursera/developing_data_products/week4_shiny/car_images/"
    )
    rownames(df_cars_raw) <- NULL
    
    # display editable table
    
    tmp_hot <- reactive({
        rhandsontable(
            data = dfcars(),
            rowHeaders = NULL,
            allowedTags = "<img>"
        ) %>%
            hot_table(
                highlightRow = TRUE,
                height = 300,
                stretchH = TRUE
            ) %>%
            hot_cols(columnSorting = TRUE, colWidths = 60) %>%
            hot_rows(rowHeights = 60) %>%
            hot_col("car_img", renderer = htmlwidgets::JS("safeHtmlRenderer"))
    })
    output$hot <- renderRHandsontable(tmp_hot())
    
    
    # subset by search term
    dfcars <- reactive({
        subset(df_cars_raw, grepl(input$car_search, car_name, ignore.case = T))
    })
    
    
    # plot horsepower vs quarter mile seconds
    output$hp_vs_qsec <- renderPlotly({
        shiny::req(input$hot)
        plot_ly(
            data = hot_to_r(input$hot),
            x = ~hp, y = ~qsec, hovertext = ~car_name
        ) %>%
            add_markers()
    })
    
    output$avg_qsec <- renderText({
        shiny::req(input$hot)
        signif(mean(hot_to_r(input$hot)$qsec), 2)
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
