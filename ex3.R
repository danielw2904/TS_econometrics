x <- c(1:5, 13:17)

lambdj <- function(j){
  return((2*pi*j/12))
}
j <- 1:6

lambdas <- lambdj(j)
lambdas

house <- read_excel("~/pCloudDrive/Aarhus/TS/HOUSTNSA_homework.xlsx")


gamma_1 <- cos(lambdas[1]) + sin(lambdas[1]) + rnorm(1)

gamma_star_1 <- -sin(lambdas[1]) + cos(lambdas[1])


x1 <- 2*cos(2*pi*1:100*6/100) + 3*sin(2*pi*1:100*6/100)
x2 <- 4*cos(2*pi*1:100*10/100) + 5*sin(2*pi*1:100*10/100)
x3 <- 6*cos(2*pi*1:100*40/100) + 7*sin(2*pi*1:100*40/100)

x <- x1 + x2 + x3

plot(x, type = "l")
library(TSA)
periodogram(x)

P = Mod(2*fft(x)/100)^2
Fr = 0:99/100
plot(Fr, P, type = "o")

plot(x2, type = "l")
plot(x3, type = "l")


Phouse <- Mod(2*fft(as.numeric(house$HOUSTNSA))/nrow(house))^2
Fr = 0:(nrow(house)-1)/(nrow(house))
plot(Fr, Phouse, type="l")
periodogram(house$HOUSTNSA)

y <- house$HOUSTNSA

lambdj <- function(j){
  return((2*pi*j/12))
}
j <- 1:(12/2)

lambdas <- lambdj(j)
lambdas

?bsts
ss <- AddLocalLevel(list(), y)
ss <- AddTrig(ss, y, period = 12, frequencies = 1)

ss <- AddSeasonal(ss, y, nseasons = 12)
model <- bsts(y, ss, niter = 250)
model

?bsts
plot(model)

mu <- matrix(NA, l)

dat <- data.frame(y)

test <-ucm(y~0, data = dat,slope = TRUE, cycle = TRUE, cycle.period = 12)

summary(test$s.season)

plot(test$vs.cycle)
test$est.var.cycle
