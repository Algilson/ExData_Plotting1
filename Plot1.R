Previously saved workspace restored]

> getwd()
[1] "C:/Users/algilson/Documents"
> setwd("C:/Users/algilson/Desktop")
> #access data and name it
> electric_power_data<- read.table("household_power_consumption.txt", sep = ";" , na.strings="?", header=TRUE)
> #check to see if the data loaded
> head(electric_power_data)
        Date     Time Global_active_power Global_reactive_power Voltage
1 16/12/2006 17:24:00               4.216                 0.418  234.84
2 16/12/2006 17:25:00               5.360                 0.436  233.63
3 16/12/2006 17:26:00               5.374                 0.498  233.29
4 16/12/2006 17:27:00               5.388                 0.502  233.74
5 16/12/2006 17:28:00               3.666                 0.528  235.68
6 16/12/2006 17:29:00               3.520                 0.522  235.02
  Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
1             18.4              0              1             17
2             23.0              0              1             16
3             23.0              0              2             17
4             23.0              0              1             17
5             15.8              0              1             17
6             15.0              0              2             17
> #reorganize the date and time
> #to reflect the dates requested
> electric_power_data_revised<- electric_power_data[electric_power_data$Date %in% c("1/2/2007","2/2/2007"),]
> #Set the time so it is easier to read
> SetTime <-strptime(paste(electric_power_data_revised$Date, electric_power_data_revised$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
> electric_power_data_revised<-cbind(SetTime, electric_power_data_revised)
> #be prepared to save the image of the hist in a png file
> png("plot1.png",width=480, height=480)
> #createthe hist
> hist(electric_power_data_revised$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
