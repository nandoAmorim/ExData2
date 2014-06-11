library(data.table)


### read data for analisys
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### data for plotting
NEI <- data.table(NEI)
total_emissions_table <- data.frame(NEI[,  sum(Emissions), by = c('year','fips')])
names(total_emissions_table) <- c('year','fips','total_emissions')
total_emissions_baltimore <- total_emissions_table[total_emissions_table['fips']=='24510',]


### base package plot for data
png('plot2.png',width=480,height=480)

plot(y=total_emissions_baltimore$total_emissions,
     x=total_emissions_baltimore$year, 
     type='b',
     main='Plot2: Total Emissions in Baltimore',
     xlab='year',
     ylab='Total of Emissions'
     )

dev.off()