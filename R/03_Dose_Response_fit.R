##########################################################################################
################################# THP-1 Citotoxicity #####################################
##########################################################################################

library(dplyr)
library(ggplot2) 
library(drc)

# Loading data 

MTT_TC_THP1 <- read.csv(file = "data/processed/02_MTT_TC_THP1.csv", header = TRUE, sep = ,)

# Checking data
head(MTT_TC_THP1)
sapply(MTT_TC_THP1, class)
MTT_TC_THP1$Wells <- as.factor(MTT_TC_THP1$Wells)
MTT_TC_THP1$experiment <- as.factor(MTT_TC_THP1$experiment)
MTT_TC_THP1$PositionScore<- as.factor(MTT_TC_THP1$PositionScore)
sapply(MTT_TC_THP1, class)

# Ajusting the models

THP1_TCBZ.LL4 <- drm(values ~ conc, data = MTT_TC_THP1 , fct = LL.4())
plot(THP1_TCBZ.LL4, xlim = c(0,1000), ylim = c(0,100), 
     broken = TRUE, gridsize = 100, xlab = "Triclabendazol [  ] μM", 
     ylab = "THP-1 Citotoxicity (%)")

jpeg("figs/03_LL4_DoseResponse_Fit.jpeg")


#  Fit diagnostic

par(mfrow=c(1,3), cex.lab=1.2)
plot(MTT_TC_THP1$values, fitted(THP1_TCBZ.LL4), main="LL4", 
     xlab ="Observed values", ylab="Adjusted values", pch=16, cex=.7)
abline(a = 0,b = 1)
residuals(THP1_TCBZ.LL4, typeRes = c("studentised"))
plot(fitted(THP1_TCBZ.LL4),residuals(THP1_TCBZ.LL4, 
                                     typeRes = c("studentised")), main="LL4", xlab="Adjusted values", 
     ylab="Residuals", pch=16, cex=.7)
lines(loess.smooth(fitted(THP1_TCBZ.LL4), 
                   residuals(THP1_TCBZ.LL4, typeRes = c("studentised"))))
abline(h=0, lty=2)
qqnorm(residuals(THP1_TCBZ.LL4), xlab="Theoretical quantiles", ylab="Residuals", main = "LL4")
qqline(residuals(THP1_TCBZ.LL4))

jpeg("figs/03_Fit_diagnostic.jpeg")


