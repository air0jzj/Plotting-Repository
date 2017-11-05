Plot2 <- function() {

  filename <- "household_power_consumption.txt"
  
  data <- read.table(filename, header =  TRUE, sep = ";")
  
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ] 
  
  data <- data[!(data$Global_active_power == "?"), ]
  
  data$datetime <- paste(data$Date,data$Time)

  data$datetime <- as.POSIXlt(data$datetime,format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone())
  
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  
  png("plot2.png",width = 480, height = 480)
  
  plot(data$datetime,data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
  
  dev.off()

}