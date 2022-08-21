##########################################################################################
############################### Exploratory Data Analysis ################################
##########################################################################################

# Packages

library(scales)
library(dplyr)
library(skimr)
library(rstatix)
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
MTT_TC_THP1$PositionScore<- as.factor(MTT_TC_THP1$PositionScore)
sapply(MTT_TC_THP1, class)

# Reescaling data

MTT_TC_THP1$values <- rescale(MTT_TC_THP1$values, c(0,1))

# Summary

MTT_TC_THP1%>%
  group_by(conc)%>%
  select(values)%>%
  skim()


#Summary conditioning considering drug concentration and Position score

MTT_TC_THP1%>%
  group_by(conc, PositionScore)%>%
  select(values)%>%
  skim()


# Finding outliers

MTT_TC_THP1%>%
  group_by(conc)%>%
  identify_outliers(values)

# Removing outliers

outliers <- c(102, 272)
MTT_TC_THP1 <- MTT_TC_THP1[-outliers,]

# Exploratory data analysis

MTT_BP <-  ggplot(MTT_TC_THP1, aes(conc, values))+
  geom_boxplot()+
  ggtitle("Box plot of THP-1 viability per TCBZ dose") +
    labs(x = " Conc [   ] μM", y = "Absorbance")+
  theme(plot.title = element_text(size = 14,face="bold"),
        axis.text.x = element_text(size = 10), 
        axis.text.y = element_text(size = 10),
        axis.title.x = element_text(size = 15),
        axis.title.y = element_text(size = 15))+
  theme_bw()

MTT_BP

# Overall samples central mesures visualization

ggsave("figs/02_MTT_tcbz_BP.jpeg", dpi = 300 )

MTT_BP_PE <-  ggplot(MTT_TC_THP1, aes(PositionScore, values))+
  geom_boxplot()+
  ggtitle("Box plot of THP-1 viability per TCBZ dose") +
  labs(x = " Position score related to the plate boarder", y = "Absorbance")+
  theme(plot.title = element_text(size = 14,face="bold"),
        axis.text.x = element_text(size = 10), 
        axis.text.y = element_text(size = 10),
        axis.title.x = element_text(size = 15),
        axis.title.y = element_text(size = 15))+
  theme_bw()+
  facet_wrap(MTT_TC_THP1$conc)
  
MTT_BP_PE

# Samples central measures visualization by position inside 96 Well plate
ggsave("figs/02_MTT_tcbz_BP_PE.jpeg", dpi = 300 )

write.csv(MTT_TC_THP1, file = "data/processed/02_MTT_TC_THP1.csv", 
          sep = ",", row.names = F)

