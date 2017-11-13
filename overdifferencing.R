rm(list=ls())
library(forecast)
library(urca)
library(tseries)
set.seed(123)
t <- 1000
ts <- matrix(NA, t, 1)
ts[1, ] <- rnorm(1)
for(i in 2:nrow(ts)){
  ts[i, ] <- 0.8 * ts[i-1, ] + rnorm(1)
}

ts.plot(ts)

acf(ts)
pacf(ts)

diffs <- 1000
acl1store <- matrix(NA, diffs, 1)

for(i in 1:diffs){
acl1store[i, ] <- acf(diff(ts, differences = i), plot = FALSE)$acf[2]
}


test <- 1000
pstore <- matrix(NA, test, 2)
colnames(pstore) <- c("DF", "PP")

pb <- txtProgressBar(min = 0, max = test)
for(i in 1:test){
  dts <- diff(ts, i)
  pstore[i, 1] <- adf.test(dts, k = 0)$p.value
  pstore[i, 2] <- pp.test(dts, lshort = TRUE)$p.value
  setTxtProgressBar(pb, value = i)
}

library(foreach)
test2 <- foreach(i=1:test, .combine='c', .packages="tseries") %dopar% adf.test(diff(ts,i))$p.value

acf(tsdiff)
pacf(tsdiff)

