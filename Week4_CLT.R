# Created by Ken, 2017 March 13th
library(ggplot2)
library(gridExtra)
set.seed(1977)
lambda <- 0.2
n <- 40
totalsn <- 1000
listSn <- c(totalsn)
for (i in 1:totalsn) {
  listSn[i] <- mean(rexp(n,lambda))  
}
# Display the distribution is centered by comparison with theoretical center of distribution
var1 <- mean(listSn)
var2 <- 1/lambda
var1
var2
diff1 <- var1 - var2
diff1
# The difference of 1.29% shows they are almost the same

# std
var3 <- sd(listSn)
var4 <- var2/sqrt(40)
diff2 <- var3 - var4

# variance
var5 <- sd(listSn)^2
var6 <- var3^2
diff3 <- var5 - var6

# Show that the distr is normal
dnormx <- seq(0,10,.01)
dnormy <- dnorm(dnormx, 5, var3)
tbSn <- data.frame(listSn)
tbDnorm <- data.frame(dnormx,dnormy)

g1 <- ggplot(tbSn, aes(x=listSn)) + geom_histogram(aes(y=..density..), binwidth=0.5, col="green")
g2 <- g1 + geom_line(data = tbDnorm, aes(x=dnormx,y=dnormy), col = "blue")
g2

confLevel <- mean(listSn) + c(-1,1) * 1.96 * sd(listSn) / sqrt(length(listSn))
