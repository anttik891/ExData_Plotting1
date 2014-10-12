#Plots a line graph of different energy sub metering variables from 
#household_power_consumption.txt file as well as makes a png file from them

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
par(mfcol = c(1,1))

        #Generates the plot
plot(x=households[,1] ,y = households[,6], type = "n",ylab = "Energy Sub Metering", xlab = "")
lines(x=households[,1] ,y = households[,6])
lines(x=households[,1] ,y = households[,7],col = "red")
lines(x=households[,1] ,y = households[,8], col = "blue")
legend("topright", col = c("black","blue", "red"),lty = 1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 1)

        #Create a png file
png(filename = "plot3.png")
plot(x=households[,1] ,y = households[,6], type = "n",ylab = "Energy Sub Metering", xlab = "")
lines(x=households[,1] ,y = households[,6])
lines(x=households[,1] ,y = households[,7],col = "red")
lines(x=households[,1] ,y = households[,8], col = "blue")
legend("topright", col = c("black","blue", "red"),lty = 1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 1)
dev.off()

