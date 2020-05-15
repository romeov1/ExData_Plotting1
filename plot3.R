##Exploratory Data Analysis, week1 assignment. plot3 generation

#load libraries
library(lubridate)
#read data from dowloaded unzipped dataset
data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";",na.strings="?")
#specify date class (otherwise read as chr)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#extract only relevant portion of data
dataset <- subset(data, Date== "2007-02-01" | Date=="2007-02-02")
#merge date and time to generate continues timeline
dataset$datetime <- paste(dataset$Date, dataset$Time)
dataset$datetime <- ymd_hms(dataset$datetime)
#plot3
png("plot3.png", width=480, height=480)
with(dataset, plot(datetime,Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering"))
lines(dataset$datetime,dataset$Sub_metering_2,type="l", col="red")
lines(dataset$datetime,dataset$Sub_metering_3,type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()
