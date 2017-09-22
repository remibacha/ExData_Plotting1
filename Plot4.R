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

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(filtered_dataset, {
  plot(Global_active_power~Date_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Date_Time, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Date_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date_Time,col='Red')
  lines(Sub_metering_3~Date_Time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Date_Time, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
