library(readr)
library(reshape2)
library(dplyr)

sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")
sl <- locale(encoding = "Windows-1250")

izobrazba <- read.csv2("izobrazba.csv", col.names=c("1","Starost", "Izobrazba", "Spol",2008:2017),
                na="-",dec = ".", header = FALSE) 
izobrazba <- izobrazba[,-1]

#========================================================================================================
#TABELA1 - Izobrazba 16+ let

izobrazba16m <- izobrazba[c(1, 3, 5,7),-1]

izobrazba16m.stopnja <- melt(izobrazba16m, id.vars="Izobrazba", measure.vars=names(izobrazba16m)[-1],
                    variable.name="Leto", value.name="Odstotki",
                    na.rm=TRUE)
izobrazba16m.stopnja <- izobrazba16m.stopnja[5:44,]

rownames(izobrazba16m.stopnja) <- seq(length=nrow(izobrazba16m.stopnja))

rownames(izobrazba16m.stopnja) <- seq(length=nrow(izobrazba16m.stopnja))

izobrazba16m.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba16m.stopnja$Leto))

colnames(izobrazba16m.stopnja) <- c("Izobrazba","Leto","Odstotki")

izobrazba16z <- izobrazba[c(2, 4, 6,8),-1]

izobrazba16z.stopnja <- melt(izobrazba16z, id.vars="Izobrazba", measure.vars=names(izobrazba16z)[-1],
                             variable.name="Leto", value.name="Odstotki",
                             na.rm=TRUE)
izobrazba16z.stopnja <- izobrazba16z.stopnja[5:44,]

rownames(izobrazba16z.stopnja) <- seq(length=nrow(izobrazba16z.stopnja))

izobrazba16z.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba16z.stopnja$Leto))

colnames(izobrazba16z.stopnja) <- c("Izobrazba","Leto","Odstotki")


#========================================================================================================
#TABELA2 - Izobrazba 18+ let

izobrazba18m <- izobrazba[c(9, 11, 13,15),-1]

izobrazba18m.stopnja <- melt(izobrazba18m, id.vars="Izobrazba", measure.vars=names(izobrazba18m)[-1],
                             variable.name="Leto", value.name="Odstotki",
                             na.rm=TRUE)
izobrazba18m.stopnja <- izobrazba18m.stopnja[5:44,]

rownames(izobrazba18m.stopnja) <- seq(length=nrow(izobrazba18m.stopnja))

rownames(izobrazba18m.stopnja) <- seq(length=nrow(izobrazba18m.stopnja))

izobrazba18m.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba18m.stopnja$Leto))

colnames(izobrazba18m.stopnja) <- c("Izobrazba","Leto","Odstotki")

izobrazba18z <- izobrazba[c(10, 12, 14,16),-1]

izobrazba18z.stopnja <- melt(izobrazba18z, id.vars="Izobrazba", measure.vars=names(izobrazba18z)[-1],
                             variable.name="Leto", value.name="Odstotki",
                             na.rm=TRUE)
izobrazba18z.stopnja <- izobrazba18z.stopnja[5:44,]

rownames(izobrazba18z.stopnja) <- seq(length=nrow(izobrazba18z.stopnja))

izobrazba18z.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba18z.stopnja$Leto))

colnames(izobrazba18z.stopnja) <- c("Izobrazba","Leto","Odstotki")

#========================================================================================================
#TABELA3 - Izobrazba 18-64 let

izobrazba64m <- izobrazba[c(17, 19, 21,23),-1]

izobrazba64m.stopnja <- melt(izobrazba64m, id.vars="Izobrazba", measure.vars=names(izobrazba64m)[-1],
                             variable.name="Leto", value.name="Odstotki",
                             na.rm=TRUE)
izobrazba64m.stopnja <- izobrazba64m.stopnja[5:44,]

rownames(izobrazba64m.stopnja) <- seq(length=nrow(izobrazba64m.stopnja))

rownames(izobrazba64m.stopnja) <- seq(length=nrow(izobrazba64m.stopnja))

izobrazba64m.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba64m.stopnja$Leto))

