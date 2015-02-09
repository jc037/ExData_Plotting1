##Read the txt file into R as a table
projdata <- read.table("household_power_consumption.txt", header=FALSE, sep=";",nrows=2880, skip=66637, na.strings="?", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",  "Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"))
##Strip off the date and time columns and combine them into a single character vector
##for use in strptime
datetime <- paste(projdata$Date,projdata$Time)
##Change the dtclass character vector into a date-time class
dtclass <- strptime(datetime, format="%d/%m/%Y %H:%M:%S")
##Add the date-time class vector back on to the original data
projdataplus <- cbind(projdata, dtclass)
##Plot the data graphically
layout(matrix(c(0,1,2,3),nrow=2, ncol=2))
with(projdataplus, plot(dtclass, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(projdataplus, plot(dtclass, Voltage, type="l", xlab="datetime"))
with(projdataplus, plot(dtclass, Sub_metering_1,  type="l", xlab="", ylab="Energy sub metering"))
with(projdataplus, lines(dtclass, Sub_metering_2, col="red"))
with(projdataplus, lines(dtclass, Sub_metering_3, col="blue"))
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"))
with(projdataplus, plot(dtclass, Global_reactive_power, type="l", xlab="datetime"))
