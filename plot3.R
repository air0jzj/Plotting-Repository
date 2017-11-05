Plot3 <- function() {
  
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
  
  ##showdata <<- data
  
  png("plot3.png",width = 480, height = 480)
  
  plot(data$datetime,data$Sub_metering_2,type = "n",ylim=c(0,40),xlab = "",ylab = "Energy Sub Metering")
  lines(data$datetime,data$Sub_metering_1,col = "black")
  lines(data$datetime,data$Sub_metering_2,col = "red")
  lines(data$datetime,data$Sub_metering_3,col = "blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)

  dev.off()
  
}