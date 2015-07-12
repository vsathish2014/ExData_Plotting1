#Set working directory
setwd("C:/Users/INSAV3/Documents/GitHub/ExData_Plotting1")

#Clear all variables in Global environment
rm(list =ls())

#Read the  data from file based for only 1/2/2007 and 2/2/2007
library(sqldf)
epc <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep = ';',
                    sql = "select * from file where Date ='1/2/2007' OR Date ='2/2/2007' ")


## Converting dates
DateTime <- paste(as.Date(epc$Date), epc$Time)
epc$Datetime <- as.POSIXct(DateTime)

## Create the Plot 2
#Set working directory
setwd("C:/Users/INSAV3/Documents/GitHub/ExData_Plotting1")

#Clear all variables in Global environment
rm(list =ls())

#Read the  data from file based for only 1/2/2007 and 2/2/2007
library(sqldf)
epc <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep = ';',
                    sql = "select * from file where Date ='1/2/2007' OR Date ='2/2/2007' ")


## Converting dates
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
DateTime <- paste(as.Date(epc$Date), epc$Time)
epc$Datetime <- as.POSIXct(DateTime)

## Create the Plot 2
plot(epc$Global_active_power~epc$Datetime, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off() 