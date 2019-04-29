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
regije.2009 <- regije.2009[c(-2)]
regije.2010 <- regije.2010[c(-2)]
regije.2011 <- regije.2011[c(-2)]
regije.2012 <- regije.2012[c(-2)]
regije.2013 <- regije.2013[c(-2)]
regije.2014 <- regije.2014[c(-2)]
regije.2015 <- regije.2015[c(-2)]
regije.2016 <- regije.2016[c(-2)]
regije.2017 <- regije.2017[c(-2)]


zemljevid.2008.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2008,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2008') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2008.regije$labels$fill <- 'Regije 2008'

#========================================================================================================

zemljevid.2009.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2009,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2009') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2009.regije$labels$fill <- 'Regije 2009'

#========================================================================================================

zemljevid.2010.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2010,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2010') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2010.regije$labels$fill <- 'Regije 2010'

#========================================================================================================

zemljevid.2011.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2011,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2011') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2011.regije$labels$fill <- 'Regije 2011'

#========================================================================================================

zemljevid.2012.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2012,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2012') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2012.regije$labels$fill <- 'Regije 2012'

#========================================================================================================

zemljevid.2013.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2013,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2013') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2013.regije$labels$fill <- 'Regije 2013'

#========================================================================================================

zemljevid.2014.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2014,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2014') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2014.regije$labels$fill <- 'Regije 2014'

#========================================================================================================

zemljevid.2015.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2015,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2015') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2015.regije$labels$fill <- 'Regije 2015'

#========================================================================================================

zemljevid.2016.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2016,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2016') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2016.regije$labels$fill <- 'Regije 2016'

#========================================================================================================

zemljevid.2017.regije <- ggplot() +
  geom_polygon(data = anti_join(regije.2017,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill= regije1))+
  xlab("") + ylab("") + ggtitle('Regije 2017') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#ffb3b3', high='#660000')
zemljevid.2017.regije$labels$fill <- 'Regije 2017'

#========================================================================================================