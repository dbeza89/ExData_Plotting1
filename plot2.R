## Read File using 'sqldf' package

setwd("C:/Users/Dexter/Desktop/R")
library(sqldf)
df <- read.csv.sql("household_power_consumption.txt", 
                   "select * from file where date in ('1/2/2007','2/2/2007') ", 
                   header=TRUE, sep=";")

## Convert date format

df$Date <- strptime(df$Date, format="%d/%m/%Y")
df$Date <- as.Date(df$Date)

## Create vector combining Date and Time

datetime <- paste(df$Date,df$Time)
datetime <- as.POSIXct(datetime)

## Plot data and save as png

png('plot2.png')
plot(datetime, df$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)", type="l")
dev.off()