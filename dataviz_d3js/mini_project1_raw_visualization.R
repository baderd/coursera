# Udacity course on dataviz with d3
#
#
library(plotly)
library(data.table)
library(LSD)

dt = fread( file.path('/Users/baderd/Downloads/',
      'IHME_GBD_2010_MORTALITY_AGE_SPECIFIC_BY_COUNTRY_1970_2010.csv')
      )
colnames(dt) = gsub(' ','_',colnames(dt))
colnames(dt) = gsub(',','', colnames(dt))
dt[, Death_Rate_Per_100000:= gsub(',','', Death_Rate_Per_100000)]
dt[, Death_Rate_Per_100000:= as.numeric(Death_Rate_Per_100000)]

colnames(dt) 
unique(dt$Country_Name)
unique(dt$Age_Group)

some_countries= c('France', 'China', 'Afghanistan', 'United States', 'Brazil', 'Sudan', 'Australia')
below_1year = c('0-6 days','7-27 days','28-364 days')
colpal = colorpalette('colorblind', length(some_countries))

# define plot table
dtplot = dt[Sex=='Both' & Age_Group %in% below_1year & Country_Name %in% some_countries]
dtplot[,death_ratio_per_100k:= mean(Death_Rate_Per_100000), by=c('Year', 'Country_Code')]

# plot
plot_ly(x= Year, y= death_ratio_per_100k, 
        data= dtplot, 
        color=Country_Name, colors=colpal,
        name= Country_Name
        )
layout(title= 'Mortality drops for children <br>younger than 1 year across all continents', 
       yaxis = list(exponentformat = "B", type='linear')
       )



