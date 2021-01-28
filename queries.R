library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)
dbListFields(MyDataBase, 'CountryLanguage')
data1 <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
head(data1)

library(dplyr)
español<-filter(data1, Language == "Spanish") #funcion de dplyr

library(ggplot2)
ggplot(español,aes(CountryCode,Percentage))+geom_bar(stat = "identity", aes(fill=IsOfficial)) + coord_flip()
