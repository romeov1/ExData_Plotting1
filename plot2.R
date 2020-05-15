##Exploratory Data Analysis, week1 assignment. plot2 generation

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
#plot2
png("plot2.png", width=480, height=480)
with(dataset, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()