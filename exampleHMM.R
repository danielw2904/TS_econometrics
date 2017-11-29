rm(list = ls())
Gamma <- matrix(c(.6, .4, .3, .7), byrow = TRUE, nrow = 2)
delta <- matrix(c(.8, .2), nrow = 2)
R <- matrix(c(.3, .4), nrow = 1)
W <- matrix(c(.4, .3), nrow = 1)
B <- matrix(c(.3, .3), nrow = 1)

a1 <- matrix(diag(delta %*% R), nrow = 1)

a2 <- diag(t(a1 %*% Gamma) %*% W)
a2


a3 <- diag(t(a2 %*% Gamma) %*% B)
a3

a4 <- diag(t(a3 %*% Gamma) %*% B)
a4


plot(function(x)0.5*dnorm(x) + 0.5*dnorm(x,mean = 3), xlim = c(-3,6), ylim= c(0,1))



