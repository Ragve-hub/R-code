momersion <- function(R, n, returnLag = 1) {
  momentum <- sign(R * lag(R, returnLag))
  momentum[momentum < 0] <- 0
  momersion <- runSum(momentum, n = n)/n * 100
  colnames(momersion) <- "momersion"
  return(momersion)
}
