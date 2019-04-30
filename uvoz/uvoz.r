library(readr)
library(reshape2)
library(dplyr)
library(tidyr)



sl <- locale("sl", encoding = "Windows-1250", decimal_mark=".")



#GLAVNE TABELE
#========================================================================================================
#========================================================================================================
regije1 <- read_delim("podatki/regije.csv", ";", na="-", locale=sl,
                      col_names=c("Stopnja","Regija",2008:2017)) %>%
  select(-1) %>% melt(id.vars=1, variable.name="Leto",
                      value.name="Odstotki", na.rm=TRUE) 
regije1$Leto <- as.character(regije1$Leto) %>% parse_number()
regije1$Regija <- gsub('^Posavska.*', 'Spodnjeposavska', regije1$Regija)
regije1$Regija <- gsub('^Primorsko-notranjska.*', 'Notranjsko-kraška', regije1$Regija)
#========================================================================================================
#========================================================================================================
izobrazba1 <- read_delim("podatki/izobrazba.csv", ";", na="-", locale=sl,
                         col_names=c("1", "Starost", "Izobrazba", "Spol", 2008:2017)) %>%
  select(-1) %>% melt(id.vars=1:3, variable.name="Leto",
                      value.name="Odstotki", na.rm=TRUE) 
izobrazba1$Leto <- as.character(izobrazba1$Leto) %>% parse_number()
#========================================================================================================
#========================================================================================================

prag1 <- read_delim("podatki/prag.csv", ";", na="-", locale=sl,
                    col_names=c("Stopnja1","Stopnja","Tip",2005:2017)) %>%
  select(-1) %>% melt(id.vars=1:2, variable.name="Leto",
                      value.name="Dohodek", na.rm=TRUE) 
prag1$Leto <- as.character(prag1$Leto) %>% parse_number()
prag1 <- prag1[,-1]

#========================================================================================================
#========================================================================================================
#IZVOZ V CSV

write.csv2(regije1,'podatki/tidy_regije.csv', fileEncoding = 'UTF-8')
write.csv2(izobrazba1,'podatki/tidy_izobrazba.csv', fileEncoding = 'UTF-8')
write.csv2(prag1,'podatki/tidy_prag.csv', fileEncoding = 'UTF-8')

#========================================================================================================
#========================================================================================================





