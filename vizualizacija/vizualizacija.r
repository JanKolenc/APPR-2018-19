library(ggplot2)
library(ggvis)
library(dplyr)
library(rgdal)
library(mosaic)
library(maptools)
library(maps)
library(plotly)


#ZEMLJEVIDI
#========================================================================================================
#========================================================================================================
#========================================================================================================

Slovenija <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1") %>% fortify()
colnames(Slovenija)[12]<-'Regija'
# Slovenija$Regija <- gsub('GoriÅ¡ka', 'Goriška', Slovenija$Regija)
# Slovenija$Regija <- gsub('KoroÅ¡ka', 'Koroška', Slovenija$Regija)
# Slovenija$Regija <- gsub('Notranjsko-kraÅ¡ka', 'Notranjsko-kraška', Slovenija$Regija)
# Slovenija$Regija <- gsub('Obalno-kraÅ¡ka', 'Obalno-kraška', Slovenija$Regija)

graf.slovenija.zemljevid <- ggplot(Slovenija, aes(x=long, y=lat, fill=Regija)) +
  geom_polygon(show.legend = TRUE, inherit.aes = TRUE) +
  theme_classic()


# regije.2008 <- filter(regije1, Leto == '2008')
# regije.2009 <- filter(regije1, Leto == '2009')
# regije.2010 <- filter(regije1, Leto == '2010')
# regije.2011 <- filter(regije1, Leto == '2011')
# regije.2012 <- filter(regije1, Leto == '2012')
# regije.2013 <- filter(regije1, Leto == '2013')
# regije.2014 <- filter(regije1, Leto == '2014')
# regije.2015 <- filter(regije1, Leto == '2015')
# regije.2016 <- filter(regije1, Leto == '2016')
# regije.2017 <- filter(regije1, Leto == '2017')
# 
# regije.2008 <- regije.2008[c(-2)]
# regije.2009 <- regije.2009[c(-2)]
# regije.2010 <- regije.2010[c(-2)]
# regije.2011 <- regije.2011[c(-2)]
# regije.2012 <- regije.2012[c(-2)]
# regije.2013 <- regije.2013[c(-2)]
# regije.2014 <- regije.2014[c(-2)]
# regije.2015 <- regije.2015[c(-2)] 
# regije.2016 <- regije.2016[c(-2)]
# regije.2017 <- regije.2017[c(-2)]

