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
