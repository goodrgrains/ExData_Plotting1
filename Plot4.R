png(filename="plot4.png", width=480, height=480, units="px", bg="white")
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")
data_days<- data[data$Date >= "2007-02-01" & data$Date <"2007-02-03",]
par(mfrow=c(2,2))
plot(data_days$DateTime, data_days$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data_days$DateTime, data_days$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data_days$DateTime,data_days$Sub_metering_1,ylab="Energy sub metering", xlab=" ",
    ylim=range(data_days[c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]),type="l",col="black")
    lines(data_days$DateTime,data_days$Sub_metering_2,type="l",pch=2,col="red")
    lines(data_days$DateTime,data_days$Sub_metering_3,type="l",pch=3,col="blue")
    legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"), bty="n")
plot(data_days$DateTime, data_days$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

