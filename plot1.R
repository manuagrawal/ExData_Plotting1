library(sqldf)
fileName <- "household_power_consumption.txt"
rawData<-read.csv.sql(fileName, sep=";", 
                      sql="select * from file where Date in ('1/2/2007','2/2/2007')")
rawData$Date <-as.Date(rawData$Date,format="%d/%m/%Y")
rawData$Time <-strptime(paste(rawData$Date,rawData$Time,sep=" "), format="%Y-%m-%d %H:%M:%S")
weekday <-weekdays(rawData$Date)
rawData<-cbind(rawData,weekday)
par(mfcol=c(1,1))
hist(rawData$Global_active_power,xlab="Global Active Power", ylab="Frequency",main="Global Active Power",col="red")
dev.copy(png,file="plot1.png")
dev.off()