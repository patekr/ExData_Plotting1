data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
#read in the text file - there are headers for the columns and the data is separated by semi-colons

dates <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
#subset the data by date - %in% will find data with those dates in the file

datetime <- strptime(paste(dates$Date, dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Use the srtrptime() function to classify date and time variables (this is for the x axis)

globalactivepower <- as.numeric(dates$Global_active_power)
#grabbing the subset data of the global active power variable and classifying as numeric

png("plot2.png", width = 480, height = 480)
#launch png graphics device

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#create plot of date/time and global active power data with the specified labels

dev.off()
#close graphics device