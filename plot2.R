
## nrows=48*60, skip=((31+15)*24+6)*60+37
dataset <- read.table("household_power_consumption.txt", nrows=2880, skip=66637, sep=";", na.strings="?")
dataset_variable_names <- read.table("household_power_consumption.txt", nrows=1, sep=";")
colnames(dataset) <- dataset_variable_names

dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time),format="%d/%m/%Y %H:%M:%S")
png(filename="plot2.png", width=480, height=480)
plot(dataset$DateTime, dataset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", 
     ylim=c(0,8), type="l")
dev.off()