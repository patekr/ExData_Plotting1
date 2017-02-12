data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
#read in the text file - there are headers for the columns and the data is separated by semi-colons

dates <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
#subset the data by date - %in% will find data with those dates in the file

datetime <- strptime(paste(dates$Date, dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Use the srtrptime() function to classify date and time variables (this is for the x axis)

globalactivepower <- as.numeric(dates$Global_active_power)
#grabbing the subset data of the global active power variable and classifying as numeric

submetering1 <- as.numeric(dates$Sub_metering_1)
submetering2 <- as.numeric(dates$Sub_metering_2)
submetering3 <- as.numeric(dates$Sub_metering_3)
#grabbing the subset data of the 3 submetering variables and classifying as numeric

globalreactivepower <- as.numeric(dates$Global_reactive_power)
#grabbing the subset data of the global reactive power variable and classifying as numeric

voltage <- as.numeric(dates$Voltage)
#grabbing the subset data of the voltage variable and classifying as numeric

png("plot4.png", width = 480, height = 480)
#launch png graphics device

par(mfrow = c(2,2))
#display plots in two columns and two rows

plot(datetime, globalactivepower, type="l", ylab="Global Active Power", xlab="")
#create plot of date/time and global active power variable with the specified labels

plot(datetime, voltage, type ="l", xlab = "datetime", ylab = "Voltage")
#create plot of date/time and voltage variable with the specified labels

plot(datetime, submetering1, type = "l", ylab = "Energy Submetering", xlab = "")
#create plot of date/time and submetering1 variable with the specified labels

lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
#add lines for the other two submetering variables in the specified colors

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#add legend in top right corner of the three variables, solid lines - colors in order to match variables

plot(datetime, globalreactivepower, type="l", xlab = "datetime", ylab = "Global_reactive_power")
#create plot of date/time and global reactive power variable with the specified labels

dev.off()
#close graphics device