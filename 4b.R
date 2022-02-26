N <- 6
Tms <- seq(0.5, 3, by = 0.5)
Frd <- c(0.052, 0.056, 0.059, 0.061, 0.06, 0.059)
dT <- 0.5
P <- function(i) {
  sum <- 0
  for (j in 1:i) sum <- sum + dT * Frd[j]
  return(exp(-sum))
}
indices <- 1:N
Pdata <- sapply(indices, P)
Pdata
R <- function(t, T, P) {
  -log(P)/(T - t)
}
Rdata <- array(0, N)
for (j in 1:N) Rdata[j] <- R(0, Tms[j], Pdata[j])
Rdata

csR <- splinefun(Tms, Rdata, method = "monoH.FC")
curve(csR(x, deriv = 0), 0, 3, col = "blue", ylab = "Spot Rate", xlab = "Time")
points(Tms, Rdata, col = "red", cex = 1)
text(1.8, 0.052, labels = "Interpolation of Spot Rates")
