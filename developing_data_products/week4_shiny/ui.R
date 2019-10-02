# R shiny app UI
# author: Daniel Bader

library(shiny)
library(plotly)
library(rhandsontable)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Dynamic plot and search on mtcars table"),

    # Sidebar with a filter inputs
    sidebarLayout(
        sidebarPanel(
            width = 3,
            h2("Car search"),
            p("(regex allowed)"),
            textInput(
                inputId = "car_search", 
                label = "Search for cars by name", 
                value = ""
            ),
            h2("Report"),
            p("When you are done modifying the table, 
               click here to download a standalone HTML report:"),
            downloadButton(outputId = "report", label = "Generate report")
        ),

        # Show the mtcars table
        mainPanel(
            h2("Documentation"),
            HTML("This app allows you to subset the mtcars table by car name and 
              plot the corresponding horse power (hp) versus the time in seconds 
              the car needs for a quarter mile (qsec). Furthermore, the table 
              displayed is editable (like excel), so you modify your favorite 
              car to be the fastest and most powerful. The plot will change 
              automatically.  
              <br><br>
              The <b>mtcars</b> table is a R built-in data set. 
              \"The data was extracted from the 1974 Motor Trend US magazine, 
              and comprises fuel consumption and 10 aspects of automobile design 
              and performance for 32 automobiles (1973–74 models).\"
              You can get more details via <code>?mtcars</code>.
              "),
            HTML("<br><br>"),
            h2("Interactive plotly graph"),
            plotlyOutput("hp_vs_qsec"),
            h2("Editable R-handsontable"),
            rHandsontableOutput("hot"),
            HTML("<br>")
        )
    )
))
