#Temperatura Média nas Cidades Brasileiras

#Dataset
#http://berkeleyearth.org/data

#Instalando e carregando pacotes
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


#Carregando o dataset


##CARREGANDO DADOS

#Testando desempenho dos carregamentos

#Usando o csv2
system.time(db_teste1 <- read.csv2('AverageTemperature.csv'))

#Usando o table
system.time(db_teste2 <- read.table('AverageTemperature.csv'))

#Usando o fread
system.time(db_teste3 <- fread('AverageTemperature.csv'))
?fread

?system.time

#UA função fread() será utilizada por ter um tempo menor de carregamento.
db <- fread('AverageTemperature.csv')