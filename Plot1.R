rm(list=ls())
if(!file.exists("data")){
	dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = fileUrl, destfile = "./data/household_power_consumption.zip", mode = "wb")
dateDownloaded <- date()
unzip("./data/household_power_consumption.zip", exdir = "./data")
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
######str(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") ##gave the initial date format
###head(data)
subsetData <- subset(data,data$Date=="2007-02-01" | data$Date =="2007-02-02")
###unique(subsetData$Date)##checking
hist(subsetData$Global_active_power, main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", col = "red")
png("plot1.png", width=480, height=480)
hist(subsetData$Global_active_power, main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()