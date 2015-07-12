#First command to read the entire data in the given exdatahousehold_power_consumption
p <- read.csv("E:/Data Science/Data Sciece/4. EDA/exdatadatahousehold_power_consumption/household_power_consumption.txt", sep=";",stringsAsFactors = FALSE)

#Convert Date class from character -> Date
p$Date<- as.Date(p$Date,format="%d/%m/%Y")

#Subsetting the given data set From Feb 1, 2007 to Feb 2, 2007
p=subset(p,Date >="2007-02-01" & Date<="2007-02-02")

#Converting unknown values("?") to NA's
na.strings<-"?"

#Combining Date and Time into a new column of p$new
p$New <- as.POSIXct(paste(p$Date, p$Time), format="%Y-%m-%d %H:%M:%S")

#different colors for different metering lines
plot_colors <- c("black", "red", "blue")

#Plotting first sub-metering plot
plot(p$New, p$Sub_metering_1,type = "l", col = plot_colors[1], ann = TRUE, xlab = " ", ylab = "Energy sub metering", lwd = 1)

#including the lines corresponding to sub-metering 2 & 3 in the same plot
lines(p$New, p$Sub_metering_2, type = "l", col = plot_colors[2], lwd = 1)
lines(p$New, p$Sub_metering_3, type = "l", col = plot_colors[3], lwd = 1)

##copying the plot to png grphic device from screen

dev.copy(png, file="plot3.png", width = 480, height = 480)

##Legend for plot
legend("topright", names(p[7:9]), col = plot_colors[1:3], lwd = 1)

##Getting out of png file
dev.off()