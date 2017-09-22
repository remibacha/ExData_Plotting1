dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")
dataset$Time <- as.character(dataset$Time)
dataset[, c(3,4,5,6,7,8,9)] <- sapply(dataset[, c(3,4,5,6,7,8,9)], as.numeric)
filtered_dataset <- subset(dataset, Date>="2007-02-01" & Date<="2007-02-02") 
filtered_dataset <- filtered_dataset[complete.cases(filtered_dataset),]
filtered_dataset$Date_Time <- as.POSIXct(paste(filtered_dataset$Date, filtered_dataset$Time), format="%Y-%m-%d %H:%M:%S")

#Plot 1
hist(filtered_dataset$Global_active_power, col = "red", main ="Global Active Power",  xlab="Global Active Power (kilowatts)")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
