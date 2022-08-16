##########################################################################################
############################ Data cleaning and organization ##############################
##########################################################################################

# The first step is to convert the absorbance data into a data frame and input additional 
#information about the data such as TCBZ concentrations tested, experiment identification, 
#position in the plate, identification of replicate and so on.   
#The goal here is to produce one data set containing all relevant information for 
#subsequent data analysis. 

# Loading packages

library(plater) # plater is a package to convert 96 well reads into a tyde format 
                #kepping well position identification

# Loading data

EXP1 <-  read_plate(file = "data/raw/MTT_TC_THP1_EXP1.csv", 
                    well_ids_column = "Wells", sep = ",")
EXP2 <-  read_plate(file = "data/raw/MTT_TC_THP1_EXP2.csv", 
                    well_ids_column = "Wells", sep = ",")
EXP3 <-  read_plate(file = "data/raw/MTT_TC_THP1_EXP3.csv", 
                    well_ids_column = "Wells", sep = ",")

# Data structute check

head(EXP1) # The 96 well plate contains 8 rows and 12 colums. Each row correspond a
           #technical replicate of  one of TCBZ doses distribuited among the 12 columns 


# Aditional information

## Experiment 1

EXP1$conc <-  rep(c("0.000","0.485","0.970",                       # tested concentrations
                     "1.950","3.900","7.800",
                     "15.600","31.250","62.500",
                     "125.000","250.000","500.000"), 8)

EXP1$rep_tec <- c(rep_len(1, 12), rep_len(2,12), rep(3, 12),       # replicates ID
                  rep_len(4,12) , rep_len (5,12), rep_len (6,12),
                  rep_len (7,12), rep_len (8,12))

EXP1$experiment <- "EXP_1"                                         # Experiment ID  

## Experiment 2

EXP2$conc <-  rep(c("0.000","0.485","0.970",                       # tested concentrations
                    "1.950","3.900","7.800",
                    "15.600","31.250","62.500",
                    "125.000","250.000","500.000"), 8)

EXP2$rep_tec <- c(rep_len(1, 12), rep_len(2,12), rep(3, 12),       # replicates ID
                  rep_len(4,12) , rep_len (5,12), rep_len (6,12),
                  rep_len (7,12), rep_len (8,12))

EXP2$experiment <- "EXP_2"                                         # Experiment ID

## Experiment 3

EXP3$conc <-  rep(c("0.000","0.485","0.970",                       # tested concentrations
                    "1.950","3.900","7.800",
                    "15.600","31.250","62.500",
                    "125.000","250.000","500.000"), 8)

EXP3$rep_tec <- c(rep_len(1, 12), rep_len(2,12), rep(3, 12),       # replicates ID
                  rep_len(4,12) , rep_len (5,12), rep_len (6,12),
                  rep_len (7,12), rep_len (8,12))

EXP3$experiment <- "EXP_3"                                         # Experiment ID  


MTT_TC_THP1_Full  <- rbind(EXP1, EXP2, EXP3)

# CSV exportation

write.csv(MTT_TC_THP1_Full, file = "data/processed/MTT_TC_THP1_Full.csv", sep = ",", 
          row.names = F)

