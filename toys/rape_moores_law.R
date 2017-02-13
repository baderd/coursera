# rape moore's law
# 
# WIKIPEDIA
# Moore's law is the observation that 
# the number of transistors in a dense integrated circuit doubles approximately every two years.
#
library(data.table)
library(RCurl)
library(XML)
library(plotly)
Sys.setlocale("LC_TIME", 'en_US.UTF-8')
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

dl_dir = '/Users/baderd/Downloads/'

#
# DATA
#
seqfile = file.path(dl_dir, 'seqcost2015_4.csv')
inetsites_url = 'http://www.internetlivestats.com/total-number-of-websites/'
inetsites_file = file.path(dl_dir, "Total-number-of-Websites.html")
transistor_url = 'https://en.wikipedia.org/wiki/Transistor_count'

#
# Inet users per year
#
# inetuser_url = "http://www.internetworldstats.com/emarketing.htm"
# inetuser_file = file.path(dl_dir, "Internet-Growth-Statistics.html")
# inetuser_dt = as.data.table(readHTMLTable(inetuser_file)[[8]])
# inetuser_dt

#
# Transistor count
#
cpudt = as.data.table(readHTMLTable(getURL(transistor_url))[[1]])
setnames(cpudt, gsub(' ','_', colnames(cpudt)))
cpudt[,Date_of_introduction:= as.Date(paste0(gsub('\\[.*\\]','', Date_of_introduction), "-01-01"))]
cpudt[,Transistor_count:= gsub('\\[.*\\]', '', Transistor_count)]
cpudt[,Transistor_count:= as.numeric(gsub(',', '', Transistor_count))]

# get max per year
maxcpudt = cpudt[, .(max_transistor= max(Transistor_count)), by=Date_of_introduction]
maxcpudt[,cpu_rel_to_Jan2014:= 
             max_transistor/ maxcpudt[Date_of_introduction=='2014-01-01', max_transistor]
         ]
maxcpudt[,cpu_rel_to_2001:= 
             max_transistor/ maxcpudt[Date_of_introduction=='2001-01-01', max_transistor]
         ]


#
# LOAD: Inet sites and users per year
#
#inetsites_dt = readHTMLTable(inetsites_file)
inetsites_dt = readHTMLTable(getURL(inetsites_url))
inetsites_dt = as.data.table(inetsites_dt[[1]])

# clean 
inetsites_dt = inetsites_dt[-26,] # remove annotation
setnames(inetsites_dt, gsub(' $','', colnames(inetsites_dt)))
setnames(inetsites_dt, gsub(' ','_', colnames(inetsites_dt)))
setnames(inetsites_dt, sub('\\(June\\)','', colnames(inetsites_dt)))
inetsites_dt[,Year:= sub('Aug. ','', Year)]
inetsites_dt[,Year:= paste0(Year,'-01-01')]
inetsites_dt[,Year:= as.Date(Year, format='%Y-%m-%d')]
inetsites_dt[,Websites:= as.numeric(gsub(',','',Websites))]
inetsites_dt[,Internet_Users:= as.numeric(gsub(',','',Internet_Users))]

# relative growth
inetsites_dt[,rel_users_to_Jan2014:= Internet_Users/ inetsites_dt[Year=='2014-01-01', Internet_Users]]
inetsites_dt[,rel_sites_to_Jan2014:= Websites/inetsites_dt[Year=='2014-01-01', Websites]]
inetsites_dt[,rel_users_to_2001:= Internet_Users/ inetsites_dt[Year=='2001-01-01', Internet_Users]]
inetsites_dt[,rel_sites_to_2001:= Websites/inetsites_dt[Year=='2001-01-01', Websites]]

#
# Sequencing costs per year
#
# LOAD
seqdt = fread(seqfile)

# tidy data
setnames(seqdt, gsub(' ','_', colnames(seqdt)))
seqdt[, Cost_per_Mb:=gsub('\\$|\\.', '',Cost_per_Mb)]
seqdt[, Cost_per_Mb:= as.numeric(gsub(',', '.',Cost_per_Mb))] # change decimal separator to US
seqdt[, Cost_per_Genome:=gsub('\\$|\\.', '',Cost_per_Genome)]
seqdt[, Cost_per_Genome:= as.numeric(gsub(',', '.',Cost_per_Genome))] # change decimal separator to US
seqdt[, Date:= gsub(' ', '-', gsub('Juli', 'Jul', Date))]
# remove month info
seqdt[, Date:= gsub('^.{3}-', '20',  Date)]
seqdt[, Date:= as.Date(paste0(Date,'-01-01'))]
# max per year
minseqdt = seqdt[,.(min_cost_genome=min(Cost_per_Genome)), by=Date]


# relative growth
minseqdt[,genome_to_Jan2014:= minseqdt[Date=='2014-01-01',min_cost_genome]/min_cost_genome]
minseqdt[,genome_to_2001:= minseqdt[Date=='2001-01-01',min_cost_genome]/min_cost_genome]


#
# MERGE
#
dt = merge(
    merge(inetsites_dt, minseqdt, by.x="Year", by.y="Date", all=T), 
    maxcpudt, by.x="Year", by.y = "Date_of_introduction"
)
dt


plotdt= dt [Year>="2001-01-01"] # Year<="2014-01-01" & 
plot_ly( plotdt, x=~Year, y=~genome_to_2001, 
        type='scatter', mode='lines', name='genomes'
        ) %>% add_trace(data=plotdt, x=~Year, y=~rel_sites_to_2001, name='websites'
        ) %>% add_trace(data=plotdt, x=~Year, y=~rel_users_to_2001, name='inet users'
        ) %>% add_trace(data=plotdt, x=~Year, y=~cpu_rel_to_2001, name='transistors'
        ) %>% layout(yaxis=list(title='Relative to 2001', type='log'))



