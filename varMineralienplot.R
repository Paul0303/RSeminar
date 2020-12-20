Mins <- seq(1, 11, by = 1)
varmin <- c(1:11)

for (i in 1:11) {
  varmin[i] <- var(mineraldaten[, i+1])
}

barplot(varmin, Mins, xlab = "Mineralien", ylab = "Varianz", col = "peachpuff",
        width = 0.5, space = 0.5)
#plot(c(1:134), mineraldaten[, 8])
