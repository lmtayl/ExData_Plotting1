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
df$gap <- as.numeric(df$Global_active_power)

## Plot
png("./plot2.png",height=480,width=480)
plot(df$dt,df$gap,type="n",
     xlab="",ylab="Global Active Power (kilowatts)")
lines(df$dt,df$gap)
dev.off()