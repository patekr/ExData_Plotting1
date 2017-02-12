data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
#read in the text file - there are headers for the columns and the data is separated by semi-colons

dates <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
#subset the data by date - %in% will find data with those dates in the file

globalactivepower <- as.numeric(dates$Global_active_power)
#grabbing the subset data of the global active power variable and classifying as numeric

png("plot1.png", width = 480, height = 480)
#launch png graphics device

hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#create histogram of global active power data in red with the specified labels

dev.off()
#close graphics device