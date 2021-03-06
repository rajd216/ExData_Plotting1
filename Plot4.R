# reading relevant data
txtData <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=T)

# Subsetting data for only mentioned dates
datasubset <- subset(txtData, txtData$Date == "1/2/2007" | txtData$Date == "2/2/2007")
datasubset$Date <- as.Date(datasubset$Date, "%d/%m/%Y")

# Creating column combining Date & Time
DateTime <- paste(datasubset$Date, datasubset$Time)
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)

# 4th Plot - Composite graphs with many graphs
par(mfrow=c(2,2))
# Creating graph for global active power data
plot(datasubset$Global_active_power, datasubset$DateTime, type="l")
plot(datasubset$Sub_metering_1, datasubset$DateTime, type="l")
lines(datasubset$Sub_metering_2, datasubset$DateTime, col = 'Red')
lines(datasubset$Sub_metering_3, datasubset$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =2, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(datasubset$Voltage, datasubset$DateTime, type="l")
plot(datasubset$Global_reactive_power, datasubset$DateTime, type="l")
