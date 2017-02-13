library(plotly)
library(data.table)

# Making world map with counts for Gagneur lab members
f = 'toys/gagneurlab.txt'
people <- fread(f)
dt = people[,.(number_people=.N),by=country]
dt

p <- plot_ly(dt, type='choropleth', locationmode='country names', 
             locations=~country, z=~number_people, colors=colorRamp(c("skyblue", "blue"))
) %>% layout(
    title='Gagneur lab since 2012',
    geo=list(scope='world', projection=list(type='natural earth'))
)
p

