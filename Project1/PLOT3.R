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


## PLOT3
png(filename = "plot3.png", width = 480, height = 480) 

with(powerc, plot(Datetime, Sub_metering_1, type="n", xlab= "", ylab= "Energy sub metering"))
 
with(powerc, lines(Datetime, Sub_metering_1, ))
 
 with(powerc, lines(Datetime, Sub_metering_1, col = "black" ))
 
 with(powerc, lines(Datetime, Sub_metering_2, col = "red" ))

 with(powerc, lines(Datetime, Sub_metering_3, col = "blue" ))
 
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  dev.off()