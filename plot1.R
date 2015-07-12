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

## Create the Plot 1
hist(epc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()