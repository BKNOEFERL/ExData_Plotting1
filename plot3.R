# First step: Setting the Working Directory to the path where the data is stored
getwd()
setwd("C:\\Users\\bknoeferl\\Desktop\\pr1")

list.files()
# read in the data and build the subset
data <- "household_power_consumption.txt" 
dat <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
sub <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,] 

# formating date
datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
Global_active_power <- as.numeric(sub$Global_active_power) 
Sub_metering_1 <- as.numeric(sub$Sub_metering_1) 
Sub_metering_2 <- as.numeric(sub$Sub_metering_2) 
Sub_metering_3 <- as.numeric(sub$Sub_metering_3) 
 
# plot3
png("plot3.png", width=480, height=480) 
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, Sub_metering_2, type="l", col="red") 
lines(datetime, Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off() 
