## Set working directory to include text file.
#setwd("...")

## Read in data file.
df <- read.table("./household_power_consumption.txt",
                 header=TRUE,sep=";",colClasses="character")

## Subset to 2/1/2007 and 2/2/2007.
df <- subset(df,df$Date=="1/2/2007" | df$Date=="2/2/2007")

## Convert date & time to POSIXlt format.
df$dt <- paste(df$Date,df$Time,sep=" ")
df$dt <- strptime(df$dt,format="%d/%m/%Y %H:%M:%S")

## Convert to numeric
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

## Plot
png("./plot3.png",height=480,width=480)
plot(df$dt,df$Sub_metering_1,type="n",
     xlab="",ylab="Energy sub metering")
lines(df$dt,df$Sub_metering_1,col="black")
lines(df$dt,df$Sub_metering_2,col="red")
lines(df$dt,df$Sub_metering_3,col="blue")
legend(x="topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"))
dev.off()