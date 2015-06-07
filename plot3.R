library(sqldf)
fileName <- "household_power_consumption.txt"
rawData<-read.csv.sql(fileName, sep=";", 
                      sql="select * from file where Date in ('1/2/2007','2/2/2007')")
rawData$Date <-as.Date(rawData$Date,format="%d/%m/%Y")
rawData$Time <-strptime(paste(rawData$Date,rawData$Time,sep=" "), format="%Y-%m-%d %H:%M:%S")
rawData$Weekday <-weekdays(rawData$Date)
par(mfcol=c(1,1))
plot(rawData$Time,rawData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(rawData$Time,rawData$Sub_metering_2,col="red")
lines(rawData$Time,rawData$Sub_metering_3,col="blue")
legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub metering 1","Sub metering 2","Sub metering 3"))
dev.copy(png,file="plot3.png")
dev.off()