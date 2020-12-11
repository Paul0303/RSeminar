mineralwasser.pls <- plsr(Natrium ~ ., data = Mineralwasser, validation = "LOO",
                          ncomp = 10)
par(mfrow = c(1, 2))
plot(mineralwasser.pls, "validation", estimate = "CV")
par(pty = "s")
plot(mineralwasser.pls, "prediction", ncomp = 3)
abline(0, 1, col = "gray")
#plot(mineralwasser.pls, "loading", comps = 1:3, legendpos = "topleft",
#     lty = 1, col = 1:3)