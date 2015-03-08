## Course exploratory data analysis
## Project 1 - Plot 4
## Author : Sophie Tardivel
## Date   : Mar 7, 2015

library(datasets)
Sys.setlocale("LC_TIME", "English")

# Location of the dataset file
fn <- "exdata_data_household_power_consumption/household_power_consumption.txt"

## Considering that the data file is made of regular measurement, per minute,
## let's determine the first useful row in order not to read the previous ones

# Determine first line date and time
firstline <- read.table(fn, sep=";", quote="\"", skip=1, nrows=1)

firstdate <- strptime(paste(firstline$V1,firstline$V2),"%d/%m/%Y %H:%M:%S")

# Determine the number of line between first date and targeted dates 

targetdate <- as.POSIXlt("2007-02-01")

nbline <- (targetdate - firstdate)*60*24

## Read the Household Power Consumption dataset for 2 days (2days*24hours*60 min)
hpc <- read.table(fn, sep=";", quote="\"", , skip=nbline+1, nrows=2*24*60)


## Create plot 4 image that shows the Global Active Power over days

# Prepare the date&time for axis X
dtx <- strptime(paste(hpc$V1,hpc$V2),"%d/%m/%Y %H:%M:%S")

# Create the 4 plots, with reduced text sizes
par(mfrow=c(2,2))

plot(dtx, hpc$V3,xlab="", ylab="Global Active Power", cex.axis=0.7, cex.lab=0.7, type="l", col="black")

plot(dtx,hpc$V5,xlab="datetime", ylab="Voltage",cex.axis=0.7, cex.lab=0.7, type="l", col="black")

plot(dtx, hpc$V7,xlab="", ylab="Energy sub metering", cex.axis=0.7, cex.lab=0.7, type="l", col="black")
lines(dtx,hpc$V8,col="red")
lines(dtx,hpc$V9,col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","blue","red"),
       lty=1,bty="n",
       cex=0.45, y.intersp=0.2)

plot(dtx,hpc$V4,xlab="datetime", ylab="Global_reactive_Power", cex.axis=0.7, cex.lab=0.7, type="l", col="black")

# copy on a png graphics device, named plot4.png, using default parameters
dev.copy(png,filename = "plot4.png")
dev.off()