# 
# zemljevid.2008.regije <- ggplot() +
#   geom_polygon(data=right_join(regije.2008, Slovenija, by=c('Regija')),
#                aes(x=long, y=lat, group=group, fill=Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2007') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(),
#         axis.ticks=element_blank(), panel.background=element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',
#                       name='Stopnja tveganja revščine')
# 
# #========================================================================================================
# 
# zemljevid.2009.regije <- ggplot() +
#   geom_polygon(data = right_join(regije.2009,Slovenija, by = c('Regija')),
#                aes(x = long, y = lat, group = group, fill=Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2009') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(8,22))
# zemljevid.2009.regije$labels$fill <- 'Stopnja tveganja revščine'
# 
# #========================================================================================================
# 
# zemljevid.2010.regije <- ggplot() +
#   geom_polygon(data = right_join(regije.2010,Slovenija, by = c('Regija')),
#                aes(x = long, y = lat, group = group, fill= Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2010') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(8,22))
# zemljevid.2010.regije$labels$fill <- 'Stopnja tveganja revščine'
# 
# #========================================================================================================
# 
# zemljevid.2011.regije <- ggplot() +
#   geom_polygon(data = right_join(regije.2011,Slovenija, by = c('Regija')),
#                aes(x = long, y = lat, group = group, fill= Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2011') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(8,22))
# zemljevid.2011.regije$labels$fill <- 'Stopnja tveganja revščine'
# 
# #========================================================================================================
# 
# zemljevid.2012.regije <- ggplot() +
#   geom_polygon(data = right_join(regije.2012,Slovenija, by = c('Regija')),
#                aes(x = long, y = lat, group = group, fill= Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2012') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(8,22))
# zemljevid.2012.regije$labels$fill <- 'Stopnja tveganja revščine'
# 
# #========================================================================================================
# 
# zemljevid.2013.regije <- ggplot() +
#   geom_polygon(data = right_join(regije.2013,Slovenija, by = c('Regija')),
#                aes(x = long, y = lat, group = group, fill= Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2013') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(8,22))
# zemljevid.2013.regije$labels$fill <- 'Stopnja tveganja revščine'
# 
# #========================================================================================================
# 
# zemljevid.2014.regije <- ggplot() +
#   geom_polygon(data = right_join(regije.2014,Slovenija, by = c('Regija')),
#                aes(x = long, y = lat, group = group, fill= Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2014') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(8,22))
# zemljevid.2014.regije$labels$fill <- 'Stopnja tveganja revščine'
# 
# #========================================================================================================
# 
# zemljevid.2015.regije <- ggplot() +
#   geom_polygon(data = right_join(regije.2015,Slovenija, by = c('Regija')),
#                aes(x = long, y = lat, group = group, fill= Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2015') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(8,22))
# zemljevid.2015.regije$labels$fill <- 'Stopnja tveganja revščine'
# 
# #========================================================================================================
# 
# zemljevid.2016.regije <- ggplot() +
#   geom_polygon(data = right_join(regije.2016,Slovenija, by = c('Regija')),
#                aes(x = long, y = lat, group = group, fill= Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2016') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(8,22))
# zemljevid.2016.regije$labels$fill <- 'Stopnja tveganja revščine'
# 
# #========================================================================================================
# 
# zemljevid.2017.regije <- ggplot() +
#   geom_polygon(data = right_join(regije.2017,Slovenija, by = c('Regija')),
#                aes(x = long, y = lat, group = group, fill= Odstotki))+
#   xlab("") + ylab("") + ggtitle('Stopnja tveganja revščine glede na statistično regijo 2017') + 
#   theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
#   scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(8,22))
# zemljevid.2017.regije$labels$fill <- 'Stopnja tveganja revščine'
# 
# 
# 

#GRAFI
#========================================================================================================
#========================================================================================================
#========================================================================================================

#PRAG
#========================================================================================================
#========================================================================================================

graf.prag.tveganja <- ggplot((data=prag1), aes(x=Leto, y=Dohodek, col=Tip)) + 
  geom_point() + geom_line() + theme_classic() +  scale_x_continuous('Leto',breaks = seq(2005, 2017, 1), limits = c(2005, 2017))+ theme(legend.position = "top")



#IZOBRAZBA
#========================================================================================================
#========================================================================================================

izobrazba.16 <- filter(izobrazba1, Starost == 'Starost 16+')
izobrazba.16 <- izobrazba.16[c(-1)]

#MOŠKI
#========================================================================================================
izobrazba.16.m <- filter(izobrazba.16, Spol == 'Moški')
izobrazba.16.m <- izobrazba.16.m[c(-2)]

graf.prag.tveganja.izobrazba.m <- ggplot((data=izobrazba.16.m), aes(x=Leto, y=Odstotki, col=Izobrazba)) + 
  geom_point() + geom_line() + theme_classic() +  scale_x_continuous('Leto',breaks = seq(2008, 2017, 1), limits = c(2008, 2017))+  
  scale_y_continuous('Odstotki',breaks = seq(0,40, 2), limits = c(0, 35))+ 
  labs(title='Stopnja tveganja revščine glede na izobrazbo pri moških')
#========================================================================================================

#ŽENSKE
#========================================================================================================
izobrazba.16.z <- filter(izobrazba.16, Spol == 'Ženske')
izobrazba.16.z <- izobrazba.16.z[c(-2)]

