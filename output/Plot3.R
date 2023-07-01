data_power <- read.csv(path, header=TRUE, sep=';',nrows=2075259, na.strings="?", 
                       check.names=F, stringsAsFactors=FALSE, comment.char="", quote='\"')

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

data <- subset(data_power, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(data$Date), data$Time)

data$Datetime <- as.POSIXct(datetime)

png("output/plot3.png", width = 480, height = 480)

with(data, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

