library(data.table)


### read data for analisys
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### data for plotting
NEI <- data.table(NEI)
total_emissions_table <- NEI[,  sum(Emissions), by = year]
names(total_emissions_table) <- c('year','total_emissions')

### base package plot for data
png('plot1.png',width=480,height=480)

plot(y=total_emissions_table$total_emissions,
     x=total_emissions_table$year, 
     type='b',
     main='Plot1: Total Emissions',
     xlab='year',
     ylab='Total of Emissions'
     )

dev.off()