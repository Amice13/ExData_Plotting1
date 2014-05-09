# Read table. We consider "?" as NA and sure that variable Date will be read as string 

data <- read.table('household_power_consumption.txt',sep=';',header=T,stringsAsFactors=FALSE, na.strings="?")

# Convert variable "Date" from string to POSIXt 

data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T")
data$Date <- strptime(data$Date,format="%d/%m/%Y")

# Subset data

data <- subset(data,data$Date <= strptime('2007-02-02',format="%Y-%m-%d"))
data <- subset(data,data$Date >= strptime('2007-02-01',format="%Y-%m-%d"))

# Make the plot

Sys.setlocale(locale = "C")
png(filename="plot3.png", width = 480, height = 480)
plot(data$Time,data$Sub_metering_1,type='l',
     xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_2,type='l',col='red')
lines(data$Time,data$Sub_metering_3,type='l',col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c('black', 'red', 'blue'),lty = rep(1,3))
dev.off()
Sys.setlocale(category = "LC_ALL", locale = "")