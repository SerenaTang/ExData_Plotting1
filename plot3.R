## Exploratory Data Analysis - WEEK 1 - plot3.R
## Course Project
## 12-15-2017

##########################################################################
#####1. Reads dataset ####################################################
##########################################################################

#### Downloads dataset 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE)
unlink(temp)

#### Converts Date and Time from factors to dates and times
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- format(strptime(data$Time, "%H:%M:%S"), "%H:%M:%S")

#### Subsetting data for dates between 2007-02-01 and 2007-02-02
feb.data<- data[(data$Date>="2007-02-01"&data$Date<="2007-02-02"),]

#### Cleaning date and time
dateTime <- paste(feb.data$Date, feb.data$Time, sep=" ")
dateTime <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")

##########################################################################
#####2. Energy Sub Metering ##############################################
##########################################################################

png(filename = "plot3.png", width = 480, height = 480)
plot3 <- plot(x=dateTime, 
              y=as.numeric(as.character(feb.data$Sub_metering_1)),
              type = "l",
              xlab="",
              ylab="Energy sub metering") 
lines(x=dateTime, y=as.numeric(as.character(feb.data$Sub_metering_2)), col="red")
lines(x=dateTime, y=as.numeric(as.character(feb.data$Sub_metering_3)), col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, 
       col=c("black", "red","blue"))
dev.off()