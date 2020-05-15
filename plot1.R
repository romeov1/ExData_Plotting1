##Exploratory Data Analysis, week1 assignment. plot1 generation

#load libraries
library(lubridate)
#read data from dowloaded unzipped dataset
data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";",na.strings="?")
#specify date and time classes (otherwise read as chr)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- hms(data$Time)
#extract only relevant portion
dataset <- subset(data, Date== "2007-02-01" | Date=="2007-02-02")
#plot1: histogram of global active power in png
png("plot1.png", width=480, height=480)
hist(dataset$Global_active_power, col = "red",xlab="Global Active Power (kilowatts)", main= "Global Active Power", font.main=2)
dev.off()