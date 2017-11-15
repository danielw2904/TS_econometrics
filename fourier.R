rm(list = ls())
house <- read_excel("~/pCloudDrive/Aarhus/TS/HOUSTNSA_homework.xlsx")
h.ts <- ts(house$HOUSTNSA, frequency = 12, start = c(1959,1))

n <- length(h.ts)

L.y <- 12
n.y <- n2/L.y

t2 <- c(1:6)
t22 <- t2^2

fourier2 <- function(K, nx){
  lambda <- 2*pi*1:K/(2*K)
  fmat <- matrix(NA, ncol = K*2, nrow = K)
  for(i in 1:K){
    temp <- i * lambda
    sintemp <- sin(temp)
    costemp <- cos(temp)
    fmat[ , (2*i)-1] <- sintemp
    fmat[ , 2*i] <- costemp
  }
  fmat <- rbind(fmat, -fmat)
  # stacks <- round((nx/(2*K))+1)
  # fmat2 <- fmat
  # for (j in 1:stacks){
  #   fmat2 <- rbind(fmat2, fmat)
  # }
  # fmat2 <- fmat2[1:nx, ]
  return(fmat)
}

testing <- fourier2(3, 701)


t1.p <- 2*pi*1:2/4 # lambda
t1.p <- t1.p[1:701]
t2.p <- 2*t1.p
t3.p <- 3*t1.p

s2.t <- sin(t1.p)
c2.t <- cos(t1.p)

s4.t <- sin(t2.p)
c4.t <- cos(t2.p)

s8.t <- sin(t3.p)
c8.t <- cos(t3.p)

ts2.t <- t2 * s2.t
tc2.t <- t2 * c2.t

h.lm <- lm(h.ts ~-1+ s2.t + c2.t) 
plot(fitted(h.lm), type = "l")
summary(h.lm)
plot(resid(h.lm), type ="l")

plot(resid(lm(h.ts~1)), type = "l")

a <- fourier(h.ts, 6)
a
test <- lm(h.ts ~ 0 + a)
ts.plot(resid(test))
