npc <- 4
min.pcr.bootCI <-
  boot(mineraldaten,
       function(x, ind) {
         c(coef(pcr(Gesamt.Mineralieninmg.Liter ~., data = x,
                    ncomp = npc, subset = ind)))},
       R = 999)
dim(min.pcr.bootCI$t)
smallest <- which.min(min.pcr.bootCI$t0)
plot(min.pcr.bootCI, index = smallest)
