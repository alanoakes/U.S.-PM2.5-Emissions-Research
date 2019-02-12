#!/bin/bash
# 4 -----------------------------------------------------------------------------------
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

COAL<-SCC[grep("[Cc][Oo][Aa][Ll]",SCC$EI.Sector),"SCC"]
NEI4.1<-NEI[NEI$SCC==COAL,]
NEI4.1$year<-as.factor(NEI4.1$year)
NEI4.2<-tapply(NEI4.1$Emissions,NEI4.1$year,sum)
NEI4.3<-as.data.frame(NEI4.2)
Year<-row.names(NEI4.3)
NEI4.3$Year<-Year
row.names(NEI4.3)<-c()
names(NEI4.3)<-c("PM2.5","Year")

# PLOT 4
png("Plot4",width=480,height=480)
barplot(height=NEI4.3$PM2.5,
    col="green",
    main="Coal Cumbustion Emission Changes from 1999 to 2008",
    xlab="Year",
    ylab="PM2.5 Emissions in Tons")
dev.off()