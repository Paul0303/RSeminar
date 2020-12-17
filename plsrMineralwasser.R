mineralwasser.pls <- plsr(Gesamt.Mineralieninmg.Liter ~ ., data = mineraldaten, validation = "LOO",
                          ncomp = 3)
par(mfrow = c(1, 2))
plot(mineralwasser.pls, "validation", estimate = "CV")
par(pty = "s")
plot(mineralwasser.pls, "prediction", ncomp = 3)
abline(0, 1, col = "gray")
#plot(mineralwasser.pls, "loading", comps = 1:3, legendpos = "topleft",
#     lty = 1, col = 1:3)

mineralien <- seq(1, 11, by = 1)
mineralwasser.pcr <- pcr(Gesamt.Mineralieninmg.Liter ~., data = mineraldaten,
                         ncomp = 5)
plot(mineralien, coef(mineralwasser.pcr), type = "l",
     xlab = "Mineralien", ylab = "Regression coefficient")
abline(h = 0, col = "gray")
