
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
