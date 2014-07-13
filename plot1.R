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

## Making histogram
png(filename = "plot1.png",width = 480, height = 480)

with(dat.feb, hist(Global_active_power, col = "red", main = "Global Active Power", xlab ="Global Active Power (Kilowatts)"))
dev.off()
