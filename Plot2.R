#!/bin/bash
# 2 -----------------------------------------------------------------------------------
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot 
# answering this question

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI2.1<-NEI[NEI$fips=="24510",]
NEI2.1$year<-as.factor(NEI2.1$year)
NEI2.2<-tapply(NEI2.1$Emissions,NEI2.1$year,sum)
NEI2.3<-as.data.frame(NEI2.2)
Year<-row.names(NEI2.3)
NEI2.3$Year<-Year
row.names(NEI2.3)<-c()
names(NEI2.3)<-c("PM2.5","Year")

# PLOT 2
png("Plot2",width=480,height=480)
barplot(height=NEI2.3$PM2.5/1000,
        col="darkred",
        main="Total Emissions of PM2.5 in Baltimore City from 1999 to 2008",
        xlab="Year",
        ylab="PM2.5 in Kilotons")
dev.off()