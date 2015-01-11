## Set working directory to include text file.
#setwd("...")

## Read in data file.
df <- read.table("./household_power_consumption.txt",
                 header=TRUE,sep=";",colClasses="character")

## Subset to 2/1/2007 and 2/2/2007.
df <- subset(df,df$Date=="1/2/2007" | df$Date=="2/2/2007")

## Convert to numeric
df$gap <- as.numeric(df$Global_active_power)

## Plot 
png("./plot1.png",height=480,width=480)
hist(df$gap,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()