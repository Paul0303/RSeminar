data(gasoline)
wavelengths <- seq(900, 1700, by = 2)
matplot(wavelengths, t(gasoline$NIR), type = "l",
        lty = 1, xlab = "Wavelength (nm)", ylab = "1/R")
a <- gasoline$NIR