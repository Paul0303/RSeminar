B <- 1000
mineralien <- seq(1, 11, by = 1)
nmin <- nrow(mineraldaten)
boot.indices <- 
  matrix(sample(1:nmin, nmin * B, replace = TRUE), ncol = B)
npc <- 4
min.pcr <- pcr(Gesamt.Mineralieninmg.Liter ~., data = mineraldaten, ncomp = npc)
coefs <- matrix(0, ncol(mineraldaten)-1, B)
for (i in 1:B) {
min.bootpcr <- pcr(Gesamt.Mineralieninmg.Liter ~., data = mineraldaten,
               ncomp = npc, subset = boot.indices[, i])
coefs[, i] <- c(coef(min.bootpcr))
}

matplot(mineralien, coefs, type = "l",
        ylab = "Coefficients", xlab = "Mineralien")
abline(h = 0, col = "gray")
polygon(c(mineralien, rev(mineralien)),
          c(apply(coefs, 1, max), rev(apply(coefs, 1, min))),
          col = "steelblue", border = NA)

coef.stats <- cbind(apply(coefs, 1, quantile, .025),
                    apply(coefs, 1, quantile, .975))
matplot(mineralien, coef.stats, type = "n",
        xlab = "Mineralien",
        ylab = "Regressionskoeffizienten")
abline(h = 0, col = "grey")
polygon(c(mineralien, rev(mineralien)),
        c(coef.stats[, 1], rev(coef.stats[, 2])),
        col = "pink", border = NA)
lines(mineralien, c(coef(min.pcr)))