colnames(izobrazba64m.stopnja) <- c("Izobrazba","Leto","Odstotki")

izobrazba64z <- izobrazba[c(18, 20, 22,24),-1]

izobrazba64z.stopnja <- melt(izobrazba64z, id.vars="Izobrazba", measure.vars=names(izobrazba64z)[-1],
                             variable.name="Leto", value.name="Odstotki",
                             na.rm=TRUE)
izobrazba64z.stopnja <- izobrazba64z.stopnja[5:44,]

rownames(izobrazba64z.stopnja) <- seq(length=nrow(izobrazba64z.stopnja))

izobrazba64z.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba64z.stopnja$Leto))

colnames(izobrazba64z.stopnja) <- c("Izobrazba","Leto","Odstotki")

#========================================================================================================
#TABELA4 - Izobrazba 65+ let

izobrazba65m <- izobrazba[c(25, 27, 29,31),-1]

izobrazba65m.stopnja <- melt(izobrazba65m, id.vars="Izobrazba", measure.vars=names(izobrazba65m)[-1],
                             variable.name="Leto", value.name="Odstotki",
                             na.rm=TRUE)
izobrazba65m.stopnja <- izobrazba65m.stopnja[5:44,]

rownames(izobrazba65m.stopnja) <- seq(length=nrow(izobrazba65m.stopnja))

rownames(izobrazba65m.stopnja) <- seq(length=nrow(izobrazba65m.stopnja))

izobrazba65m.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba65m.stopnja$Leto))

colnames(izobrazba65m.stopnja) <- c("Izobrazba","Leto","Odstotki")

izobrazba65z <- izobrazba[c(26, 28, 30,32),-1]

izobrazba65z.stopnja <- melt(izobrazba65z, id.vars="Izobrazba", measure.vars=names(izobrazba65z)[-1],
                             variable.name="Leto", value.name="Odstotki",
                             na.rm=TRUE)
izobrazba65z.stopnja <- izobrazba65z.stopnja[5:44,]

rownames(izobrazba65z.stopnja) <- seq(length=nrow(izobrazba65z.stopnja))

izobrazba65z.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba65z.stopnja$Leto))

colnames(izobrazba65z.stopnja) <- c("Izobrazba","Leto","Odstotki")
#========================================================================================================
#TABELE 5-14  - Leta 2008-2009
T2008 <- izobrazba[1:4]
colnames(T2008) <- c("Starost","Izobrazba","Spol","2008")
T2009 <- izobrazba[c(1, 2, 3,5)]
colnames(T2009) <- c("Starost","Izobrazba","Spol","2009")
T2010 <- izobrazba[c(1, 2, 3,6)]
colnames(T2010) <- c("Starost","Izobrazba","Spol","2010")
T2011 <- izobrazba[c(1, 2, 3,7)]
colnames(T2011) <- c("Starost","Izobrazba","Spol","2011")
T2012 <- izobrazba[c(1, 2, 3,8)]
colnames(T2012) <- c("Starost","Izobrazba","Spol","2012")
T2013 <- izobrazba[c(1, 2, 3,9)]
colnames(T2013) <- c("Starost","Izobrazba","Spol","2013")
T2014 <- izobrazba[c(1, 2, 3,10)]
colnames(T2014) <- c("Starost","Izobrazba","Spol","2014")
T2015 <- izobrazba[c(1, 2, 3,11)]
colnames(T2015) <- c("Starost","Izobrazba","Spol","2015")
T2016 <- izobrazba[c(1, 2, 3,12)]
colnames(T2016) <- c("Starost","Izobrazba","Spol","2016")
T2017 <- izobrazba[c(1, 2, 3,13)]
colnames(T2017) <- c("Starost","Izobrazba","Spol","2017")

#========================================================================================================
#TABELA15 - Prag

prag <- read_csv2("prag.csv", col.names=c("1","Valuta", "Tip gospodinjstva", 2005:2017),
                       na="-",dec = ".") 
prag <- prag[,-1]

starost <- read.csv2("starost.csv", col.names=c("1","Starost", "Spol",2005:2017),
                       na="-",dec = ".",encoding = "UTF-8") 
starost <- starost[,-1]



