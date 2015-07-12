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

## Create the Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(epc, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='red')
  lines(Sub_metering_3~Datetime,col='blue')
  # setup for no margins on the legend
  par(mar=c(1, 1, 1, 0))
  legend("topright" ,adj = 0,col=c("black", "red", "blue"), lty=1, lwd=2, cex=0.5,bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  par(mar=c(4,4,2,1))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datetime")
})


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off() 