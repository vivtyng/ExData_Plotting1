### reading data
RT <- read.csv("household_power_consumption.txt", sep=";", colClasses=c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = c("NA", "NaN", "?"))
### subset to two specific dates
RS1 <- RT[RT$Date=="1/2/2007",]
RS2 <- RT[RT$Date=="2/2/2007",]
SS <- rbind(RS1,RS2)
### parse the time and date
Dparsed <- as.Date(SS$Date, "%d/%m/%Y")
DT <- paste(Dparsed,SS$Time)
DT <- strptime(DT, "%Y-%m-%d %H:%M:%S") 
NewData <- cbind(DT,SS)
### output plot 1
png("plot1.png")
hist(NewData$Global_active_power,col="red", main="",xlab="")
title(main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
