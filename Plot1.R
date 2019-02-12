#!/bin/bash
# 1 -----------------------------------------------------------------------------------
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year<-as.factor(NEI$year)
NEI1.1<-tapply(NEI$Emissions,NEI$year,sum)
NEI1.2<-as.data.frame(NEI1.1)
Year<-row.names(NEI1.2)
NEI1.2$Year<-Year
row.names(NEI1.2)<-c()
names(NEI1.2)<-c("PM2.5","Year")

# PLOT 1
png("Plot1",width=480,height=480)
barplot(height=NEI1.2$PM2.5/1000,
        col="steelblue",
        main="Total Emissions of PM2.5 in from 1999 to 2008",
        xlab="Year",
        ylab="PM2.5 in Kilotons")
dev.off()