temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode='wb')
files <- unzip(temp)
electric <- read.table("household_power_consumption.txt", sep =";", header=TRUE, stringsAsFactors= FALSE)
electric_2day <- electric[which(electric$Date == '1/2/2007' | electric$Date == '2/2/2007'),]
electric_2day$datetime <- strptime(paste(electric_2day$Date, electric_2day$Time), format="%d/%m/%Y %H:%M:%S")
electric_2day$Global_active_power <- as.numeric(electric_2day$Global_active_power)
electric_2day$Global_reactive_power <- as.numeric(electric_2day$Global_reactive_power)


##plot2
png(file="plot2.png")
plot(electric_2day$datetime, electric_2day$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
