MinGehalt <- seq(0, 149, by = 1)
mineralwasser.pls <- plsr(Natrium ~., data = Mineralwasser, validation = "LOO",
                             ncomp = 2,
                             jackknife = TRUE)
n <- length(Mineralwasser$Natrium)
b.oob <- mineralwasser.pls$validation$coefficients[, , 2, ]
bias.est <- (n-1)*(rowMeans(b.oob)-coef(mineralwasser.pls))
plot(MinGehalt, bias.est, xlab = "Mingehalt (mg)", ylab = "bias",
     type = "h", main = "Jackknife bias estimates",
     col = "gray")

var.est <- var.jack(mineralwasser.pls)
lines(MinGehalt, var.est, col = "red")