B <- 500
nmin <- nrow(mineraldatenT)
boot.indices <-
  matrix(sample(1:nmin, nmin*B, replace = TRUE), ncol = B)
# c <- sort(boot.indices[, 1])[1:20]

npc <- 6
predictions <- array(NA, c(nmin, npc, B))
for (i in 1:B) {
  min.bootpcr <- pcr(X1 ~., data = mineraldatenT,
                     ncomp = npc, subset = boot.indices[, i])
  oobs <- (1:nmin)[-boot.indices[, i]]
  predictions[oobs, , i] <-
    predict(min.bootpcr, 
            newdata = mineraldatenT[oobs, ])[, 1, ]
  
}
diffs <- sweep(predictions, 1, mineraldatenT$X1)
sqerrors <- apply(diffs^2, c(1, 2),mean, na.rm = TRUE)
sqrt(colMeans(sqerrors))


min.pcr <- pcr(X1 ~ ., data = mineraldatenT, ncomp = npc)
RMSEP(min.pcr, intercept = FALSE)
error.632 <- .368 * colMeans(min.pcr$residuals^2) + .632 * colMeans(sqerrors)
sqrt(error.632)


min.pcr.cv <- pcr(X1 ~ ., data = mineraldatenT, ncomp = npc, 
                  validation = "CV")
min.pcr.loo <- pcr(X1 ~ ., data = mineraldatenT, ncomp = npc, 
                  validation = "LOO")
bp <- barplot(sqrt(error.632),
              ylim = c(0, 80), col = "peachpuff")
lines(bp, sqrt(c(min.pcr.cv$validation$PRESS) / nmin),
      col = 2, lwd = 2)
lines(bp, sqrt(c(min.pcr.loo$validation$PRESS) / nmin),
      col = 4, lty = 2, lwd = 2)
legend("topright", lty = 1:2, col = c(2, 4), lwd = 2,
       legend = c("CV", "LOO"))
