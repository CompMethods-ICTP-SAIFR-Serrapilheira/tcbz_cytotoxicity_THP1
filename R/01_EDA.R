##########################################################################################
############################### Exploratory Data Analysis ################################
##########################################################################################

# Packages
library(scales)
library(ggplot2)

# Loading data 

MTT_TC_THP1 <- read.csv(file = "data/processed/MTT_TC_THP1_Full.csv", 
                        header = TRUE, sep =",")

# Checking data
head(MTT_TC_THP1)
sapply(MTT_TC_THP1, class)
MTT_TC_THP1$Wells <- as.factor(MTT_TC_THP1$Wells)
MTT_TC_THP1$experiment <- as.factor(MTT_TC_THP1$experiment)
MTT_TC_THP1$conc<- as.factor(MTT_TC_THP1$conc)
sapply(MTT_TC_THP1, class)

# Reescaling data

MTT_TC_THP1$values <- rescale(MTT_TC_THP1$values, c(0,100))

# Exploratory data analysis

MTT_BP <-  ggplot(MTT_TC_THP1, aes(conc, values))+
  geom_boxplot()+
  labs(x = " Conc [ ] μM", y = "Growth (%)")+
  theme(plot.title = element_text(size = 14,face="bold"),
        axis.text.x = element_text(size = 10), 
        axis.text.y = element_text(size = 10),
        axis.title.x = element_text(size = 15),
        axis.title.y = element_text(size = 15))+
  theme_bw()

MTT_BP

# Summary

summary(MTT_TC_THP1$values)
