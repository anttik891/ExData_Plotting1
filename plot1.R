#Plots a histogram of Global ative power from 
#household_power_consumption.txt file as well as makes a png file of it

library(lubridate)

        #reads the data, subsets the correct parts and formats the date and 
        #time variables
Sys.setlocale("LC_TIME", "English")
households <- read.table("./household_power_consumption.txt",
                        nrows = 2080000,sep = ";",header = TRUE ,na.strings = "?"    )

households[,1] <- as.Date(households[,1], format = "%d/%m/%Y")
households <- households[households[,1] == "2007-02-01" | households[,1] == "2007-02-02",]

        #sets the correct parameters for screen device
par(mfcol = c(1,1))
hist(households$Global_active_power,col = "red",xlab = "Global Active Power (Kilowatts)",main = "Global Active Power")

        #Creates a png file
png(filename = "plot1.png")
hist(households$Global_active_power,col = "red",xlab = "Global Active Power (Kilowatts)",main = "Global Active Power")
dev.off()