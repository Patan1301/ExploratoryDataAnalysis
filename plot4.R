#First command to read the entire data set on exdatahousehold_power_consmption
p <- read.csv("E:/Data Science/Data Sciece/4. EDA/exdatadatahousehold_power_consumption/household_power_consumption.txt", sep=";",stringsAsFactors = FALSE)

#make Date class from the given dates
p$Date<- as.Date(p$Date,format="%d/%m/%Y")

#Subsetting the given data from Feb 1, 2007 to Feb 2, 2007
p=subset(p,Date >="2007-02-01" & Date<="2007-02-02")

#converting "?"(missing values) to NA
na.strings<-"?"

#Combining Date and Time into a new column p$New
p$New <- as.POSIXct(paste(p$Date, p$Time), format="%Y-%m-%d %H:%M:%S")

#Convert the class of Global_active_power, Global_reactive_power, Voltage to numeric for graphing
p$Global_reactive_power<- as.numeric(p$Global_reactive_power)
p$Global_active_power<- as.numeric(p$Global_active_power)
p$Voltage<- as.numeric(p$Voltage)

#dividing the graphic area into a 2*2 matrix of plots
par(mfrow = c(2,2))


### MOST IMPORTANT: I used dev.copy here because the legend part of the third graph is required.
###Please go to the working directory where the plot4(png file) is created from this file. 
##The dev.copy copies from the screen graphic window and then processes commands after placing the plots in png file.


dev.copy(png, file="plot4.png", width = 480, height = 480)

#PLOT-1:
plot(p$New, p$Global_active_power, type = "l", ann = T, xlab = " ", ylab = "Global Active Power")

#PLOT-2:
plot(p$New, p$Voltage, type = "l", ann = T, xlab = "datetime", ylab = "Voltage")

#PLOT-3:
plot_colors <- c("black", "red", "blue")
plot(p$New, p$Sub_metering_1,type = "l", col = plot_colors[1], ann = TRUE, xlab = " ", ylab = "Energy sub metering", lwd = 1)
lines(p$New, p$Sub_metering_2, type = "l", col = plot_colors[2], lwd = 1)
lines(p$New, p$Sub_metering_3, type = "l", col = plot_colors[3], lwd = 1)
legend("topright", names(p[7:9]), col = plot_colors[1:3], lwd = 1, bty="n")

#PLOT-4:
plot(p$New, p$Global_reactive_power, type="l", ann = T, xlab = "datetime", ylab = "Global_reactive_power")

#Getting out of the png file created
dev.off()