# #POMOŽNE TABELE
# #========================================================================================================
# #========================================================================================================
# izobrazba <- read.csv2("podatki/izobrazba.csv", col.names=c("1","Starost", "Izobrazba", "Spol",2008:2017),
#                        na="-",dec = ".", header = FALSE) 
# izobrazba <- izobrazba[,-1]
# 
# 
# #========================================================================================================
# #TABELA1 - Izobrazba 16+ let
# 
# izobrazba16m <- izobrazba[c(1, 3, 5,7),-1]
# 
# izobrazba16m.stopnja <- melt(izobrazba16m, id.vars="Izobrazba", measure.vars=names(izobrazba16m)[-1],
#                     variable.name="Leto", value.name="Odstotki",
#                     na.rm=TRUE)
# izobrazba16m.stopnja <- izobrazba16m.stopnja[5:44,]
# 
# rownames(izobrazba16m.stopnja) <- seq(length=nrow(izobrazba16m.stopnja))
# 
# rownames(izobrazba16m.stopnja) <- seq(length=nrow(izobrazba16m.stopnja))
# 
# izobrazba16m.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba16m.stopnja$Leto))
# 
# colnames(izobrazba16m.stopnja) <- c("Izobrazba","Leto","Odstotki")
# 
# izobrazba16z <- izobrazba[c(2, 4, 6,8),-1]
# 
# izobrazba16z.stopnja <- melt(izobrazba16z, id.vars="Izobrazba", measure.vars=names(izobrazba16z)[-1],
#                              variable.name="Leto", value.name="Odstotki",
#                              na.rm=TRUE)
# izobrazba16z.stopnja <- izobrazba16z.stopnja[5:44,]
# 
# rownames(izobrazba16z.stopnja) <- seq(length=nrow(izobrazba16z.stopnja))
# 
# izobrazba16z.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba16z.stopnja$Leto))
# 
# colnames(izobrazba16z.stopnja) <- c("Izobrazba","Leto","Odstotki")
# 
# 
# #========================================================================================================
# #TABELA2 - Izobrazba 18+ let
# 
# izobrazba18m <- izobrazba[c(9, 11, 13,15),-1]
# 
# izobrazba18m.stopnja <- melt(izobrazba18m, id.vars="Izobrazba", measure.vars=names(izobrazba18m)[-1],
#                              variable.name="Leto", value.name="Odstotki",
#                              na.rm=TRUE)
# izobrazba18m.stopnja <- izobrazba18m.stopnja[5:44,]
# 
# rownames(izobrazba18m.stopnja) <- seq(length=nrow(izobrazba18m.stopnja))
# 
# rownames(izobrazba18m.stopnja) <- seq(length=nrow(izobrazba18m.stopnja))
# 
# izobrazba18m.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba18m.stopnja$Leto))
# 
# colnames(izobrazba18m.stopnja) <- c("Izobrazba","Leto","Odstotki")
# 
# izobrazba18z <- izobrazba[c(10, 12, 14,16),-1]
# 
# izobrazba18z.stopnja <- melt(izobrazba18z, id.vars="Izobrazba", measure.vars=names(izobrazba18z)[-1],
#                              variable.name="Leto", value.name="Odstotki",
#                              na.rm=TRUE)
# izobrazba18z.stopnja <- izobrazba18z.stopnja[5:44,]
# 
# rownames(izobrazba18z.stopnja) <- seq(length=nrow(izobrazba18z.stopnja))
# 
# izobrazba18z.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba18z.stopnja$Leto))
# 
# colnames(izobrazba18z.stopnja) <- c("Izobrazba","Leto","Odstotki")
# 
# #========================================================================================================
# #TABELA3 - Izobrazba 18-64 let
# 
# izobrazba64m <- izobrazba[c(17, 19, 21,23),-1]
# 
# izobrazba64m.stopnja <- melt(izobrazba64m, id.vars="Izobrazba", measure.vars=names(izobrazba64m)[-1],
#                              variable.name="Leto", value.name="Odstotki",
#                              na.rm=TRUE)
# izobrazba64m.stopnja <- izobrazba64m.stopnja[5:44,]
# 
# rownames(izobrazba64m.stopnja) <- seq(length=nrow(izobrazba64m.stopnja))
# 
# rownames(izobrazba64m.stopnja) <- seq(length=nrow(izobrazba64m.stopnja))
# 
# izobrazba64m.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba64m.stopnja$Leto))
# 
# colnames(izobrazba64m.stopnja) <- c("Izobrazba","Leto","Odstotki")
# 
# izobrazba64z <- izobrazba[c(18, 20, 22,24),-1]
# 
# izobrazba64z.stopnja <- melt(izobrazba64z, id.vars="Izobrazba", measure.vars=names(izobrazba64z)[-1],
#                              variable.name="Leto", value.name="Odstotki",
#                              na.rm=TRUE)
# izobrazba64z.stopnja <- izobrazba64z.stopnja[5:44,]
# 
# rownames(izobrazba64z.stopnja) <- seq(length=nrow(izobrazba64z.stopnja))
# 
# izobrazba64z.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba64z.stopnja$Leto))
# 
# colnames(izobrazba64z.stopnja) <- c("Izobrazba","Leto","Odstotki")
# 
# #========================================================================================================
# #TABELA4 - Izobrazba 65+ let
# 
# izobrazba65m <- izobrazba[c(25, 27, 29,31),-1]
# 
# izobrazba65m.stopnja <- melt(izobrazba65m, id.vars="Izobrazba", measure.vars=names(izobrazba65m)[-1],
#                              variable.name="Leto", value.name="Odstotki",
#                              na.rm=TRUE)
# izobrazba65m.stopnja <- izobrazba65m.stopnja[5:44,]
# 
# rownames(izobrazba65m.stopnja) <- seq(length=nrow(izobrazba65m.stopnja))
# 
# rownames(izobrazba65m.stopnja) <- seq(length=nrow(izobrazba65m.stopnja))
# 
# izobrazba65m.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba65m.stopnja$Leto))
# 
# colnames(izobrazba65m.stopnja) <- c("Izobrazba","Leto","Odstotki")
# 
# izobrazba65z <- izobrazba[c(26, 28, 30,32),-1]
# 
# izobrazba65z.stopnja <- melt(izobrazba65z, id.vars="Izobrazba", measure.vars=names(izobrazba65z)[-1],
#                              variable.name="Leto", value.name="Odstotki",
#                              na.rm=TRUE)
# izobrazba65z.stopnja <- izobrazba65z.stopnja[5:44,]
# 
# rownames(izobrazba65z.stopnja) <- seq(length=nrow(izobrazba65z.stopnja))
# 
# izobrazba65z.stopnja$Leto <- as.numeric(gsub("X([0-9]+)","\\1",izobrazba65z.stopnja$Leto))
# 
# colnames(izobrazba65z.stopnja) <- c("Izobrazba","Leto","Odstotki")
# #========================================================================================================
# #TABELE 5-14  - Leta 2008-2009
# I2008 <- izobrazba[1:4]
# colnames(I2008) <- c("Starost","Izobrazba","Spol","2008")
# I2009 <- izobrazba[c(1, 2, 3,5)]
# colnames(I2009) <- c("Starost","Izobrazba","Spol","2009")
# I2010 <- izobrazba[c(1, 2, 3,6)]
# colnames(I2010) <- c("Starost","Izobrazba","Spol","2010")
# I2011 <- izobrazba[c(1, 2, 3,7)]
# colnames(I2011) <- c("Starost","Izobrazba","Spol","2011")
# I2012 <- izobrazba[c(1, 2, 3,8)]
# colnames(I2012) <- c("Starost","Izobrazba","Spol","2012")
# I2013 <- izobrazba[c(1, 2, 3,9)]
# colnames(I2013) <- c("Starost","Izobrazba","Spol","2013")
# I2014 <- izobrazba[c(1, 2, 3,10)]
# colnames(I2014) <- c("Starost","Izobrazba","Spol","2014")
# I2015 <- izobrazba[c(1, 2, 3,11)]
# colnames(I2015) <- c("Starost","Izobrazba","Spol","2015")
# I2016 <- izobrazba[c(1, 2, 3,12)]
# colnames(I2016) <- c("Starost","Izobrazba","Spol","2016")
# I2017 <- izobrazba[c(1, 2, 3,13)]
# colnames(I2017) <- c("Starost","Izobrazba","Spol","2017")
# 
# #========================================================================================================
# #TABELE 15-24 - Prag
# 
# 
# 
# prag <- read.csv2("podatki/prag.csv", col.names=c("Stopnja1","Stopnja","Regija",2005:2017),
#                     na="-",dec = ".", header = FALSE) 
# 
# 
# P2008 <- prag[c(3, 7)]
# colnames(P2008) <- c("Tip gospodinjstva","2008")
# P2009 <- prag[c(3, 8)]
# colnames(P2009) <- c("Tip gospodinjstva","2009")
# P2010 <- prag[c(3, 9)]
# colnames(P2010) <- c("Tip gospodinjstva","2010")
# P2011 <- prag[c(3,10)]
# colnames(P2011) <- c("Tip gospodinjstva","2011")
# P2012 <- prag[c(3,11)]
# colnames(P2012) <- c("Tip gospodinjstva","2012")
# P2013 <- prag[c(3, 12)]
# colnames(P2013) <- c("Tip gospodinjstva","2013")
# P2014 <- prag[c(3,13)]
# colnames(P2014) <- c("Tip gospodinjstva","2014")
# P2015 <- prag[c(3,14)]
# colnames(P2015) <- c("Tip gospodinjstva","2015")
# P2016 <- prag[c(3,15)]
# colnames(P2016) <- c("Tip gospodinjstva","2016")
# P2017 <- prag[c(3, 16)]
# colnames(P2017) <- c("Tip gospodinjstva","2017")
# 
# 
# 
# 
# #========================================================================================================
# #TABELE 25-34 - Regije
# regije <- read.csv2("podatki/regije.csv", col.names=c("Stopnja","Regija",2008:2017),
#                        na="-",dec = ".", header = FALSE) 
# regije <- regije[,-1]
# 
# R2008 <- regije[1:2]
# colnames(R2008) <- c("Regija","2008")
# R2009 <- regije[c(1, 3)]
# colnames(R2009) <- c("Regija","2009")
# R2010 <- regije[c(1, 4)]
# colnames(R2010) <- c("Regija","2010")
# R2011 <- regije[c(1,5)]
# colnames(R2011) <- c("Regija","2011")
# R2012 <- regije[c(1,6)]
# colnames(R2012) <- c("Regija","2012")
# R2013 <- regije[c(1, 7)]
# colnames(R2013) <- c("Regija","2013")
# R2014 <- regije[c(1,8)]
# colnames(R2014) <- c("Regija","2014")
# R2015 <- regije[c(1,9)]
# colnames(R2015) <- c("Regija","2015")
# R2016 <- regije[c(1,10)]
# colnames(R2016) <- c("Regija","2016")
# R2017 <- regije[c(1, 11)]
# colnames(R2017) <- c("Regija","2017")
# #========================================================================================================
# #========================================================================================================

