## Ox tutorial
rm(list=ls())
setwd("~/pCloudDrive/Aarhus/TS/")
library(readxl)
library(forecast)
house <- read_excel("~/pCloudDrive/Aarhus/TS/HOUSTNSA_homework.xlsx")

# house <- ts(house[,2], frequency = 12, start = c(1959, 1))
# hmat <- as.matrix(house[,2], ncol = 1)
# hmat <- cbind(t = 1:nrow(hmat), t2 = (1:nrow(hmat))^2, hmat)
# 
# mod <- arima(HOUSTNSA, oder = c() )
# 
# automod <- auto.arima(data.frame(hmat))
# summary(automod)
# plot(resid(automod))

y <- as.matrix(house, ncol = 1)
y <- matrix(as.numeric(y[,2]), ncol = 1)
y <- log(y)

trendf <- function(t){
  x <- matrix(1, nrow(y))
  trend <- 1:nrow(y)
  for(i in 1:t){
    x <- as.matrix(cbind(x, trend^i))
  }
  return(x)
}

seasons <- diag(1, 12)
for(i in 1:58){
  seasons <- rbind(seasons, diag(1,12))
}
seasons <- seasons[1:nrow(y), 1:11]

model <- function(t){
  x <- trendf(t)
  mod <- lm(y ~ x + seasons -1)
  return(mod)
  }
sums <- function(mod){
  a <-AIC(mod)
  b <- BIC(mod)
  s <- summary(mod)
  return(list(AIC = a, BIC = b, summary = s))
}
a <- lm(y~x)

m1 <- model(1)
sums(m1)
m2 <- model(2)
sums(m2)
m3 <- model(3)
sums(m3)
m4 <- model(4)
sums(m4)

plotmod <- function(mod){
  par(mfrow = c(3,1))
  plot(y, type = "l")
  plot(fitted(mod), type = "l")
  plot(resid(mod), type = "l")
  }

plotmod(m1)
plotmod(m2)
plotmod(m3)

armod <- auto.arima(resid(m4), ic ="bic")
summary(armod)
plotmod(armod)

