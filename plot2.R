## read in table with just the two days  1/2/2007 and 2/2/2007

library(sqldf)
data<-read.csv.sql("household_power_consumption.txt", sep=";",sql = "select * from file where Date in ('1/2/2007','2/2/2007' )" )

## replacing the calender date by proper one (do I really need it?)

data[data=='1/2/2007']<-'2007-02-01'
data[data=='2/2/2007']<-'2007-02-02'

## create a new column adding Date and Time 

data$fulltime=paste(data$Date, data$Time, sep=',')

## translate the fulltime from a "character" variable into a "POSIXct" variable

data$fulltime<- strptime(data$fulltime, format="%Y-%m-%d, %H:%M:%S" )

## start the creation of the plot2. png

png(file='plot2.png')

## Plotting "Global_active_power" vs fulltime

plot(data$fulltime,data$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='',type='l')
## finalizing the creation of theplot1. png
dev.off() 