Plot1 <- function() {
  filename <- "household_power_consumption.txt"
  
  col_spec <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  
  data <- read.table(filename, header =  TRUE, sep = ";")
  
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ] 
  
  data <- data[!(data$Global_active_power == "?"), ]
  
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

 showdata <<- data
 
 png("plot1.png",width = 480, height = 480)
 hist(data$Global_active_power, breaks = 11, main = "Global Active Power",col = "red", xlab = "Global Active Power (kilowatts)",ylim = c(1,1200))
 dev.off()
## hist(data$global_active_power)
}