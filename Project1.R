library(sqldf)
setwd("/Users/manuthegreat/Documents/Courses/Exploratory Data Analysis/data/")
fileName <- "household_power_consumption.txt"
rawData<-read.csv.sql(fileName, sep=";", sql="select * from file where Date in ('1/2/2007','2/2/2007')")
rawData$Date <-as.Date(rawData$Date)
rawData$Time <-strptime(rawData$Time, format="%H:%M:%S")
hist(rawData$Global_active_power,xlab="Global Active Power", ylab="Frequency",main="Global Active Power",col="red")
dev.copy(png,file="plot1.png")
dev.off()