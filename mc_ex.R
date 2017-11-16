# Define transition probabilities
p11 <- 0.1
p12 <- 1-p11

p21 <- 0.5
p22 <- 1-p21

# Starting value for state (result should be independent)
S <- "b"
# Number ahead forecast (enough to stabilize)
nahead <- 20
# How often should this be done
nsave <- 10000
Sstore <- matrix(NA, nsave)
ProbStore <- matrix(NA, 2, nsave)
for (i in 1:nsave){
    S <- "b"
    for(j in 1:nahead){
        if (S == "b"){
        S <- sample(c("a", "b"), size = 1, prob = c(p21, p22))
        }else if (S == "a"){
        S <- sample(c("a", "b"), size = 1, prob = c(p11, p12))
        }
        }
    Sstore[i, ] <- S
    ProbStore[1, i] <- sum(Sstore=="a", na.rm = TRUE)/i
    ProbStore[2, i] <- sum(Sstore=="b", na.rm = TRUE)/i}

plot(ProbStore[1,],type = "l")
lines(ProbStore[2,],type = "l", col = "red")

# Final Probability with 500 burn-in
Sstore <- Sstore[500:nsave,]
sum(Sstore=="a")/(nsave-500)
sum(Sstore=="b")/(nsave-500)

# Theoretical results with transition matrix Gamma
Gamma <- matrix(c(p11, p12, p21, p22), nrow = 2, byrow = TRUE)

# Testing for independence of starting point
library(expm)
start1 <- matrix(c(0, 1), nrow = 1)
start2 <- matrix(c(1, 0), nrow = 1)
chain1 <- sapply(1:nahead,function(t) start1 %*% (Gamma%^%t))
chain2 <- sapply(1:nahead,function(t) start2 %*% (Gamma%^%t))

plot(chain1[1,], type = "l", lwd = 4, col = "yellow")
lines(chain2[1,], col = "red", type = "c")

round(chain1, 6) == round(chain2, 6)
