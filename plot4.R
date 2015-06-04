library(sqldf)
data<-read.csv.sql("household_power_consumption.txt", sep=";",sql = "select * from file where Date in ('1/2/2007','2/2/2007' )" )

## replacing the calender date by proper one 

data[data=='1/2/2007']<-'2007-02-01'
data[data=='2/2/2007']<-'2007-02-02'

## create a new column adding Date and Time 

data$fulltime=paste(data$Date, data$Time, sep=',')

## translate the fulltime from a "character" variable into a "POSIXct" variable

data$fulltime<- strptime(data$fulltime, format="%Y-%m-%d, %H:%M:%S" )

## start the creation of the plot4. png

png(file='plot4.png')

## Plotting

## splitting screen in 4 parts 

par(mfrow=c(2,2))

## Plot 1

plot(data$fulltime,data$Global_active_power, ylab='Global Active Power', xlab='',type='l')

## Plot 2 

plot(data$fulltime, data$Voltage, type='l', lwd=1, ylab='Voltage', xlab='datetime')

## Plot 3

plot(data$fulltime, data$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab="")
lines(data$fulltime, data$Sub_metering_1, col='black')
lines(data$fulltime, data$Sub_metering_2, col='blue')
lines(data$fulltime, data$Sub_metering_3, col='red')
legend('topright', lty=1, col=c('black', 'blue','red'), legend=c("Sub_metering_1","Sub_metering_3","Sub_metering_3"), cex=0.5)


## Plot 4

plot(data$fulltime, data$Global_reactive_power, type='l', lwd=1, ylab='Global_reactive_power', xlab='datetime')


## finalizing the creation of theplot1. png
dev.off() 