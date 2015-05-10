## Read File using 'sqldf' package

setwd("C:/Users/Dexter/Desktop/R")
library(sqldf)
df <- read.csv.sql("household_power_consumption.txt", 
                   "select * from file where date in ('1/2/2007','2/2/2007') ", 
                   header=TRUE, sep=";")

## Convert date format

df$Date <- strptime(df$Date, format="%d/%m/%Y")
df$Date <- as.Date(df$Date)

## Create plot1 histogram and save as png

png('plot1.png')
hist(df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)",
     col="red")
dev.off()