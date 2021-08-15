#Average Temperature in Brazilian Cities

#Dataset
#http://berkeleyearth.org/data

#installing packages and libraries.
install.packages('readr')
install.packages('data.table')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('scales')
library(dplyr)
library(readr)
library(ggplot2)
library(scales)
library(data.table)


##LOADING DATAS

#Testing loading perfomance

#Using csv2
system.time(db_teste1 <- read.csv2('AverageTemperature.csv'))

#Using table
system.time(db_teste2 <- read.table('AverageTemperature.csv'))

#Using fread
system.time(db_teste3 <- fread('AverageTemperature.csv'))
?fread

?system.time

#fread() function will be used because it has a shorter loading time. 
db <- fread('AverageTemperature.csv')

#Creating subset
brazilCities <- subset(db, Country == 'Brazil')
#Removing NA values
brazilCities <- na.omit(brazilCities)
?na.omit

#Database Details
head(brazilCities)
nrow(db)
nrow(brazilCities)
dim(brazilCities)


#PREPARATION AND ORGANIZATION

#DATA CONVERTING
brazilCities$dt <- as.POSIXct(brazilCities$dt,format='%Y-%m-%d')
brazilCities$Month <- month(brazilCities$dt)
brazilCities$Year <- year(brazilCities$dt)
?as.POSIXct
?month
?year


#Loading subsets per cities

#Palmas
plm <- subset(brazilCities, City == "Palmas")
plm <- subset(plm, Year %in% c(1796,1846,1896,1946,1996,2012))

#Curitiba
crt <- subset(brazilCities, City == "Curitiba")
crt <- subset(crt, Year %in% c(1796,1846,1896,1946,1996,2012))

#Recife
rcf <- subset(brazilCities, City == "Recife")
rcf <- subset(rcf, Year %in% c(1796,1846,1896,1946,1996,2012))


#Building plots
p_plm <- ggplot(plm, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Month") +
  ylab("Average Temperature") +
  scale_color_discrete("") +
  ggtitle("Average Temperature over the years in Palmas")
  theme(plot.title = element_text(size = 18))
  
p_crt <- ggplot(crt, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Month") +
  ylab("Average Temperature") +
  scale_color_discrete("") +
  ggtitle("Average Temperature over the years in Curitiba")
  theme(plot.title = element_text(size = 18))

p_rcf <- ggplot(rcf, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Month") +
  ylab("Average Temperature") +
  scale_color_discrete("") +
  ggtitle("Average Temperature over the years in Recife")
  theme(plot.title = element_text(size = 18))
  
#Plot
p_plm
p_crt
p_rcf
  