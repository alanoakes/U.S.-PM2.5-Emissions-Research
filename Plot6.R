#!/bin/bash
# 6 -----------------------------------------------------------------------------------
# Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California (fips=="06037"). Which city
# has seen greater changes over time in motor vehicle emissions?
library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI6.1<-NEI[NEI$fips==c("24510","06037")&NEI$type=="ON-ROAD",]
KeepCols<-c("fips","Emissions","type","year")
NEI6.2<-NEI6.1[,KeepCols]
NEI6.2$fips<-as.factor(NEI6.2$fips)
NEI6.2$Emissions<-as.integer(NEI6.2$Emissions)
NEI6.2$type<-as.factor(NEI6.2$type)
NEI6.2$year<-as.factor(NEI6.2$year)

NEI6.3<-NEI6.2%>%
        group_by(fips,year)%>%
        summarize(Emissions=sum(Emissions))
NEI6.4<-mutate(NEI6.3, 
        City=ifelse(fips== "06037", 
        "Los Angeles", "Baltimore"))

# PLOT 6
png("Plot6",width=480,height=300)
ggplot(NEI6.4,aes(year,Emissions))+
  geom_bar(stat="identity")+
  facet_wrap(~City)+
  ggtitle("Vehicle Emissions Difference from 1999 and 2008")
#dev.off()