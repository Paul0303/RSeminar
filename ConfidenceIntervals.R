B <- 1000
mineralien <- seq(1, 11, by = 1)
nmin <- nrow(mineraldaten)
boot.indices <- 
  matrix(sample(1:nmin, nmin * B, replace = TRUE), ncol = B)
npc <- 4
min.pcr <- pcr(Gesamt.Mineralieninmg.Liter ~., data = mineraldaten, ncomp = npc)
coefs <- matrix(0, ncol(mineraldaten)-1, B)
for (i in 1:B) {
min.pcr <- pcr(Gesamt.Mineralieninmg.Liter ~., data = mineraldaten,
               ncomp = npc, subset = boot.indices[, i])
coefs[, i] <- c(coef(min.bootpcr))
}

matplot(mineralien, coefs, type = "n",
        ylab = "Coefficients", xlab = "Mineralien")
abline(h = 0, col = "gray")
polygon(c(mineralien), rev(mineralien),
          c(apply(coefs, 1, max)), rev(apply(coefs, 1, min)),
          col = "steelblue", border = NA)

