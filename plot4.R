library(sqldf)
fileName <- "household_power_consumption.txt"
rawData<-read.csv.sql(fileName, sep=";", 
                      sql="select * from file where Date in ('1/2/2007','2/2/2007')")
rawData$Date <-as.Date(rawData$Date,format="%d/%m/%Y")
rawData$Time <-strptime(paste(rawData$Date,rawData$Time,sep=" "), format="%Y-%m-%d %H:%M:%S")
rawData$Weekday <-weekdays(rawData$Date)
par(mfcol=c(2,2))
with(rawData, {
  plot(Time,Global_active_power,ylab="Global Active Power",xlab="",type="l")
  plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(Time,Sub_metering_2,col="red")
  lines(Time,Sub_metering_3,col="blue")
  legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),cex=0.2)
  plot(Time,Voltage,ylab="Voltage",xlab="datetime",type="l")
  plot(Time,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png,file="plot4.png")
dev.off()