temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode='wb')
files <- unzip(temp)
electric <- read.table("household_power_consumption.txt", sep =";", header=TRUE, stringsAsFactors= FALSE)
electric_2day <- electric[which(electric$Date == '1/2/2007' | electric$Date == '2/2/2007'),]
electric_2day$datetime <- strptime(paste(electric_2day$Date, electric_2day$Time), format="%d/%m/%Y %H:%M:%S")
electric_2day$Global_active_power <- as.numeric(electric_2day$Global_active_power)
electric_2day$Global_reactive_power <- as.numeric(electric_2day$Global_reactive_power)

##plot1
png(file="plot1.png")
with(electric_2day, hist(electric_2day$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="lightgray"))
dev.off()