graf.prag.tveganja.izobrazba.ž <- ggplot((data=izobrazba.16.z), aes(x=Leto, y=Odstotki, col=Izobrazba))+  
  scale_y_continuous('Odstotki',breaks = seq(0,40, 2), limits = c(0, 35)) + 
  geom_point() + geom_line() + theme_classic() +  scale_x_continuous('Leto',breaks = seq(2008, 2017, 1), limits = c(2008, 2017))+ 
  labs(title='Stopnja tveganja revščine glede na izobrazbo pri ženskah')
#========================================================================================================

#PRIMERJAVA
#========================================================================================================

izobrazba.16.m.s <- izobrazba.16.m
izobrazba.16.z.s <- izobrazba.16.z

izobrazba.16.m.s$Izobrazba <- gsub('Osnovnošolska ali manj', 'Osnovnošolska ali manj moški', izobrazba.16.m.s$Izobrazba)
izobrazba.16.m.s$Izobrazba <- gsub('Srednješolska poklicna', 'Srednješolska poklicna moški', izobrazba.16.m.s$Izobrazba)
izobrazba.16.m.s$Izobrazba <- gsub('Srednješolska strokovna, splošna', 'Srednješolska strokovna, splošna moški', izobrazba.16.m.s$Izobrazba)
izobrazba.16.m.s$Izobrazba <- gsub('Višješolska, visokošolska', 'Višješolska, visokošolska moški', izobrazba.16.m.s$Izobrazba)

izobrazba.16.z.s$Izobrazba <- gsub('Osnovnošolska ali manj', 'Osnovnošolska ali manj ženske', izobrazba.16.z.s$Izobrazba)
izobrazba.16.z.s$Izobrazba <- gsub('Srednješolska poklicna', 'Srednješolska poklicna ženske', izobrazba.16.z.s$Izobrazba)
izobrazba.16.z.s$Izobrazba <- gsub('Srednješolska strokovna, splošna', 'Srednješolska strokovna, splošna ženske', izobrazba.16.z.s$Izobrazba)
izobrazba.16.z.s$Izobrazba <- gsub('Višješolska, visokošolska', 'Višješolska, visokošolska ženske', izobrazba.16.z.s$Izobrazba)


izobrazba.16.s <- rbind(izobrazba.16.m.s,izobrazba.16.z.s)


graf.prag.tveganja.izobrazba.s <- ggplot((data=izobrazba.16), aes(x=Leto, y=Odstotki, col=Izobrazba,shape=Spol))+  
  
  scale_y_continuous('Odstotki',breaks = seq(0,40, 2), limits = c(0, 35)) + 
  
  geom_point() + geom_line() + theme_classic() +  scale_x_continuous('Leto',breaks = seq(2008, 2017, 1), limits = c(2008, 2017))

#========================================================================================================

