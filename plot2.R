##
## Source code for Assignment #1 - Exploratory Data Analysis - Plot 2
##


##
##      Load the TXT file, subset to kept only required time frame, change to numeric and POSIX
##      format

# pData <- read.table("~/Documents/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt",sep=";",header=TRUE)

pData <- read.table("~/Courseca/household_power_consumption.txt",sep=";",header=TRUE)

# Reduce the data set size
pDataS <- subset(pData, (pData$Date =="1/2/2007" | pData$Date == "2/2/2007")) 


# Make required variabtles numeric

pDataS$Global_active_power <- as.numeric(as.character(pDataS$Global_active_power))
pDataS$Global_reactive_power <- as.numeric(as.character(pDataS$Global_reactive_power))
pDataS$Voltage <- as.numeric(as.character(pDataS$Voltage))
pDataS$Global_intensity <- as.numeric(as.character(pDataS$Global_intensity))
pDataS$Sub_metering_1 <- as.numeric(as.character(pDataS$Sub_metering_1))
pDataS$Sub_metering_2 <- as.numeric(as.character(pDataS$Sub_metering_2))

## Create a POSIX date variable

pDataS$DT <- paste(as.character(pDataS$Date),as.character(pDataS$Time),sep = " ")
pDataS$DT <- as.POSIXct(strptime(pDataS$DT, '%d/%m/%Y %H:%M:%S'))


# Create File

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)

## Create Plot 

par(mfrow = c(1,1))
plot(pDataS$DT,pDataS$Global_active_power, ylab = "Global Active Power (killowatts)",xlab="",type="l")

## Save to a file

dev.off()