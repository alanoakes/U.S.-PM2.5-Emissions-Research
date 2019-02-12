#!/bin/bash
# 3 -----------------------------------------------------------------------------------
# Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in emissions
# from 1999–2008 for Baltimore City? Which have seen increases in emissions from 
# 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI3.1<-NEI[NEI$fips=="24510",]
NEI3.2<-aggregate(Emissions~year+type,NEI3.1,sum)
NEI3.2$year<-as.character(NEI3.2$year)

# PLOT 3
png("Plot3",width=480,height=480)
ggplot(NEI3.2,aes(year,Emissions))+
  geom_bar(stat="identity")+
  facet_wrap(~type)+
  ggtitle("Total PM2.5 Emissions in Baltimore by Type from '99 to '08")
dev.off()