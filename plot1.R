
## nrows=48*60, skip=((31+15)*24+6)*60+37
dataset <- read.table("household_power_consumption.txt", nrows=2880, skip=66637, sep=";", na.strings="?")
dataset_variable_names <- read.table("household_power_consumption.txt", nrows=1, sep=";")
colnames(dataset) <- dataset_variable_names

png(filename="plot1.png", width=480, height=480)
hist(dataset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", main="Global Active Power", ylim=c(0,1200))
dev.off()