## setting directory
## setwd("C:/Users/hp/Documents/Exploratory Data Analysis")
## reading one line to get column datatypes
dat <- read.table("household_power_consumption.txt", nrows = 1, sep = ';', comment.char="",header = TRUE)
COL <- sapply(dat,class)

## Reading in the data to a dataframe called dat
dat <- read.table("household_power_consumption.txt", nrows = 2075259, sep = ';', comment.char="", colClasses = COL,header = TRUE, na.strings="?")

## converting first column to Data datatype 
dat[,1] <- as.Date(dat[,1], format = '%d/%m/%Y')
## subsetting to first two days in February
dat.feb <- subset(dat, Date=="2007-02-01" | Date=="2007-02-02")

## Constructing the plot
png(filename = "plot3.png",width = 480, height = 480)
plot(date.time, dat.feb$Sub_metering_1, type = 'l', col='black', ylab="Energy sub metering", xlab = "")
lines(date.time, dat.feb$Sub_metering_2, type = 'l', col='red')
lines(date.time, dat.feb$Sub_metering_3, type = 'l', col='blue')
legend("topright", col = c("black","red","blue"), lty = "solid", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()