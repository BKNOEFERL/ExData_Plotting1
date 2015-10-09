# First step: Setting the Working Directory to the path where the data is stored
getwd()
setwd("C:\\Users\\bknoeferl\\Desktop\\pr1")

list.files()
# read in the data and build the subset
data <- "household_power_consumption.txt" 
dat <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
sub <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,] 


# plot4
# formating date and making numerics  
datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
Global_active_power <- as.numeric(sub$Global_active_power) 
Global_reactive_power <- as.numeric(sub$Global_reactive_power) 
voltage <- as.numeric(sub$Voltage) 
Sub_metering_1 <- as.numeric(sub$Sub_metering_1) 
Sub_metering_2 <- as.numeric(sub$Sub_metering_2) 
Sub_metering_3 <- as.numeric(sub$Sub_metering_3) 
 
# plot4
png("plot4.png", width=480, height=480) 

# 2 rows 2 columns
par(mfrow = c(2, 2))  

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2) 

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 

plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="") 
lines(datetime, Sub_metering_2, type="l", col="red") 
lines(datetime, Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n") 

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 

dev.off() 
