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

#Plotting the histogram of Global Active Power vs Frequency with labels
hist(p$Global_active_power, freq = TRUE, xlab = "Global Active Power (kilowatts)", ylab = "Frequency",main = "Global Active Power", col = "red", xlim = c(0,6), ylim = c(0,1200))

##copying the plot to png grphic device from screen
dev.copy(png, file="plot1.png", width = 480, height = 480)

##Getting out of png file
dev.off()