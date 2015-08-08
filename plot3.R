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

plot3 <- function() {
        with(data, {
                plot(Sub_metering_1~Datetime, type = "l",
                     ylab = "Energy sub metering", xlab = "")
                lines(Sub_metering_2~Datetime, col = "Red")
                lines(Sub_metering_3~Datetime, col = "Blue")
        })
        legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, cex=.5, pt.cex = 1,
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
}
plot3()