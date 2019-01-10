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

prag <- read_csv2("prag.csv", col.names=c("1","Valuta", "Tip gospodinjstva", 2005:2017),
                       na="-",dec = ".") 
prag <- prag[,-1]

starost <- read.csv2("starost.csv", col.names=c("1","Starost", "Spol",2005:2017),
                       na="-",dec = ".",encoding = "UTF-8") 
starost <- starost[,-1]

