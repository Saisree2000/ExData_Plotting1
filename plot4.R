filename <- "./Project-1/household_power_consumption.zip"
file <- "./Project-1/household_power_consumption.txt"
if(!file.exists(file)){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",filename,method="curl")
  unzip(filename,overwrite = TRUE,exdir="./Project-1")
}
d <- read.table(file,header=TRUE,sep=";", na.strings = "?")
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d <- subset(d,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
d$Time <- strptime(paste(d$Date,d$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(d$Time, d$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
plot(d$Time, d$Voltage,type="l",col="black",xlab="datetime",ylab="Voltage")
linescol <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(d$Time, d$Sub_metering_1, type="l", col=linescol[1], xlab="", ylab="Energy sub metering")
lines(d$Time, d$Sub_metering_2, col=linescol[2])
lines(d$Time, d$Sub_metering_3, col=linescol[3])
legend("topright", legend=labels, col=linescol, lty="solid")
plot(d$Time,d$Global_reactive_power,type="l",col="black",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()