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

#####make histogram plot
png(filename="Plot1.png", width=480, height=480)

with(relevantData, hist(as.numeric(as.character(Global_active_power)), col="red", xlab="Global Active Power (kilowatts)",
                        main="Global Active Power"))

dev.off()

