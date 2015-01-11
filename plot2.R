data <- read.table("household_power_consumption.txt", sep=";", header=T)
datasubset1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
datasubset1$Global_active_power <- as.numeric(as.character(datasubset1$Global_active_power))

datasubset1$datetime <- paste(datasubset1$Date, datasubset1$Time)
datasubset1$datetime <- strptime(datasubset1$datetime,format="%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width=480, height=480, bg="white")

plot(datasubset1$datetime, datasubset1$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(datasubset1$datetime, datasubset1$Global_active_power)

dev.off()

