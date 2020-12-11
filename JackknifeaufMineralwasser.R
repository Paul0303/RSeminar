wavelengths <- seq(0, 149, by = 1)
mineralwasser.pls <- plsr(Nitrat ~ ., data = Mineralwasser, validation = "LOO",
                             ncomp = 5,
                             jackknife = TRUE)
n <- length(Mineralwasser$Natrium)
b.oob <- mineralwasser.pls$validation$coefficients[, , 5, ]
bias.est <- (n-1)*(rowMeans(b.oob)-coef(mineralwasser.pls))
plot(wavelengths, bias.est, xlab = "wavelength", ylab = "bias",
     type = "h", main = "Jackknife bias estimates",
     col = "gray")

var.est <- var.jack(mineralwasser.pls)
lines(wavelengths, var.est, col = "red")