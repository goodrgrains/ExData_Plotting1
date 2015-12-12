png(filename="plot2.png", width=480, height=480, units="px", bg="white")
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")
data_days<- data[data$Date >= "2007-02-01" & data$Date <"2007-02-03",]
plot(data_days$DateTime, data_days$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

