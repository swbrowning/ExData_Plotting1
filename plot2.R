#Week 1 Exploratory Data Analysis

#load all the data
all <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE)
#convert to date
all$Date1 <- as.Date(all$Date, "%d/%m/%Y")
#subset
smallset <- subset(all, all$Date1 >= "2007-02-01" & all$Date1 <= "2007-02-02")
#conver to number
smallset$Global_active_power <- as.numeric(smallset$Global_active_power)
#convert to date and time
smallset$DateTime <- as.POSIXct(paste(smallset$Date1, smallset$Time), format="%Y-%m-%d %H:%M:%S")
#graphics device
png(filename="plot2.png", height=480, width=480)
#plot
with(smallset, plot(smallset$DateTime, smallset$Global_active_power, ylab="Gobal Active Power (kilowatts)", xlab="", type="l"))
#graphics device off
dev.off()