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

# plot3.R #
png("plot3.png", width = 480, height = 480)
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
       lty=c(1,1),
       col = c("black", "red", "blue"))
dev.off()