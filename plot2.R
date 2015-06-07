library(sqldf)
fileName <- "household_power_consumption.txt"
rawData<-read.csv.sql(fileName, sep=";", 
                      sql="select * from file where Date in ('1/2/2007','2/2/2007')")
rawData$Date <-as.Date(rawData$Date,format="%d/%m/%Y")
rawData$Time <-strptime(paste(rawData$Date,rawData$Time,sep=" "), format="%Y-%m-%d %H:%M:%S")
rawData$Weekday <-weekdays(rawData$Date)
par(mfcol=c(1,1))
with(rawData,plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.copy(png,file="plot2.png")
dev.off()