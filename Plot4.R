rm(list = ls())
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
######str(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") ##gave the initial date format
###head(data)
subsetData <- subset(data,data$Date=="2007-02-01" | data$Date =="2007-02-02")
x <- paste(subsetData$Date, subsetData$Time)
subsetData$datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(subsetData$datetime,subsetData$Global_active_power, type = "l" ,xlab = "", ylab = "Global Active Power")

plot(subsetData$datetime,subsetData$Voltage, type = "l" ,xlab = "datetime", ylab = "Voltage")

with(subsetData, plot(subsetData$datetime,subsetData$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
lines(subsetData$datetime, subsetData$Sub_metering_2, col = "red")
lines(subsetData$datetime, subsetData$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(subsetData$datetime,subsetData$Global_reactive_power, type = "l" ,xlab = "datetime", ylab = "Global_reactive_power")
dev.off()