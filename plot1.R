#Week 1 Exploratory Data Analysis

#load all the data
all <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE)
#convert to date
all$Date1 <- as.Date(all$Date, "%d/%m/%Y")
#subset
smallset <- subset(all, all$Date1 >= "2007-02-01" & all$Date1 <= "2007-02-02")
#conver to number
smallset$Global_active_power <- as.numeric(smallset$Global_active_power)
#graphics device
png(filename="plot1.png", height=480, width=480)
#plot
with(smallset, hist(smallset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Gobal Active Power"))
#graphics device off
dev.off()