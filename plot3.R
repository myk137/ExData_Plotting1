
## nrows=48*60, skip=((31+15)*24+6)*60+37
dataset <- read.table("household_power_consumption.txt", nrows=2880, skip=66637, sep=";", na.strings="?")
dataset_variable_names <- read.table("household_power_consumption.txt", nrows=1, sep=";")
colnames(dataset) <- dataset_variable_names

dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time),format="%d/%m/%Y %H:%M:%S")
png(filename="plot3.png", width=480, height=480)
plot(dataset$DateTime, dataset$Sub_metering_1, 
     xlab="", ylab="Energy sub metering", ylim=c(0,40), type="l", col = "black")
lines(dataset$DateTime, dataset$Sub_metering_2, col = "red")
lines(dataset$DateTime, dataset$Sub_metering_3, col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1)
dev.off()