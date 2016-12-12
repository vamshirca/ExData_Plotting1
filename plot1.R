library(data.table)
epc<-fread("./household_power_consumption.txt")
epc_sub<-filter(epc, as.Date(epc$Date,format="%d/%m/%Y")>=as.Date("2007-02-01") & as.Date(epc$Date,format="%d/%m/%Y")<=as.Date("2007-02-02"))

png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(epc_sub$Global_active_power), col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
