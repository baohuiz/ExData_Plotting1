temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode='wb')
files <- unzip(temp)
electric <- read.table("household_power_consumption.txt", sep =";", header=TRUE, stringsAsFactors= FALSE)
electric_2day <- electric[which(electric$Date == '1/2/2007' | electric$Date == '2/2/2007'),]
electric_2day$datetime <- strptime(paste(electric_2day$Date, electric_2day$Time), format="%d/%m/%Y %H:%M:%S")
electric_2day$Global_active_power <- as.numeric(electric_2day$Global_active_power)
electric_2day$Global_reactive_power <- as.numeric(electric_2day$Global_reactive_power)

##plot3
electric_2day$Sub_metering_1 <- as.numeric(electric_2day$Sub_metering_1)
electric_2day$Sub_metering_2 <- as.numeric(electric_2day$Sub_metering_2)
t <- as.matrix(electric_2day[c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")])
t <- t(t)
colnames(t) <- as.character(electric_2day$datetime)
png(file="plot3.png")
colors <- c("black", "red", "blue")
barplot(t, ylab="Energy sub metering", col=colors, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
