## Exploratory Data Analysis - WEEK 1 - plot1.R
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

##########################################################################
#####2. Histogram of Global Active Power##################################
##########################################################################
png(filename = "plot1.png", width = 480, height = 480)
plot1<- hist(as.numeric(as.character(feb.data$Global_active_power)), 
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power"
     )
dev.off()
