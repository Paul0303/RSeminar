B <- 500
nmin <- nrow(Mineralwasser)
boot.indices <-
  matrix(sample(1:nmin, nmin*B, replace = TRUE), ncol = B)
# c <- sort(boot.indices[, 1])[1:20]

