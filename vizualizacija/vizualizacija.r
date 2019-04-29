library(ggplot2)
library(ggvis)
library(dplyr)
library(rgdal)
library(mosaic)
library(maptools)
library(maps)
library(plotly)

source(file = 'lib/uvozi.zemljevid.r', encoding = 'UTF-8')
source('lib/libraries.r', encoding = 'UTF-8')
source('uvoz/uvoz_test.r', encoding = 'UTF-8')

graf.prostih.delovnih.mest.regije <- ggplot((data=prosta.delovna.mesta), aes(x=Leto, y=Stevilo.prostih.delovnih.mest, col=Regija)) + 
  geom_point() + geom_line() + theme_classic() +  scale_x_continuous('Leto',breaks = seq(2001, 2011, 1), limits = c(2001, 2011)) + labs(title='Prosta delovna mesta Slovenije po regijah 2001-2011')