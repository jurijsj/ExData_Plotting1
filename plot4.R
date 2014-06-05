download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
unzip("power_consumption.zip")
data<- read.delim("household_power_consumption.txt", sep=";", dec=".", na.strings="?", skip = 66636, nrows=2880)
names(data) <-tolower(c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dt <- paste(data$date, data$time, sep=" " )
dt<- strptime(dt, format = "%d/%m/%Y %H:%M:%S")
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(dt, data$global_active_power, type="l", ylab="Global Active Power", xlab=NA)

plot(dt, data$voltage, type="l", ylab="Voltage", xlab="datetime")

plot(dt, data[,"sub_metering_1"], type="l", ylab="Energy sub metering", xlab=NA)
points(dt,data[,"sub_metering_2"], col="red", type='l')
points(dt,data[,"sub_metering_3"], col="blue", type='l')
legend("topright", col=c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")

plot(dt, data$global_reactive_power, type="l",  ylab = "global_reactive_power", xlab="datetime")

dev.off()