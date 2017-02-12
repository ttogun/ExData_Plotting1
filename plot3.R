##EDA Project 1
## Taiwo A. Togun

####
setwd("~/../Dropbox/Coursera/DataScience/ExploratoryAnalysis/ExData_Plotting1")
## load data
### assumes there's a folder in current directory called Datasets, which contains data of interest
data<-read.table("./Datasets/household_power_consumption.txt", header=T, sep= ";")
## get relevant data
relevantDateIndx <-as.Date(data$Date,format="%d/%m/%Y")>=as.Date("2007-02-01") & as.Date(data$Date,format="%d/%m/%Y")<=as.Date("2007-02-02")

relevantData <- data[relevantDateIndx,]
rm(data)
#save(relevantData, file="project1Data.Rdata")

#load("project1Data.Rdata")

## create a compound date-time variable 
data <- within(relevantData, Datetime <- as.POSIXlt(paste(as.character(Date),as.character(Time)),format="%d/%m/%Y %H:%M:%S"))

png(filename="Plot3.png", width=480, height=480)

with(data,plot(data$Datetime, as.numeric(as.character(Sub_metering_1)), type="l", ylab="Energy sub metering",
               xlab=""))
with(data,points(data$Datetime, as.numeric(as.character(Sub_metering_2)), type="l", col="red"))
with(data,points(data$Datetime, as.numeric(as.character(Sub_metering_3)), type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"))

dev.off()

