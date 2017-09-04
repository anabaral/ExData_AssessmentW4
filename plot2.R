# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter data (Baltimore)
NEI_Baltimore <- subset(NEI, fips=="24510")
EmissionSums <- aggregate(NEI_Baltimore$Emissions, 
                          by=list(year=NEI_Baltimore$year), FUN=sum)

# plot sums
png("plot2.png")
barplot(EmissionSums$x, 
        main=expression("Total Emission of PM"[2.5]*" in Baltimore City"), 
        xlab="Year", 
        ylab=expression("PM"[2.5]*" (tons)"))
dev.off()