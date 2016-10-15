# reading relevant data
txtData <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=T)

# Subsetting data for only mentioned dates
datasubset <- subset(txtData, txtData$Date == "1/2/2007" | txtData$Date == "2/2/2007")
datasubset$Date <- as.Date(datasubset$Date, "%d/%m/%Y")

# Creating column combining Date & Time
DateTime <- paste(datasubset$Date, datasubset$Time)
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)

# 3rd Plot - Creating grapg for Sub- Metering 1, 2 & 3 Vs DateTime
datasubset$Sub_metering_1 <- as.numeric(datasubset$Sub_metering_1)
plot(datasubset$Sub_metering_1, datasubset$DateTime, type = "l", xlab = "", ylab = "Energy Sub Metering", main = "Sub-Metering 1, 2 & 3 V/s DateTime")
lines(datasubset$Sub_metering_2, datasubset$DateTime, col = 'Red')
lines(datasubset$Sub_metering_3, datasubset$DateTime, col = 'Blue')
legend("topright", lty=1, lwd = 2, col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

