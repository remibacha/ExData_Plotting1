#Plot 2
library(ggplot2)
qplot(filtered_dataset$Date_Time,filtered_dataset$Global_active_power, geom = "path", xlab = "", ylab = "Global Active Power (kilowatts)" )
#meme chose avec plot = plot(filtered_dataset$Date_Time,filtered_dataset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
