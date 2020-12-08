########### Read in data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")


########### Convert the Date variable to date format
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")


########### Subset the data to only these two dates
hpc_sub <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", ]


########### Combine the Date and Time variables and format as POSIXlt
hpc_sub$DateTime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), format = "%Y-%m-%d %H:%M:%S")


########### Open a png graphics device
png(filename = "plot4.png", width = 480, height = 480)


########### Create plots
par(mfrow = c(2,2))

        
        #### top left
        plot(hpc_sub$DateTime, hpc_sub$Global_active_power, 
             type = "n",
             ylab = "Global Active Power",
             xlab = "")

        lines(hpc_sub$DateTime, hpc_sub$Global_active_power)
        
        
        #### top right
        plot(hpc_sub$DateTime, hpc_sub$Voltage, 
             type = "n",
             ylab = "Voltage",
             xlab = "datetime")
        
        lines(hpc_sub$DateTime, hpc_sub$Voltage)
        
        
        #### bottom left
        plot(hpc_sub$DateTime, hpc_sub$Sub_metering_1, 
             type = "n",
             ylab = "Energy sub metering",
             xlab = "")
        
        lines(hpc_sub$DateTime, hpc_sub$Sub_metering_1)
        lines(hpc_sub$DateTime, hpc_sub$Sub_metering_2, col = "red")
        lines(hpc_sub$DateTime, hpc_sub$Sub_metering_3, col = "blue")
        
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

        
        #### bottom right
        plot(hpc_sub$DateTime, hpc_sub$Global_reactive_power, 
             type = "n",
             ylab = "Global_reactive_power",
             xlab = "datetime")
        
        lines(hpc_sub$DateTime, hpc_sub$Global_reactive_power)
        

########### Close graphics device and create .png file
dev.off()