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

# plot4.R #
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

with(data_filter, plot(datetime, Global_active_power, 
                       type = "l", 
                       ylab = "Global Active Power (kilowatts)", 
                       xlab = NA))

with(data_filter, plot(datetime, Voltage,
                       type = "l",
                       ylab = "Voltage",
                       xlab = "datetime"))

with(data_filter, plot(datetime, Sub_metering_1, 
                       type = "l",
                       xlab=NA,
                       ylab = "Energy sub metering"))
with(data_filter, lines(datetime, Sub_metering_2,
                        col = "red"))
with(data_filter, lines(datetime, Sub_metering_3,
                        col = "blue"))
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n",
       lty=c(1,1),
       col = c("black", "red", "blue"))

with(data_filter, plot(datetime, Global_reactive_power,
                       type = "l",
                       ylab = "Global_reactive_power",
                       xlab = "datetime"))
dev.off()
