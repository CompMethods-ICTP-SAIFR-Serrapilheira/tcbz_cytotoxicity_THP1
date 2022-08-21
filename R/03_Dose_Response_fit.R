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

#Sumarizing 
MTT_TC_THP1_SUM <- MTT_TC_THP1%>%
  group_by(conc, experiment)%>%
  summarise(mean_value = mean(values), sd_value = sd(values))

# Ajusting the models

THP1_TCBZ.LL4 <- drm(mean_value ~ conc, data = MTT_TC_THP1_SUM , fct = LL.4())
plot(THP1_TCBZ.LL4, xlim = c(0,1000), ylim = c(0,0.7), 
     broken = TRUE, gridsize = 100, xlab = "Triclabendazol [  ] μM", 
     ylab = "Absorbance", type = "bars")


## Exploring predicted model

newdata <- expand.grid(conc = seq(min(MTT_TC_THP1_SUM$conc), max(MTT_TC_THP1_SUM$conc),
                                    length.out = 200),
                       experiment = unique(MTT_TC_THP1_SUM$experiment))
newdata$mean_value <- predict(THP1_TCBZ.LL4, newdata, type = 'response')

DoseResponseCurve <- ggplot(mapping = aes(x = log(conc,10) , y = mean_value, colour = experiment)) +
  geom_point(data = MTT_TC_THP1_SUM) +  geom_line(data = newdata) +
  ggtitle("Dose response THP-1 to TCBZ") +
  labs(x = " Log10 [   ] μM", y = "Absorbance")+
  theme(plot.title = element_text(size = 14,face="bold"),
        axis.text.x = element_text(size = 10), 
        axis.text.y = element_text(size = 10),
        axis.title.x = element_text(size = 15),
        axis.title.y = element_text(size = 15))+
  theme_bw()

DoseResponseCurve

ggsave("figs/03_DoseResponseCurve.jpeg", dpi = 300 )

#  Fit diagnostic

par(mfrow=c(1,3), cex.lab=1.2)
plot(MTT_TC_THP1_SUM$mean_value, fitted(THP1_TCBZ.LL4), main="LL4", 
     xlab ="Adjusted values", ylab="Observed values", pch=16, cex=.7)
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

png("figs/03_Fit_diagnostic.png",  width = 6, height = 4, units = "in", res = 300)


# Summary

summary(THP1_TCBZ.LL4)
confint(THP1_TCBZ.LL4)

