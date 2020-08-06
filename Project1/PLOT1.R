## Read data 
> household_power_consumption <- read.csv("~/ejemplo/household_power_consumption.txt", sep=";", na.strings="?")
>   View(household_power_consumption)
> View(household_power_consumption)
> powerc<- household_power_consumption

## Change date format to DATE type
> powerc$Date= as.Date(powerc$Date, format = "%d/%m/%Y")

## Filter Dates for 2007-02-01 and 2007-02-02
> powerc <- subset(powerc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
> View(powerc)

## PLOT 1


> png(filename = "plot1.png", width = 480, height = 480)

> hist(powerc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

> dev.off()