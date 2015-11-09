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
#================
### order by date and time
NewData2 <- NewData[order(DT),]
dev.off()
png("plot2.png")
plot(NewData2$DT,NewData2$Global_active_power,type="n",ylab="",xlab="",
     xlim=as.POSIXct(c("2007-02-01 00:00:00 PST","2007-02-03 00:00:00 PST")))
lines(NewData2$DT,NewData2$Global_active_power, type="l") 
tickpos <- seq(as.POSIXlt("2007-02-01 00:00:00 PST"), as.POSIXlt("2007-02-03 00:00:00 PST"), by="day")
axis.POSIXct(side=1, at=tickpos)
title(main="", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
#=====================
# create some data
tmp <- seq(as.POSIXct("1890-03-01", tz="GMT"),
           as.POSIXct("1920-03-01", tz="GMT"),
           by="month")
df <- data.frame(date=tmp,
                 val=rnorm(length(tmp)))

# plot data
plot(df$date, df$val, xaxt="n")
tickpos <- seq(as.POSIXct("1890-01-01", tz="GMT"),
               as.POSIXct("1920-01-01", tz="GMT"),
               by="5 years")
axis.POSIXct(side=1, at=tickpos)
