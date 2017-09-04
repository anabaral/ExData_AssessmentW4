# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter data (Baltimore)
NEI_Baltimore <- subset(NEI, fips=="24510")

EmissionSums <- aggregate(NEI_Baltimore$Emissions, 
                          by=list(year = NEI_Baltimore$year, 
                                  type = NEI_Baltimore$type), 
                          FUN=sum)
# plot sums
png("plot3.png")
g <- qplot(year, x, 
      data=EmissionSums, 
      color=type, 
      ylab=expression("Emissions of PM"[2.5]), 
      main=expression("Baltimore City PM"[2.5]*" Emissions by source type and year"), 
      geom="line")
print(g)
dev.off()