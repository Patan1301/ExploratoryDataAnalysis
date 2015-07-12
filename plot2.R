#First command to read the entire data set on exdatahousehold_power_consmption
p <- read.csv("E:/Data Science/Data Sciece/4. EDA/exdatadatahousehold_power_consumption/household_power_consumption.txt", sep=";",stringsAsFactors = FALSE)

#Convert Date class from character -> Date
p$Date<- as.Date(p$Date,format="%d/%m/%Y")

#Subsetting the given data set From Feb 1, 2007 to Feb 2, 2007
p=subset(p,Date >="2007-02-01" & Date<="2007-02-02")

#Converting unknown values("?") to NA's
na.strings<-"?"

##Converting Global_active_power into a numeric class for making plots ( character cannot be used for making plot)
p$Global_active_power<-as.numeric(p$Global_active_power)

#Combining Date and Time into a new column of p$new
p$New <- as.POSIXct(paste(p$Date, p$Time), format="%Y-%m-%d %H:%M:%S")

#Plot of Global_active_power vs Date&Time combined
plot(p$New, p$Global_active_power, type = "l", col = "black", ann = F)

#Title for the plot
title(sub = " ", ylab = "Global Active Power (kiloWatts)")

#dev.copy to copy the plot created on screen to the png file
dev.copy(png, file="plot2.png", width = 480, height = 480)
#exit png file
dev.off()