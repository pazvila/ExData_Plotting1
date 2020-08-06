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

##PLOT 2

> png(filename = "plot2.png", width = 480, height = 480)

> with(powerc, plot(Global_active_power~Datetime, type="l", ylab = "Global Active Power (Kilowatts)", xlab= "", ))

> dev.off()