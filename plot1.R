########### Read in data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")


########### Convert the Date variable to date format
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")


########### Subset the data to only these two dates
hpc_sub <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", ]


########### Combine the Date and Time variables and format as POSIXlt
hpc_sub$DateTime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), format = "%Y-%m-%d %H:%M:%S")


########### Open a png graphics device
png(filename = "plot1.png", width = 480, height = 480)


########### Create plot
hist(hpc_sub$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")


########### Close graphics device and create .png file
dev.off()