# First step: Setting the Working Directory to the path where the data is stored
getwd()
setwd("C:\\Users\\bknoeferl\\Desktop\\pr1")

list.files()

# read in the data and build the subset
data <- "household_power_consumption.txt" 
dat <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
sub <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,] 
 
 Global_active_power <- as.numeric(sub$Global_active_power)

# plot1
png("plot1.png", width=480, height=480) 
hist(Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
