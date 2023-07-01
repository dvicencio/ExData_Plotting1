data_power <- read.csv(path, header=TRUE, sep=';',nrows=2075259, na.strings="?", 
                       check.names=F, stringsAsFactors=FALSE, comment.char="", quote='\"')

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

data <- subset(data_power, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(data$Date), data$Time)

data$Datetime <- as.POSIXct(datetime)

png("output/plot2.png", width = 480, height = 480)

plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
