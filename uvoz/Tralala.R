library(readr)

izobrazba <- read.csv2("izobrazba.csv", col.names=c("1","Starost", "Izobrazba", "Spol",2008:2017),
                na="-",dec = ".") 
izobrazba <- izobrazba[,-1]


prag <- read_csv2("prag.csv", col.names=c("1","Valuta", "Tip gospodinjstva",2005:2017),
                       na="-",dec = ".") 
prag <- prag[,-1]

starost <- read.csv2("starost.csv", col.names=c("1","Starost", "Spol",2005:2017),
                       na="-",dec = ".",encoding = "UTF-8") 
starost <- starost[,-1]
