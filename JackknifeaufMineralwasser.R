MinGehalt <- seq(1, 133, by = 1)
mineralwasser.pls <- plsr(X1 ~.,data = mineraldatenT, validation = "LOO",
                             ncomp = 5,
                             jackknife = TRUE)
n <- length(Mineralwasser$Natrium)
b.oob <- mineralwasser.pls$validation$coefficients[, , 5, ]
bias.est <- (n-1)*(rowMeans(b.oob)-coef(mineralwasser.pls))
plot(MinGehalt, bias.est, xlab = "Mingehalt (mg)", ylab = "bias",
     type = "l", main = "Jackknife bias estimates",
     col = "gray")

var.est <- var.jack(mineralwasser.pls)
lines(MinGehalt, var.est, col = "red")