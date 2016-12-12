library(data.table)
library(dplyr)
epc<-fread("./household_power_consumption.txt")
epc_sub<-filter(epc, as.Date(epc$Date,format="%d/%m/%Y")>=as.Date("2007-02-01") & as.Date(epc$Date,format="%d/%m/%Y")<=as.Date("2007-02-02"))

png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

#Plot No 1 in 1st Row 1st Col
with(epc_sub, plot(strptime(paste(epc_sub$Date, epc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ,
                   as.numeric(epc_sub$Global_active_power),
                   type="l",
                   xlab="",
                   ylab="Global Active Power"))

#Plot No 2 in 1st Row 2nd Col
with(epc_sub, plot(strptime(paste(epc_sub$Date, epc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ,
                   as.numeric(epc_sub$Voltage),
                   type="l",
                   xlab="datetime",
                   ylab="Voltage"))

#Plot No 3 in 2nd Row 1st Col
with(epc_sub, plot(strptime(paste(epc_sub$Date, epc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ,
                   epc_sub$Sub_metering_1,
                   type="l",
                   xlab="",
                   ylab="Energy sub metering"))
lines(strptime(paste(epc_sub$Date, epc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ,
      epc_sub$Sub_metering_2,
      col="red",
      type="l" 
)
lines(strptime(paste(epc_sub$Date, epc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ,
      epc_sub$Sub_metering_3,
      col="blue",
      type="l" 
)
legend("topright",lty=1,lwd=3,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot No 4 in 2nd Row 2nd Col
with(epc_sub, plot(strptime(paste(epc_sub$Date, epc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ,
                   as.numeric(epc_sub$Global_reactive_power),
                   type="l",
                   xlab="datetime",
                   ylab="Global_reactive_power"))

dev.off()
