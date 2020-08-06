## Read data 
> household_power_consumption <- read.csv("~/ejemplo/household_power_consumption.txt", sep=";", na.strings="?")
>   View(household_power_consumption)
> View(household_power_consumption)
> powerc<- household_power_consumption

## Change date format to DATE type
> powerc$Date= as.Date(powerc$Date, format = "%d/%m/%Y")

## Filter Dates for 2007-02-01 and 2007-02-02
> powerc <- subset(powerc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# converting to date and time class
> powerc$Date <- as.Date(powerc$Date, format="%d/%m/%Y")
> datetime <- paste(as.Date(powerc$Date), powerc$Time)
> powerc$Datetime <- as.POSIXct(datetime)

## PLOT 4
png(filename = "plot4.png", width = 480, height = 480) 

par(mfrow = c(2,2), mar= c(4,4,1,1))

#  1
with(powerc, plot(Global_active_power~Datetime, type="l", ylab = "Global Active Power", xlab= "", ))

#  2
with(powerc, plot(Voltage~Datetime, type="l"))

#  3
with(powerc, plot(Datetime, Sub_metering_1, type="n", xlab= "", ylab= "Energy sub metering"))

with(powerc, lines(Datetime, Sub_metering_1, ))

with(powerc, lines(Datetime, Sub_metering_1, col = "black" ))

with(powerc, lines(Datetime, Sub_metering_2, col = "red" ))

with(powerc, lines(Datetime, Sub_metering_3, col = "blue" ))

legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4 
with(powerc, plot(Global_reactive_power~Datetime, type="l"))

dev.off()
