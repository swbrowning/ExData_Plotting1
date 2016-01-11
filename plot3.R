#Week 1 Exploratory Data Analysis

#load all the data
all <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE)
#convert to date
all$Date1 <- as.Date(all$Date, "%d/%m/%Y")
#subset
smallset <- subset(all, all$Date1 >= "2007-02-01" & all$Date1 <= "2007-02-02")
#conver to number
smallset$Global_active_power <- as.numeric(smallset$Global_active_power)
smallset$Sub_metering_1 <- as.numeric(smallset$Sub_metering_1)
smallset$Sub_metering_2 <- as.numeric(smallset$Sub_metering_2)
smallset$Sub_metering_3 <- as.numeric(smallset$Sub_metering_3)
#convert to date and time
smallset$DateTime <- as.POSIXct(paste(smallset$Date1, smallset$Time), format="%Y-%m-%d %H:%M:%S")
#graphics device
png(filename="plot3.png", height=480, width=480)
#plot
with(smallset, plot( smallset$DateTime, smallset$Sub_metering_1, ylab="Energ sub meeting", xlab="", type="l"))
lines(smallset$DateTime, smallset$Sub_metering_2, col="red")
lines(smallset$DateTime, smallset$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
#graphics device off
dev.off()