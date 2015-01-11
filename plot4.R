data <- read.table("household_power_consumption.txt", sep=";", header=T)
datasubset1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

datasubset1$Global_active_power <- as.numeric(as.character(datasubset1$Global_active_power))
datasubset1$Sub_metering_1 <- as.numeric(as.character(datasubset1$Sub_metering_1))
datasubset1$Sub_metering_2 <- as.numeric(as.character(datasubset1$Sub_metering_2))
datasubset1$Voltage <- as.numeric(as.character(datasubset1$Voltage))
datasubset1$Global_reactive_power <- as.numeric(as.character(datasubset1$Global_reactive_power))

datasubset1$datetime <- paste(datasubset1$Date, datasubset1$Time)
datasubset1$datetime <- strptime(datasubset1$datetime,format="%d/%m/%Y %H:%M:%S")


png(filename = "plot4.png", width=480, height=480, bg="white")

par(mfcol=c(2,2))

plot(datasubset1$datetime, datasubset1$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(datasubset1$datetime, datasubset1$Global_active_power)

plot(datasubset1$datetime, datasubset1$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(datasubset1$datetime, datasubset1$Sub_metering_1)
lines(datasubset1$datetime, datasubset1$Sub_metering_2, col="red")
lines(datasubset1$datetime, datasubset1$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datasubset1$datetime, datasubset1$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(datasubset1$datetime, datasubset1$Voltage)

plot(datasubset1$datetime, datasubset1$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(datasubset1$datetime, datasubset1$Global_reactive_power)

dev.off()