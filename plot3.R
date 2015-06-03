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

## start the creation of the plot3. png

png(file='plot3.png')

## Plotting 
plot(data$fulltime, data$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab="")
lines(data$fulltime, data$Sub_metering_1, col='black')
lines(data$fulltime, data$Sub_metering_2, col='blue')
lines(data$fulltime, data$Sub_metering_3, col='red')
legend('topright', lty=1, col=c('black', 'blue','red'), legend=c("Sub_metering_1","Sub_metering_3","Sub_metering_3"))

## finalizing the creation of theplot1. png
dev.off() 