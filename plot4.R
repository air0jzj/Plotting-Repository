Plot4 <- function() {
  
  filename <- "household_power_consumption.txt"
  
  data <- read.table(filename, header =  TRUE, sep = ";")
  
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ] 
  
  data <- data[!(data$Global_active_power == "?"), ]
  
  data$datetime <- paste(data$Date,data$Time)
  
  data$datetime <- as.POSIXlt(data$datetime,format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone())
  
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  data$Voltage <- as.numeric(as.character(data$Voltage))
  data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
  
  
  png("plot4.png",width = 480, height = 480)
  
  par(mfrow=c(2,2))
  
  plot(data$datetime,data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
  plot(data$datetime,data$Voltage,type = "l",xlab = "datetime",ylab = "Voltage",ylim = c(234,246))
  plot(data$datetime,data$Sub_metering_2,type = "n",ylim=c(0,40),xlab = "",ylab = "Energy Sub Metering")
  lines(data$datetime,data$Sub_metering_1,col = "black")
  lines(data$datetime,data$Sub_metering_2,col = "red")
  lines(data$datetime,data$Sub_metering_3,col = "blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
  plot(data$datetime,data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power",ylim=c(0,.5))
  dev.off()
  
}