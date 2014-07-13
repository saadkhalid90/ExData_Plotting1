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

## Constructing second plot
png(filename = "plot2.png",width = 480, height = 480)
datetime <- paste(dat.feb[,1],dat.feb[,2], sep=" ")
date.time <- strptime(datetime, format ='%Y-%m-%d %H:%M:%s')
plot(date.time,dat.feb$Global_active_power, type='n', xlab="",ylab="Global Active Power (kilowatts)")
lines(date.time,dat.feb$Global_active_power)
dev.off()