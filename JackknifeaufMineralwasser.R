MinGehalt <- 
#c("Natrium", "Kalium", "Magnesium", "Calcium", "Mangan", "Chlorid", "Sulfat", "Hydrogencarbonat", "Nitrat", "Nitrit", "Fluorid")
seq(1, 11, by = 1)
mineralwasser.pls <- plsr(Gesamt.Mineralieninmg.Liter ~.,data = mineraldaten, validation = "LOO",
                             ncomp = 2,
                             jackknife = TRUE)
n <- length(Mineralwasser$Natrium)
b.oob <- mineralwasser.pls$validation$coefficients[, , 2, ]
bias.est <- (n-1)*(rowMeans(b.oob)-coef(mineralwasser.pls))
plot(MinGehalt, bias.est, xlab = "Mineralien", ylab = "bias",
     type = "l", main = "Jackknife bias estimates",
     col = "gray")

var.est <- var.jack(mineralwasser.pls)
lines(MinGehalt, var.est, col = "red")