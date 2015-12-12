png(filename="plot3.png", width=480, height=480, units="px", bg="white")
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")
data_days<- data[data$Date >= "2007-02-01" & data$Date <"2007-02-03",]
plot(data_days$DateTime,data_days$Sub_metering_1,ylab="Energy sub metering", xlab=" ",
    ylim=range(data_days[c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]),type="l",col="black")
    lines(data_days$DateTime,data_days$Sub_metering_2,type="l",pch=2,col="red")
    lines(data_days$DateTime,data_days$Sub_metering_3,type="l",pch=3,col="blue")
    legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()

