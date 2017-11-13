rm(list=ls())

# Preliminaries

N <- 10000
Ti <- 500 
a <- 1
set.seed(1234)

reps <- 20

ntot <- reps * N

t_store <- matrix(NA, N, 1)
quantile_store <- matrix(NA, reps, 2)

#pb <- txtProgressBar(max = ntot, style = 3)

Ns <- c(25, 50, 100, 250)

t25_store <- matrix(NA, Ns[1], 1)
t50_store <- matrix(NA, Ns[2], 1)
t100_store <- matrix(NA, Ns[3], 1)
t250_store <- matrix(NA, Ns[4], 1)

q25_store <- matrix(NA, reps, 2)
q50_store <- matrix(NA, reps, 2)
q100_store <- matrix(NA, reps, 2)
q250_store <- matrix(NA, reps, 2)


for(N in Ns){
  
  t_store <- matrix(NA, N, 1)
  
  
for(qrep in 1:reps){

for(nrep in 1:N){
# Draw randomness
eps <- rnorm(Ti)
# Generate Data
Y <- matrix(NA, Ti, 1)
Y[1,1] <- eps[1]
for (irep in 2:Ti){
  Y[irep, 1] <- Y[irep-1,1] + eps[irep] 
}
# Generate first difference
dY <- matrix(NA, (Ti-1), 1)
for (jrep in 1:(Ti-1)){
  dY[jrep, 1] <- Y[jrep + 1, 1] - Y[jrep, 1]
}
# Adjust data length for regression
Yreg <- Y[1:499, 1]
# Do the regression to obtain t-test 

mod <- lm(dY~0+Yreg)

t_store[nrep, 1] <- summary(mod)$coefficients[3]

}

  quantile_store[qrep, ] <- quantile(t_store, probs = c(0.01, 0.05))

}
  if(N == 25){
    t25_store <- t_store
    q25_store <- quantile_store
  }else if(N == 50){
    t50_store <- t_store
    q50_store <- quantile_store
  }else if(N== 100){
    t100_store <- t_store
    q100_store <- quantile_store
  }else if(N == 250){
    t250_store <- t_store
    q250_store <- quantile_store
  }
  print(N)
}


colMeans(quantile_store)

setwd("P:/Aarhus/TS")
save(quantile_store, file = "quantiles_10000.RData")
save(t_store, file = "t_10000.RData")
