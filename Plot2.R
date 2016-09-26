rm(list = ls())
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
######str(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") ##gave the initial date format
###head(data)
subsetData <- subset(data,data$Date=="2007-02-01" | data$Date =="2007-02-02")

##construct date/time
x <- paste(subsetData$Date, subsetData$Time)
subsetData$datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(subsetData$datetime,subsetData$Global_active_power, type = "l" ,xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()