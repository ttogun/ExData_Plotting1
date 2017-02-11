##EDA Project 1
## Taiwo A. Togun

####
setwd("~/../Dropbox/Coursera/DataScience/ExploratoryAnalysis")
## load data

data<-read.table("./Datasets/household_power_consumption.txt", header=T, sep= ";")
## get relevant data
relevantDateIndx <-as.Date(data$Date,format="%d/%m/%Y")>=as.Date("2007-02-01") &
  as.Date(data$Date,format="%d/%m/%Y")<=as.Date("2007-02-02")

relevantData <- data[relevantDateIndx,]
rm(data)
save(relevantData, file="project1Data.Rdata")
