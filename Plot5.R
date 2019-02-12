#!/bin/bash
# 5 -----------------------------------------------------------------------------------
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI5.1<-NEI[NEI$type=="ON-ROAD"&NEI$fips=="24510",]
NEI5.1$year<-as.factor(NEI5.1$year)
NEI5.2<-tapply(NEI5.1$Emissions,NEI5.1$year,sum)
NEI5.3<-as.data.frame(NEI5.2)
Year<-row.names(NEI5.3)
NEI5.3$Year<-Year
row.names(NEI5.3)<-c()
names(NEI5.3)<-c("PM2.5","Year")

# PLOT 5
png("Plot5",width=480,height=480)
barplot(height=NEI5.3$PM2.5,
        col="gray",
        main="Vehicle PM2.5 Emissions in Baltimore from 1999 to 2008",
        xlab="Year",
        ylab="PM2.5 Emissions in Tons")
dev.off()