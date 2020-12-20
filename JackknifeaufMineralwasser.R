MinGehalt <- 
#c("Natrium", "Kalium", "Magnesium", "Calcium", "Mangan", "Chlorid", "Sulfat", "Hydrogencarbonat", "Nitrat", "Nitrit", "Fluorid")
seq(1, 11, by = 1)
mineralwasser.pls <- plsr(Gesamt.Mineralieninmg.Liter ~.,data = mineraldaten, validation = "LOO",
                             ncomp = 2,
                             jackknife = TRUE)
n <- length(Mineralwasser$Gesamt.Mineralieninmg.Liter)
b.oob <- mineralwasser.pls$validation$coefficients[, , 2, ]
bias.est <- (n-1)*(rowMeans(b.oob)-coef(mineralwasser.pls))
plot(MinGehalt, bias.est, xlab = "Mineralien", ylab = "bias",
     type = "b", main = "Jackknife bias estimates",
     col = "blue", xgap.axis = 1)

var.est <- var.jack(mineralwasser.pls)
lines(MinGehalt, var.est, col = "red")

legend("topright", legend = c("Bias", "Varianz"), lty = 1, lwd = 2,
       col = c("blue", "red"))
