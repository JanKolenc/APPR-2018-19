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
source('uvoz/uvoz.r', encoding = 'UTF-8')

Slovenija <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1") %>% fortify()
colnames(Slovenija)[12]<-'Regija'
Slovenija$Regija <- gsub('GoriÅ¡ka', 'Goriška', Slovenija$Regija)
Slovenija$Regija <- gsub('KoroÅ¡ka', 'Koroška', Slovenija$Regija)
Slovenija$Regija <- gsub('Notranjsko-kraÅ¡ka', 'Notranjsko-kraška', Slovenija$Regija)
Slovenija$Regija <- gsub('Obalno-kraÅ¡ka', 'Obalno-kraška', Slovenija$Regija)

graf.slovenija.zemljevid <- ggplot(Slovenija, aes(x=long, y=lat, fill=Regija)) +
  geom_polygon(show.legend = TRUE, inherit.aes = TRUE) +
  labs(title="Slovenija po regijah")+
  theme_classic()


regije.2008 <- filter(regije1, Leto == '2008')
regije.2009 <- filter(regije1, Leto == '2009')
regije.2010 <- filter(regije1, Leto == '2010')
regije.2011 <- filter(regije1, Leto == '2011')
regije.2012 <- filter(regije1, Leto == '2012')
regije.2013 <- filter(regije1, Leto == '2013')
regije.2014 <- filter(regije1, Leto == '2014')
regije.2015 <- filter(regije1, Leto == '2015')
regije.2016 <- filter(regije1, Leto == '2016')
regije.2017 <- filter(regije1, Leto == '2017')

regije.2008 <- regije.2008[c(-2)]


zemljevid.2008.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2008,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Brezposelnost v letu 2007') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2008.regije$labels$fill <- 'Stopnja registrirane brezposelnosti'



