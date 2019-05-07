prag.n <- prag1[seq(1, nrow(prag1), 3), ]
prag.n <- prag.n[c(-1)]

napoved <- lm(data=prag.n, Dohodek ~Leto)
dodatna.leta <- data.frame(Leto=seq(2018,2020,1))
napoved.praga<-mutate(dodatna.leta, Dohodek=predict(napoved,dodatna.leta))

graf.napovedi.praga <- ggplot(prag.n, aes(x=Leto, y=Dohodek)) + geom_point(data=napoved.praga, inherit.aes = TRUE) + 
  geom_smooth(method=lm, fullrange=TRUE, color='green') + geom_point() + scale_x_continuous('Leto',breaks = seq(2005, 2020, 1), limits = c(2005, 2020))




prag.n.r <- prag1[seq(1, nrow(prag1), 3), ]
prag.n.r <- prag.n.r[c(-1)]
prag.n.r <- prag.n.r[-c(1,2,3,4),]

napoved <- lm(data=prag.n.r, Dohodek ~Leto)
dodatna.leta <- data.frame(Leto=seq(2018,2020,1))
napoved.praga<-mutate(dodatna.leta, Dohodek=predict(napoved,dodatna.leta))

graf.napovedi.praga.realne <- ggplot(prag.n.r, aes(x=Leto, y=Dohodek)) + geom_point(data=napoved.praga, inherit.aes = TRUE) + 
  geom_smooth(method=lm, fullrange=TRUE, color='green') + geom_point() + scale_x_continuous('Leto',breaks = seq(2009, 2020, 1), limits = c(2009, 2020))

