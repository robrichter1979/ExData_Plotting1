## read in table with just the two days  1/2/2007 and 2/2/2007

library(sqldf)
data<-read.csv.sql("household_power_consumption.txt", sep=";",sql = "select * from file where Date in ('1/2/2007','2/2/2007' )" )

## start the creation of the plot1. png

png(file='plot1.png')

## creating the histogram

hist(test$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')

## finalizing the creation of theplot1. png
dev.off() 
