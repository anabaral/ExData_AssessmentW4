# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get sums by year
EmissionSums <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)

# plot sums
png("plot1.png")
barplot(EmissionSums$x, 
        main=expression("Total Emission of PM"[2.5]), 
        xlab="Year", 
        ylab=expression("PM"[2.5]*" (tons)"))
dev.off()