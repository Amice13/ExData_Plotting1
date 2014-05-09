# Read table. We consider "?" as NA and sure that variable Date will be read as string 

data <- read.table('household_power_consumption.txt',sep=';',header=T,stringsAsFactors=FALSE, na.strings="?")

# Convert variable "Date" from string to POSIXt 

data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T")
data$Date <- strptime(data$Date,format="%d/%m/%Y")

# Subset data

data <- subset(data,data$Date <= strptime('2007-02-02',format="%Y-%m-%d"))
data <- subset(data,data$Date >= strptime('2007-02-01',format="%Y-%m-%d"))

# Make the plot

png(filename="plot1.png", width = 480, height = 480)
hist(data$Global_active_power,col='red',
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.off()

