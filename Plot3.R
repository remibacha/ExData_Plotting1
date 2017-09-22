setwd("~/Documents/Scripts_R/Coursera")
fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "~/Documents/Scripts_R/Coursera/household_power_consumption.zip", method = "curl")
unzip("household_power_consumption.zip")
dataset <- read.table("household_power_consumption.txt",header=TRUE,sep = ";", na.strings = "?")

dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")
dataset$Time <- as.character(dataset$Time)
dataset[, c(3,4,5,6,7,8,9)] <- sapply(dataset[, c(3,4,5,6,7,8,9)], as.numeric)
filtered_dataset <- subset(dataset, Date>="2007-02-01" & Date<="2007-02-02") 
filtered_dataset <- filtered_dataset[complete.cases(filtered_dataset),]
filtered_dataset$Date_Time <- as.POSIXct(paste(filtered_dataset$Date, filtered_dataset$Time), format="%Y-%m-%d %H:%M:%S")

#Plot 3
with(dataset, {
  plot(filtered_dataset$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(filtered_dataset$Sub_metering_2,col='Red')
  lines(filtered_dataset$Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
