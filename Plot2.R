# reading relevant data
txtData <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=T)

# Subsetting data for only mentioned dates
datasubset <- subset(txtData, txtData$Date == "1/2/2007" | txtData$Date == "2/2/2007")
datasubset$Date <- as.Date(datasubset$Date, "%d/%m/%Y")

# Creating column combining Date & Time
DateTime <- paste(datasubset$Date, datasubset$Time)
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)

# 2nd Plot - Creating graph of Global Active power Vs DateTime
plot(datasubset$Global_active_power, datasubset$DateTime, type = "l", xlab = "", ylab = "Global Active power (kilowatts)", main = "Global Active Power Vs Date/ Time")
