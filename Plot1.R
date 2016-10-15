
# reading relevant data
txtData <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=T)
str(txtData)

# Subsetting data for only mentioned dates
datasubset <- subset(txtData, txtData$Date == "1/2/2007" | txtData$Date == "2/2/2007")
datasubset$Date <- as.Date(datasubset$Date, "%d/%m/%Y")

# Creating column combining Date & Time
DateTime <- paste(datasubset$Date, datasubset$Time)

datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)

# 1st Plot - Creating histogram for Global Active Power
hist(datasubset$Global_active_power, col="Red", main = "Global Active Power", xlab = "Global Active power (kilowatts)", ylab="Frequency")
