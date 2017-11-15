rm(list=ls())
library(forecast)
library(urca)
library(tseries)
set.seed(123)
t <- 1000
ts <- matrix(NA, t, 1)
ts[1, ] <- rnorm(1)

eps <- rnorm(t)
for(i in 2:nrow(ts)){
  ts[i, ] <- eps[i] + 0.00001 * eps[i-1]
}

ts.plot(diff(ts))
acf(ts)
acf(diff(ts, differences = 1))
pacf(ts)
pacf(diff(ts, differences = 1))


diffs <- 1000
acl1store <- matrix(NA, diffs, 1)

for(i in 1:diffs){
acl1store[i, ] <- acf(diff(ts, differences = i), plot = FALSE)$acf[2]
}

ts.plot(acl1store)


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

