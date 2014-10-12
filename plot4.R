#Plots four different graphs from household_power_consumption.txt file 
#as well as makes a png file from them

library(lubridate)

        #reads the data, subsets the correct parts and formats the date and 
        #time variables
Sys.setlocale("LC_TIME", "English")
households <- read.table("./household_power_consumption.txt",
                         nrows = 2080000,sep = ";",header = TRUE ,na.strings = "?"    )

households[,1] <- as.Date(households[,1], format = "%d/%m/%Y")
households <- households[households[,1] == "2007-02-01" | households[,1] == "2007-02-02",]
households$Time <- strptime(paste(households[,1],households[,2]),
                            format = "%Y-%m-%d %H:%M:%S",tz = "GMT")
households <- households[,2:9]

        #sets the correct parameters for screen device
par(mfcol = c(2,2))
par(mar = c(4,4,1,2))

        #Generates the plots

        #top left
plot(households[,1],households[,2], type = "n", xlab = "", ylab = " Global Active Power")
lines(households[,1],households[,2])

        #bottom left
plot(x=households[,1] ,y = households[,6], type = "n",ylab = "Energy sub metering", xlab = "")
lines(x=households[,1] ,y = households[,6])
lines(x=households[,1] ,y = households[,7],col = "red")
lines(x=households[,1] ,y = households[,8], col = "blue")
legend("topright", col = c("black","blue", "red"),lty = 1,bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 1)


        #top right
plot(x = households$Time,y = households$Voltage, type = "n",ylab = "Voltage", 
     xlab = "datetime")
lines(x = households$Time,y = households$Voltage)

        #bottom right
plot(y = households$Global_reactive_power, x = households[,1],type = "n", 
     ylab = "Global_reactive_power", xlab = "datetime")
lines(y = households$Global_reactive_power, x = households[,1],lwd = 1)


        #create a png file
png(filename = "plot4.png")
par(mfcol = c(2,2))
par(mar = c(4,4,1,2))

        #top left
plot(households[,1],households[,2], type = "n", xlab = "", 
     ylab = " Global Active Power")
lines(households[,1],households[,2])

        #bottom left
plot(x=households[,1] ,y = households[,6], type = "n",
     ylab = "Energy sub metering", xlab = "")
lines(x=households[,1] ,y = households[,6])
lines(x=households[,1] ,y = households[,7],col = "red")
lines(x=households[,1] ,y = households[,8], col = "blue")
legend("topright", col = c("black","blue", "red"),lty = 1,bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 1)


        #top right
plot(x = households$Time,y = households$Voltage, type = "n",ylab = "Voltage", 
     xlab = "datetime")
lines(x = households$Time,y = households$Voltage)

        #bottom right
plot(y = households$Global_reactive_power, x = households[,1],type = "n", 
     ylab = "Global_reactive_power", xlab = "datetime")
lines(y = households$Global_reactive_power, x = households[,1],lwd = 1)

dev.off()