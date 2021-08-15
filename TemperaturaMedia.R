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

#Testando desempenho dos carregamentos

#Using csv2
system.time(db_teste1 <- read.csv2('AverageTemperature.csv'))

#Using table
system.time(db_teste2 <- read.table('AverageTemperature.csv'))

#Using fread
system.time(db_teste3 <- fread('AverageTemperature.csv'))
?fread

?system.time

#A função fread() será utilizada por ter um tempo menor de carregamento.
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


#PREPARAÇÃO E ORGANIZAÇÃO

#Convertendo as Datas
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
recf <- subset(brazilCities, City == "Recife")
recf <- subset(recf, Year %in% c(1796,1846,1896,1946,1996,2012))
