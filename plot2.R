#Plots a line graph of Global ative power from 
#household_power_consumption.txt file as well as makes a png file of it


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

        #makes the plot
plot(households[,1],households[,2], type = "n", xlab = "", ylab = " Global Active Power (Kilowatts)")
lines(households[,1],households[,2])

        #creates a png file
png(filename = "plot2.png")
plot(households[,1],households[,2], type = "n", xlab = "", ylab = " Global Active Power (Kilowatts)")
lines(households[,1],households[,2])
dev.off()