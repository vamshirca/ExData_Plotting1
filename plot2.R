library(data.table)
library(dplyr)
epc<-fread("./household_power_consumption.txt")
epc_sub<-filter(epc, as.Date(epc$Date,format="%d/%m/%Y")>=as.Date("2007-02-01") & as.Date(epc$Date,format="%d/%m/%Y")<=as.Date("2007-02-02"))

png(filename = "plot2.png",width = 480, height = 480)
with(epc_sub, plot(strptime(paste(epc_sub$Date, epc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ,
                   as.numeric(epc_sub$Global_active_power),
                   type="l",
                   xlab="",
                   ylab="Global Active Power (kilowatts"))
dev.off()
