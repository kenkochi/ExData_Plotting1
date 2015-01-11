data <- read.table("household_power_consumption.txt", sep=";", header=T)
datasubset1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
datasubset1$Global_active_power <- as.numeric(as.character(datasubset1$Global_active_power))

png(filename = "plot1.png", width=480, height=480, bg="white")

hist(datasubset1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


dev.off()

