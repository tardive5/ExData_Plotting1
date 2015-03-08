## Course exploratory data analysis
## Project 1 - Plot 1
## Author : Sophie Tardivel
## Date   : Mar 7, 2015

library(datasets)
Sys.setlocale("LC_TIME", "English")

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


## Create plot 1 image that shows the Global Active Power

par(mfrow=c(1,1))

# initiate the plot as histogram, with specific color, with reduced text sizes

hist(hpc$V3, col="#F82A08", main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency", cex.axis=0.7, cex.lab=0.75, cex.main=0.9)


# copy on a png graphics device, named plot1.png, with default parameters
dev.copy(png,filename = "plot1.png")
dev.off()
