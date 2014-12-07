library(data.table)

data <- fread("household_power_consumption.txt",na.string = "?",sep=";")

t1=as.Date("2007-02-01")
t2=as.Date("2007-02-02")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dat1 <- data[data$Date %in% c(t1,t2)]
rm(data)
dat1$Global_active_power <- as.numeric(dat1$Global_active_power)
datetime <- strptime(paste(dat1$Date, dat1$Time),"%Y-%m-%d %H:%M:%S")

#plot 1
hist(dat1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.copy(png,'plot1.png')
dev.off()

#plot 2
plot(dat1$Global_active_power,type="l",main = NULL,xlab = "", ylab = "Global Active Power (kilowatts)",xaxt='n')
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
dev.copy(png,'plot2.png')
dev.off()

#plot 3
plot(dat1$Sub_metering_1,type="l",col="black",xaxt="n",ylab="Energy sub metering")
lines(dat1$Sub_metering_2,type="l",col="red")
lines(dat1$Sub_metering_3,type="l",col="blue")
legend("topright",legend=names(dat1)[7:9],lty=c(1,2,3),col=c("black","red","blue"),bg="white",lwd=2)
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
dev.copy(png,'plot3.png')
dev.off()

#plot 4
par(mfrow=c(2,2))
plot(dat1$Global_active_power,type="l",main = NULL,xlab = "", ylab = "Global Active Power (kilowatts)",xaxt='n')
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

plot(dat1$Voltage,type="l",main = NULL,xlab = "", ylab = "Voltage",xaxt='n')
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

plot(dat1$Sub_metering_1,type="l",col="black",xaxt="n",ylab="Energy sub metering")
lines(dat1$Sub_metering_2,type="l",col="red")
lines(dat1$Sub_metering_3,type="l",col="blue")
legend("topright",legend=names(dat1)[7:9],lty=c(1,2,3),col=c("black","red","blue"),bg="white",lwd=2)
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

plot(dat1$Global_reactive_power,type="l",main = NULL,xlab = "",xaxt='n')
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
dev.copy(png,'plot4.png')
dev.off()