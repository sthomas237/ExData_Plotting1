# plot4.R

# Coursera, Exploratory Data Analysis, Peng, Leek, Caffo, July 2014
# Course Project 1: Plotting Electric Power Consumption
# Scott D. Thomas, http://www.linkedin.com/in/sthomas237

# Our overall goal here is simply to examine how household energy usage varies
# over a 2-day period in February, 2007. Your task is to reconstruct the
# following plots below, all of which were constructed using the base plotting
# system.
#
# First you will need to fork and clone the following GitHub repository:
# https://github.com/rdpeng/ExData_Plotting1
#
# For each plot you should Construct the plot and save it to a PNG file with a
# width of 480 pixels and a height of 480 pixels.
#
# Name each of the plot files as plot1.png, plot2.png, etc.
#
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the
# corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your
# code file should include code for reading the data so that the plot can be
# fully reproduced. You should also include the code that creates the PNG file.
#
# Add the PNG file and R code file to your git repository
#
# When you are finished with the assignment, push your git repository to GitHub
# so that the GitHub version of your repository is up to date. There should be
# four PNG files and four R code files.

# Read the power consumption data
fileName = "household_power_consumption.txt"
data <- read.table(fileName,header=TRUE,sep=";",na.strings="?")

# Pick off the two days,  2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, "%d/%m/%Y")
L = data$Date == "2007-02-01" | data$Date == "2007-02-02"
dataSubset = data[L,]

# We need to plot with time on the X axis
dataSubset$Time <- strptime(paste(dataSubset$Date,dataSubset$Time),
                            "%Y-%m-%d %H:%M:%S")

# The fourth plot consists of four subplots in a 2x2 table.
# Going down the columns left to right, the first two plots are almost
# the same as the ones created by plot2.R and plot3.R.

png(filename="plot4.png",width=480,height=480)

# Specify that we want to order the 2x2 subplots in columns
# and smaller font size
par(mfcol=c(2,2),cex=0.79)

with(dataSubset, {
  
  # Same code used in plot2.R, except with a shorter y label
  plot(Time,Global_active_power,type="l",
       xlab="",ylab="Global Active Power")
  
  # Same code used in plot3.R, except no legend box boundary (bty="n")
  plot(Time,Sub_metering_1,type="l",col="black",
       xlab="",ylab="Energy sub metering")
  lines(Time,Sub_metering_2,col="red")
  lines(Time,Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),lty=c(1,1,1),ncol=1,
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         bty="n")
  
  plot(Time,Voltage,type="l",xlab="datetime")
  
  plot(Time,Global_reactive_power,type="l",xlab="datetime")
})

dev.off()