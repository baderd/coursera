Editable tables in shiny
========================================================
autosize: true
author: Daniel Bader
date: 2019-10-08




**Week4 pitch presentation**

Coursera's Developing Data Products


Visit my shiny app bringing it all together: <br>
https://baderd.shinyapps.io/Dynamic_mtcars/ 
<br>
Check out the [source code](https://github.com/baderd/coursera/tree/master/developing_data_products/week4_shiny) 
of the presentation and shiny app.


Motivation
========================================================

Create a shiny template for use with my actual work data 
that has the following features:

- Data with numeric and categorical variables
- Text search to subset the data
- Editable table powered by <code>rhandsontable</code>
- Interactive plot based on subsetted and potentially modified table
- Export of standalone HTML report to a file using the modified data


Data: mtcars
========================================================

Quarter mile speed in seconds vs horse power


```r
library(plotly)

p <- plot_ly(
    data = mtcars, 
    x = ~hp, 
    y = ~qsec, 
    hovertext = rownames(mtcars)
) %>%
    add_markers()

htmlwidgets::saveWidget(p, file = "demo_plotly.html")
```

Interactive plot 
===
<iframe src="demo_plotly.html" style="position:absolute;height:100%;width:100%"></iframe>


Editable table
========================================================

Using <code>rhandsontable</code> package to allow editing of cells.


<iframe src="demo_hot.html" style="position:absolute;height:100%;width:100%"></iframe>


