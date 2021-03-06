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

png('plot3.png')
with( df, {plot(datetime, df$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
           lines(datetime,df$Sub_metering_2, col='Red')
           lines(datetime,df$Sub_metering_3, col='Blue')}
)
legend("topright", col=c("black","red","blue"), 
       lty=1, lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)
dev.off()