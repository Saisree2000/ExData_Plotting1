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
hist(d$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)

