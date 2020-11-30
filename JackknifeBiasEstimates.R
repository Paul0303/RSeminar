wavelengths <- seq(900, 1700, by = 2)
gasoline.pls <- plsr(octane ~ ., data = gasoline,
                     validation = "LOO", ncomp = 2,
                     jackknife = TRUE)
n <- length(gasoline$octane)
b.oob <- gasoline.pls$validation$coefficients[, , 2, ]
bias.est <- (n-1) * (rowMeans(b.oob) - coef(gasoline.pls))
plot(wavelengths, bias.est, xlab = "wavelength", ylab = "bias",
     type = "h", main = "Jackknife bias estimates",
     col = "gray")

#Erzeugt die rote Linie, var.jack ist Varianz der Jackknife estimation
var.est <- var.jack(gasoline.pls)
lines(wavelengths, var.est, col = "red")
