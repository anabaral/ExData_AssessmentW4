# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter data (Coal related)
SCC_Coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]
NEI_Coal <- merge(NEI, SCC_Coal, by = ("SCC"))

EmissionSums <- aggregate(NEI_Coal$Emissions, 
                          by=list(year = NEI_Coal$year), 
                          FUN=sum)

# plot data
png("plot4.png")
g <- qplot(year, x, 
           data=EmissionSums, 
           ylab=expression("Emissions of PM"[2.5]), 
           main=expression("Coal combustion-related PM"[2.5]*" Emissions by year"), 
           geom="line")
print(g)
dev.off()