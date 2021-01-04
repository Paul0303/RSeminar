min.pcr.bootCI <-
  boot(mineraldaten,
       function(x, ind) {
         c(coef(pcr(Gesamt.Mineralieninmg.Liter ~., data = x,
                    ncomp = npc, subset = ind)))},
       R = 999)

dim(min.pcr.bootCI$t)

highest <- which.max(min.pcr.bootCI$t0)
plot(min.pcr.bootCI, index = highest)

boot.ci(boot.out = min.pcr.bootCI, type = c("perc", "bca"))
