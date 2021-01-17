
## nrows=48*60, skip=((31+15)*24+6)*60+37
dataset <- read.table("household_power_consumption.txt", nrows=2880, skip=66637, sep=";", na.strings="?")
dataset_variable_names <- read.table("household_power_consumption.txt", nrows=1, sep=";")
colnames(dataset) <- dataset_variable_names

dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time),format="%d/%m/%Y %H:%M:%S")
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(dataset, {
        plot(dataset$DateTime, dataset$Global_active_power, xlab="", 
                ylab="Global Active Power", ylim=c(0,8), type="l")
        plot(dataset$DateTime, dataset$Voltage, xlab="datetime", ylab="Voltage", type="l")
        plot(dataset$DateTime, dataset$Sub_metering_1, 
             xlab="", ylab="Energy sub metering", ylim=c(0,40), type="l", col = "black")
        lines(dataset$DateTime, dataset$Sub_metering_2, col = "red")
        lines(dataset$DateTime, dataset$Sub_metering_3, col = "blue")
        legend("topright", lty=1, col = c("black", "red", "blue"), bty="n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.9)
        plot(dataset$DateTime, dataset$Global_reactive_power, xlab="datetime", 
             ylab="Global_reactive_Power", ylim=c(0,0.5), type="l")
})
dev.off()