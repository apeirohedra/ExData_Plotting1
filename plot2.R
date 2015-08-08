# Getting full dataset

raw_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                     nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

# Subsetting the data

data <- subset(raw_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates

dateandtime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(dateandtime)

# Plot figure and save it

plot2 <- function() {
        # plot timeseries
        plot(data$Global_active_power~data$Datetime, type = "l",
             ylab = "Global Active Power (kilowatts)", xlab = "")
        # make .png file
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
}
plot2()