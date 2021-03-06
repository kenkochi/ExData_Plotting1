#Course Project 1
#Plot 2
#Ken Kochi

#Read data file and subset to dates specified in assignment
#It is assumed that the "household_power_consumption.txt" file is in the working directory
data <- read.table("household_power_consumption.txt", sep=";", header=T)
datasubset1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#Convert Global_active_power to numeric class
datasubset1$Global_active_power <- as.numeric(as.character(datasubset1$Global_active_power))

#Create a combined column for the date and time
#The strptime function converts this to a POSIXlt class
datasubset1$datetime <- paste(datasubset1$Date, datasubset1$Time)
datasubset1$datetime <- strptime(datasubset1$datetime,format="%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width=480, height=480, bg="white")

plot(datasubset1$datetime, datasubset1$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(datasubset1$datetime, datasubset1$Global_active_power)

dev.off()