# #PRAG BREZ INFLACIJE
# #========================================================================================================
# 
# prag.bi <- prag1[seq(1, nrow(prag1), 3), ]
# prag.bi <- prag.bi[c(-1)]
# 
# diskont.2017 = 100/101.4 * 100/99.9 * 100/99.5 * 100/100.2 * 100/101.8 * 100/102.6 * 100/101.8 * 100/101.8 * 100/100.9 
# diskont.2016 = 100/99.9 * 100/99.5 * 100/100.2 * 100/101.8 * 100/102.6 * 100/101.8 * 100/101.8 * 100/100.9 
# diskont.2015 = 100/99.5 * 100/100.2 * 100/101.8 * 100/102.6 * 100/101.8 * 100/101.8 * 100/100.9 
# diskont.2014 = 100/100.2 * 100/101.8 * 100/102.6 * 100/101.8 * 100/101.8 * 100/100.9 
# diskont.2013 = 100/101.8 * 100/102.6 * 100/101.8 * 100/101.8 * 100/100.9
# diskont.2012 = 100/102.6 * 100/101.8 * 100/101.8 * 100/100.9 
# diskont.2011 = 100/101.8 * 100/101.8 * 100/100.9
# diskont.2010 = 100/101.8 * 100/100.9 
# diskont.2009 = 100/100.9 
# 
# 
# 
# 
# prag.bi$Dohodek <- gsub(7628, 7628*diskont.2017, prag.bi$Dohodek)
# prag.bi$Dohodek <- gsub(7396, 7396*diskont.2016, prag.bi$Dohodek)
# prag.bi$Dohodek <- gsub(7399, 7399*diskont.2015, prag.bi$Dohodek)
# prag.bi$Dohodek <- gsub(7146, 7146*diskont.2014, prag.bi$Dohodek)
# prag.bi$Dohodek <- gsub(7111, 7111*diskont.2013, prag.bi$Dohodek)
# prag.bi$Dohodek <- gsub(7273, 7273*diskont.2012, prag.bi$Dohodek)
# prag.bi$Dohodek <- gsub(7199, 7199*diskont.2011, prag.bi$Dohodek)
# prag.bi$Dohodek <- gsub(7042, 7042*diskont.2010, prag.bi$Dohodek)
# prag.bi$Dohodek <- gsub(7118, 7118*diskont.2009, prag.bi$Dohodek)
# 
# 
# #tabela spremembe praga revščine za posameznika brez upoštevanja inflacije glede na prejšne leto 
# prag.bi.spr <-prag.bi
# prag.bi.spr[1,2] <- 0
# for(i in 5:13){
#   prag.bi.spr[i,2] <- as.numeric(prag.bi[i,2])/as.numeric(prag.bi[i-1,2])
# }
# prag.bi.spr <- prag.bi.spr[c(-1,-2,-3),]
# prag.bi.spr[1,2] <- 1
# 
# #tabela diskontiranih sprememb tveganja na začetno leto 2008
# diskont <- prag.bi.spr
# diskont[2,2] <- 1/as.numeric(prag.bi.spr[2,2])
# for (i in 2:10){
#   diskont[i,2] <- as.numeric(diskont[i-1,2])*1/as.numeric(prag.bi.spr[i,2])
# }
# 
# diskont.vrednosti <- izobrazba.16.s
# 
# for (i in 1:80){
#   for (j in 1:10){
#     if (diskont.vrednosti[i,2] == diskont[j,1]){
#       diskont.vrednosti[i,3] <- as.numeric(diskont.vrednosti[i,3])*as.numeric(diskont[j,2])
#     }
#   }
# }
# 
# graf.prag.tveganja.izobrazba.brez.inflacije <- ggplot((data=diskont.vrednosti), aes(x=Leto, y=Odstotki, col=Izobrazba))+  
#   scale_y_continuous('Odstotki',breaks = seq(0,40, 2), limits = c(0, 35)) + 
#   geom_point() + geom_line() + theme_classic() +  scale_x_continuous('Leto',breaks = seq(2008, 2017, 1), limits = c(2008, 2017))+ 
#   labs(title='Stopnja tveganja revščine glede na izobrazbo primerjava brez inflacije')

#PLOTLY
#========================================================================================================

plotly.tabela <- left_join(brezposelnost,regije1,by = c('Regija','Leto')) 
plotly.tabela <- plotly.tabela%>% filter(Odstotki != '')
graf.prag <- ggplot(data = plotly.tabela, aes(x=Odstotki, y=Stopnja.registrirane.brezposelnosti, color=Regija)) + geom_point(aes(frame=Leto, ids=Regija)) + scale_x_log10()
graf.prag <- graf.prag + xlab('Odstotek ljudi ki živijo pod pragom revščine') + ylab('Registrirana stopnja brezposelnosti')
graf.prag <- ggplotly(graf.prag)
#print(graf.prag)


#SHINY ZEMLJEVID
#========================================================================================================


zemljevid.leto <- function(cifra) {
  regije2 <- regije1 %>% filter(Leto==cifra)
  ggplot() + geom_polygon(data = right_join(regije2,Slovenija, by = c('Regija')),
                          aes(x = long, y = lat, group = group, fill= Odstotki))+
    xlab("") + ylab("")  + theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
    scale_fill_gradient(low = '#ffb3b3', high='#660000',limits = c(7,22))
  
}

