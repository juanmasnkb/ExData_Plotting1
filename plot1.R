##############################################
## Peer-graded Assignment: Course Project 1 ##
##############################################

# Read Data #
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings = "?")

# filtering #
library(dplyr)
data_filter<- filter(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data_filter$datetime <- as.POSIXct(paste(data_filter$Date, data_filter$Time, sep=" "), format="%d/%m/%Y %H:%M:%OS")
data_filter$Date <- as.Date(data_filter$Date, "%d/%m/%Y")

# plot1.R #
png("plot1.png", width = 480, height = 480)
hist(data_filter$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()